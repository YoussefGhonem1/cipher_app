// features/the_vault/presentation/cubits/vault_cubit.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/services/hive_service.dart';
import 'vault_state.dart';

class VaultCubit extends Cubit<VaultState> {
  Timer? _timer;

  VaultCubit() : super(const VaultState());

  void loadGameData(String langCode) {
    try {
      final box = Hive.box(HiveService.gameBoxName);
      final gameData = box.get('the_vault');

      List<String> loadedSolvedIds = [];
      final storedSolved = box.get('vault_solved_questions');
      if (storedSolved != null) {
        loadedSolvedIds = List<String>.from(storedSolved);
      }

      if (gameData != null && gameData['questions'] != null) {
        List<dynamic> rawQuestions = gameData['questions'];
        Set<String> extractedCategories = {};

        List<Map<String, dynamic>> parsedQuestions = rawQuestions.map((q) {
          String qCategory = 'General';
          if (q['category'] != null) {
            if (q['category'] is Map) {
              qCategory = q['category'][langCode] ?? q['category']['en'] ?? 'General';
            } else {
              qCategory = q['category'].toString();
            }
          }
          extractedCategories.add(qCategory);

          String qInstruction = '';
          if (q['instruction'] != null) {
            if (q['instruction'] is Map) {
              qInstruction = q['instruction'][langCode] ?? q['instruction']['en'] ?? '';
            } else {
              qInstruction = q['instruction'].toString();
            }
          }

          String qClue = '';
          if (q['clue'] != null) {
            if (q['clue'] is Map) {
              qClue = q['clue'][langCode] ?? q['clue']['en'] ?? '';
            } else {
              qClue = q['clue'].toString();
            }
          }

          String qHint = '';
          if (q['hint'] != null) {
            if (q['hint'] is Map) {
              qHint = q['hint'][langCode] ?? q['hint']['en'] ?? '';
            } else {
              qHint = q['hint'].toString();
            }
          }

          List<String> qWrongAnswers = [];
          if (q['wrong_answers'] != null) {
            qWrongAnswers = (q['wrong_answers'] as List).map((e) => e.toString()).toList();
          }

          return {
            'id': q['id']?.toString() ?? q['answer'].toString(),
            'instruction': qInstruction,
            'clue': qClue,
            'answer': q['answer'].toString(),
            'wrong_answers': qWrongAnswers,
            'hint': qHint,
            'category': qCategory,
          };
        }).toList();

        final mixedCategoryName = langCode == 'ar' ? 'مختلط' : 'Mixed';
        List<String> finalCategories = [mixedCategoryName, ...extractedCategories.toList()];

        String initialCategory = state.selectedCategory.isEmpty || !finalCategories.contains(state.selectedCategory)
            ? mixedCategoryName
            : state.selectedCategory;

        emit(state.copyWith(
          questions: parsedQuestions,
          categories: finalCategories,
          selectedCategory: initialCategory,
          solvedQuestionsIds: loadedSolvedIds,
        ));
      }
    } catch (e) {
      final mixedCategoryName = langCode == 'ar' ? 'مختلط' : 'Mixed';
      emit(state.copyWith(categories: [mixedCategoryName]));
    }
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
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

  List<String> _generateChoices(Map<String, dynamic> currentQuestion) {
    final String correctAnswer = currentQuestion['answer'].toString();
    final List<String> wrongAnswers = (currentQuestion['wrong_answers'] as List<String>?) ?? [];
    final List<String> choices = [correctAnswer, ...wrongAnswers];
    choices.shuffle();
    return choices;
  }

  void startMission(String langCode) {
    loadGameData(langCode);

    final mixedCategoryName = langCode == 'ar' ? 'مختلط' : 'Mixed';
    List<Map<String, dynamic>> categoryQuestions;

    if (state.selectedCategory == mixedCategoryName) {
      categoryQuestions = List.from(state.questions);
    } else {
      categoryQuestions = state.questions.where((q) => q['category'] == state.selectedCategory).toList();
    }

    var unplayedQuestions = categoryQuestions.where((q) => !state.solvedQuestionsIds.contains(q['id'])).toList();

    if (unplayedQuestions.isEmpty) {
      unplayedQuestions = categoryQuestions;
      final box = Hive.box(HiveService.gameBoxName);
      List<String> newSolved = List.from(state.solvedQuestionsIds);
      for (var q in categoryQuestions) {
        newSolved.remove(q['id']);
      }
      box.put('vault_solved_questions', newSolved);
      emit(state.copyWith(solvedQuestionsIds: newSolved));
    }

    unplayedQuestions.shuffle();

    final initialPlayers = List.generate(state.playerCount, (i) => i + 1);
    final initialScores = {for (var i in initialPlayers) i: 0};
    final initialChoices = _generateChoices(unplayedQuestions[0]);

    if (initialPlayers.length == 1) {
      emit(state.copyWith(
        phase: VaultPhase.active,
        activePlayers: initialPlayers,
        currentTurnIndex: 0,
        timeRemaining: 15,
        currentChoices: initialChoices,
        playersUsedHint: [],
        isHintRevealed: false,
        playerScores: initialScores,
        questions: unplayedQuestions,
        currentQuestionIndex: 0,
      ));
      _startTimer();
    } else {
      emit(state.copyWith(
        phase: VaultPhase.passDevice,
        activePlayers: initialPlayers,
        currentTurnIndex: 0,
        playersUsedHint: [],
        currentChoices: initialChoices,
        isHintRevealed: false,
        playerScores: initialScores,
        questions: unplayedQuestions,
        currentQuestionIndex: 0,
      ));
    }
  }

  void confirmIdentity() {
    emit(state.copyWith(
      phase: VaultPhase.active,
      timeRemaining: 15,
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

  void submitAnswer(String selectedAnswer) {
    if (state.questions.isEmpty) return;

    _timer?.cancel();
    final currentQuestion = state.questions[state.currentQuestionIndex];
    final currentAnswer = currentQuestion['answer'].toString();

    if (selectedAnswer == currentAnswer) {
      final box = Hive.box(HiveService.gameBoxName);
      final updatedSolved = List<String>.from(state.solvedQuestionsIds)..add(currentQuestion['id']);
      box.put('vault_solved_questions', updatedSolved);

      final newScores = Map<int, int>.from(state.playerScores);
      newScores[state.currentPlayerId] = (newScores[state.currentPlayerId] ?? 0) + 1;

      if (state.activePlayers.length == 1) {
        emit(state.copyWith(
          phase: VaultPhase.success,
          playerScores: newScores,
          solvedQuestionsIds: updatedSolved,
        ));
      } else if (state.currentQuestionIndex < state.questions.length - 1) {
        final nextTurn = (state.currentTurnIndex + 1) % state.activePlayers.length;
        final nextQuestionIdx = state.currentQuestionIndex + 1;
        final nextChoices = _generateChoices(state.questions[nextQuestionIdx]);

        emit(state.copyWith(
          currentQuestionIndex: nextQuestionIdx,
          currentChoices: nextChoices,
          currentTurnIndex: nextTurn,
          phase: VaultPhase.passDevice,
          isHintRevealed: false,
          playerScores: newScores,
          solvedQuestionsIds: updatedSolved,
        ));
      } else {
        emit(state.copyWith(
          phase: VaultPhase.success,
          playerScores: newScores,
          solvedQuestionsIds: updatedSolved,
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
    if (updatedPlayers.isNotEmpty && state.currentTurnIndex < updatedPlayers.length) {
      updatedPlayers.removeAt(state.currentTurnIndex);
    }

    int nextQuestionIdx = state.currentQuestionIndex + 1;
    if (nextQuestionIdx >= state.questions.length) {
      nextQuestionIdx = 0;
    }
    final nextChoices = _generateChoices(state.questions[nextQuestionIdx]);

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
          currentChoices: nextChoices,
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
        currentChoices: nextChoices,
        currentQuestionIndex: nextQuestionIdx,
      ));
    }
  }

  void continueAfterElimination() {
    emit(state.copyWith(
      phase: VaultPhase.passDevice,
    ));
  }

  void resetGame() {
    _timer?.cancel();
    emit(VaultState(
      categories: state.categories,
      selectedCategory: state.selectedCategory,
      solvedQuestionsIds: state.solvedQuestionsIds,
      questions: state.questions,
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}