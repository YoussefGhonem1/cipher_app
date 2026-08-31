import 'package:equatable/equatable.dart';

class CasinoState extends Equatable {
  final List<Map<String, dynamic>> allQuestions;
  final List<String> categories;
  final String selectedCategory;
  final Map<String, dynamic>? currentQuestion;
  final List<String> currentOptions;

  const CasinoState({
    this.allQuestions = const [],
    this.categories = const [],
    this.selectedCategory = '',
    this.currentQuestion,
    this.currentOptions = const [],
  });

  CasinoState copyWith({
    List<Map<String, dynamic>>? allQuestions,
    List<String>? categories,
    String? selectedCategory,
    Map<String, dynamic>? currentQuestion,
    List<String>? currentOptions,
  }) {
    return CasinoState(
      allQuestions: allQuestions ?? this.allQuestions,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      currentOptions: currentOptions ?? this.currentOptions,
    );
  }

  @override
  List<Object?> get props => [
        allQuestions,
        categories,
        selectedCategory,
        currentQuestion,
        currentOptions,
      ];
}