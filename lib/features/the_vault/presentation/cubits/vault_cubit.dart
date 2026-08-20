import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/services/hive_service.dart';
import 'vault_state.dart';

class VaultCubit extends Cubit<VaultState> {
  Timer? _timer;

  VaultCubit() : super(const VaultState());

  void loadGameData(String langCode) {
    final box = Hive.box(HiveService.gameBoxName);
    final gameData = box.get('the_vault');

    if (gameData != null && gameData['questions'] != null) {
      List<dynamic> rawQuestions = gameData['questions'];
      List<Map<String, dynamic>> parsedQuestions = rawQuestions.map((q) {
        return {
          'instruction': q['instruction'][langCode] ?? q['instruction']['en'],
          'clue': q['clue'][langCode] ?? q['clue']['en'],
          'answer': q['answer'].toString(),
          'hint': q['hint'][langCode] ?? q['hint']['en'],
        };
      }).toList();

      parsedQuestions.shuffle();
      emit(state.copyWith(questions: parsedQuestions, currentQuestionIndex: 0));
    }
  }

  void incrementPlayers() {
    if (state.playerCount < 10) {
      emit(state.copyWith(playerCount: state.playerCount + 1));
    }
  }

  void decrementPlayers() {
    if (state.playerCount > 1) {
      emit(state.copyWith(playerCount: state.playerCount - 1));
    }
  }

  void startMission(String langCode) {
    loadGameData(langCode);
    final initialPlayers = List.generate(state.playerCount, (i) => i + 1);
    final initialScores = {for (var i in initialPlayers) i: 0};

    if (initialPlayers.length == 1) {
      emit(state.copyWith(
        phase: VaultPhase.active,
        activePlayers: initialPlayers,
        currentTurnIndex: 0,
        timeRemaining: 15,
        enteredCode: '',
        playersUsedHint: [],
        isHintRevealed: false,
        playerScores: initialScores,
      ));
      _startTimer();
    } else {
      emit(state.copyWith(
        phase: VaultPhase.passDevice,
        activePlayers: initialPlayers,
        currentTurnIndex: 0,
        playersUsedHint: [],
        isHintRevealed: false,
        playerScores: initialScores,
      ));
    }
  }

  void confirmIdentity() {
    emit(state.copyWith(
      phase: VaultPhase.active,
      timeRemaining: 15,
      enteredCode: '',
    ));
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeRemaining > 0) {
        emit(state.copyWith(timeRemaining: state.timeRemaining - 1));
      } else {
        _timer?.cancel();
        _handleElimination();
      }
    });
  }

  void addDigit(String digit) {
    if (state.questions.isEmpty) return;
    final answerLength =
        state.questions[state.currentQuestionIndex]['answer'].length;

    if (state.enteredCode.length < answerLength) {
      emit(state.copyWith(enteredCode: state.enteredCode + digit));
    }
  }

  void clearCode() {
    emit(state.copyWith(enteredCode: ''));
  }

  void submitCode() {
    if (state.questions.isEmpty) return;

    _timer?.cancel();
    final currentAnswer =
        state.questions[state.currentQuestionIndex]['answer'];

    if (state.enteredCode == currentAnswer) {
      final newScores = Map<int, int>.from(state.playerScores);
      newScores[state.currentPlayerId] =
          (newScores[state.currentPlayerId] ?? 0) + 1;

      if (state.activePlayers.length == 1) {
        emit(state.copyWith(
          phase: VaultPhase.success,
          playerScores: newScores,
        ));
      } else if (state.currentQuestionIndex < state.questions.length - 1) {
        final nextTurn =
            (state.currentTurnIndex + 1) % state.activePlayers.length;

        emit(state.copyWith(
          currentQuestionIndex: state.currentQuestionIndex + 1,
          enteredCode: '',
          currentTurnIndex: nextTurn,
          phase: VaultPhase.passDevice,
          isHintRevealed: false,
          playerScores: newScores,
        ));
      } else {
        emit(state.copyWith(
          phase: VaultPhase.success,
          playerScores: newScores,
        ));
      }
    } else {
      _handleElimination();
    }
  }

  void revealHint() {
    final playerId = state.currentPlayerId;
    if (!state.playersUsedHint.contains(playerId)) {
      final updatedList = List<int>.from(state.playersUsedHint)..add(playerId);
      emit(state.copyWith(
        isHintRevealed: true,
        playersUsedHint: updatedList,
      ));
    }
  }

  void _handleElimination() {
    final updatedPlayers = List<int>.from(state.activePlayers);
    if (updatedPlayers.isNotEmpty &&
        state.currentTurnIndex < updatedPlayers.length) {
      updatedPlayers.removeAt(state.currentTurnIndex);
    }

    int nextQuestionIdx = state.currentQuestionIndex + 1;
    if (nextQuestionIdx >= state.questions.length) {
      nextQuestionIdx = 0;
    }

    if (updatedPlayers.isEmpty) {
      emit(state.copyWith(phase: VaultPhase.failed, activePlayers: []));
    } else if (updatedPlayers.length == 1) {
      final survivorId = updatedPlayers.first;
      final survivorScore = state.playerScores[survivorId] ?? 0;

      int highestEliminatedScore = 0;
      for (var entry in state.playerScores.entries) {
        if (!updatedPlayers.contains(entry.key)) {
          if (entry.value > highestEliminatedScore) {
            highestEliminatedScore = entry.value;
          }
        }
      }

      if (survivorScore > highestEliminatedScore) {
        emit(state.copyWith(
          phase: VaultPhase.success,
          activePlayers: updatedPlayers,
          currentTurnIndex: 0,
        ));
      } else {
        emit(state.copyWith(
          phase: VaultPhase.eliminated,
          activePlayers: updatedPlayers,
          currentTurnIndex: 0,
          isHintRevealed: false,
          enteredCode: '',
          currentQuestionIndex: nextQuestionIdx,
        ));
      }
    } else {
      int nextTurn = state.currentTurnIndex;
      if (nextTurn >= updatedPlayers.length) {
        nextTurn = 0;
      }
      emit(state.copyWith(
        phase: VaultPhase.eliminated,
        activePlayers: updatedPlayers,
        currentTurnIndex: nextTurn,
        isHintRevealed: false,
        enteredCode: '',
        currentQuestionIndex: nextQuestionIdx,
      ));
    }
  }

  void continueAfterElimination() {
    emit(state.copyWith(
      phase: VaultPhase.passDevice,
      enteredCode: '',
    ));
  }

  void resetGame() {
    _timer?.cancel();
    emit(const VaultState());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}