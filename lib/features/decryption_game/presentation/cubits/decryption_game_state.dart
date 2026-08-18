import 'package:equatable/equatable.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/word_result_entity.dart';

abstract class DecryptionGameState extends Equatable {
  const DecryptionGameState();
  
  @override
  List<Object?> get props => [];
}

class DecryptionGameInitial extends DecryptionGameState {}

class CategoriesLoading extends DecryptionGameState {}

class CategoriesLoaded extends DecryptionGameState {
  final List<CategoryEntity> categories;
  final CategoryEntity? selectedCategory;

  const CategoriesLoaded(this.categories, this.selectedCategory);

  @override
  List<Object?> get props => [categories, selectedCategory];
}

class CategoriesError extends DecryptionGameState {
  final String message;

  const CategoriesError(this.message);

  @override
  List<Object?> get props => [message];
}

class GamePreparation extends DecryptionGameState {
  final CategoryEntity category;
  final int countdown;

  const GamePreparation(this.category, this.countdown);

  @override
  List<Object?> get props => [category, countdown];
}

class GamePlaying extends DecryptionGameState {
  final String currentWord;
  final int timeRemaining;
  final int score;
  final bool showCorrectIndicator;
  final bool showPassIndicator;

  const GamePlaying({
    required this.currentWord,
    required this.timeRemaining,
    required this.score,
    this.showCorrectIndicator = false,
    this.showPassIndicator = false,
  });

  @override
  List<Object?> get props => [
        currentWord,
        timeRemaining,
        score,
        showCorrectIndicator,
        showPassIndicator,
      ];
}

class GameOver extends DecryptionGameState {
  final List<WordResultEntity> results;
  final int score;

  const GameOver(this.results, this.score);

  @override
  List<Object?> get props => [results, score];
}