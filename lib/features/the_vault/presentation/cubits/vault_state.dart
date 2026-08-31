import 'package:equatable/equatable.dart';

enum VaultPhase { setup, passDevice, active, eliminated, failed, success }

class VaultState extends Equatable {
  final VaultPhase phase;
  final int playerCount;
  final List<int> activePlayers;
  final int currentTurnIndex;
  final int timeRemaining;
  final String enteredCode;
  final List<Map<String, dynamic>> questions;
  final int currentQuestionIndex;
  final List<int> playersUsedHint;
  final bool isHintRevealed;
  final Map<int, int> playerScores;
  final List<String> categories;
  final String selectedCategory;
  final List<String> solvedQuestionsIds;

  const VaultState({
    this.phase = VaultPhase.setup,
    this.playerCount = 4,
    this.activePlayers = const [],
    this.currentTurnIndex = 0,
    this.timeRemaining = 0,
    this.enteredCode = '',
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.playersUsedHint = const [],
    this.isHintRevealed = false,
    this.playerScores = const {},
    this.categories = const [],
    this.selectedCategory = '',
    this.solvedQuestionsIds = const [],
  });

  int get currentPlayerId =>
      activePlayers.isNotEmpty && currentTurnIndex < activePlayers.length
          ? activePlayers[currentTurnIndex]
          : 1;

  VaultState copyWith({
    VaultPhase? phase,
    int? playerCount,
    List<int>? activePlayers,
    int? currentTurnIndex,
    int? timeRemaining,
    String? enteredCode,
    List<Map<String, dynamic>>? questions,
    int? currentQuestionIndex,
    List<int>? playersUsedHint,
    bool? isHintRevealed,
    Map<int, int>? playerScores,
    List<String>? categories,
    String? selectedCategory,
    List<String>? solvedQuestionsIds,
  }) {
    return VaultState(
      phase: phase ?? this.phase,
      playerCount: playerCount ?? this.playerCount,
      activePlayers: activePlayers ?? this.activePlayers,
      currentTurnIndex: currentTurnIndex ?? this.currentTurnIndex,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      enteredCode: enteredCode ?? this.enteredCode,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      playersUsedHint: playersUsedHint ?? this.playersUsedHint,
      isHintRevealed: isHintRevealed ?? this.isHintRevealed,
      playerScores: playerScores ?? this.playerScores,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      solvedQuestionsIds: solvedQuestionsIds ?? this.solvedQuestionsIds,
    );
  }

  @override
  List<Object> get props => [
        phase,
        playerCount,
        activePlayers,
        currentTurnIndex,
        timeRemaining,
        enteredCode,
        questions,
        currentQuestionIndex,
        playersUsedHint,
        isHintRevealed,
        playerScores,
        categories,
        selectedCategory,
        solvedQuestionsIds,
      ];
}