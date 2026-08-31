import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/services/hive_service.dart';
import 'casino_state.dart';

class CasinoCubit extends Cubit<CasinoState> {
  CasinoCubit() : super(const CasinoState());

  void loadGameData(String langCode) {
    try {
      final box = Hive.box(HiveService.gameBoxName);
      final gameData = box.get('the_vault');

      if (gameData != null && gameData['questions'] != null) {
        List<dynamic> rawQuestions = gameData['questions'];
        Set<String> extractedCategories = {};

        List<Map<String, dynamic>> parsedQuestions = rawQuestions.map((q) {
          String qCategory = 'General';
          if (q['category'] != null) {
            if (q['category'] is Map) {
              qCategory = q['category'][langCode] ??
                  q['category']['en'] ??
                  'General';
            } else {
              qCategory = q['category'].toString();
            }
          }
          extractedCategories.add(qCategory);

          String qClue = '';
          if (q['clue'] != null) {
            if (q['clue'] is Map) {
              qClue = q['clue'][langCode] ?? q['clue']['en'] ?? '';
            } else {
              qClue = q['clue'].toString();
            }
          }

          List<String> qWrongAnswers = [];
          if (q['wrong_answers'] != null) {
            qWrongAnswers = (q['wrong_answers'] as List)
                .map((e) => e.toString())
                .toList();
          }

          return {
            'id': q['id']?.toString() ?? q['answer'].toString(),
            'clue': qClue,
            'answer': q['answer'].toString(),
            'wrong_answers': qWrongAnswers,
            'category': qCategory,
          };
        }).toList();

        final mixedCategoryName = langCode == 'ar' ? 'مختلط' : 'Mixed';
        List<String> finalCategories = [
          mixedCategoryName,
          ...extractedCategories.toList()
        ];

        emit(state.copyWith(
          allQuestions: parsedQuestions,
          categories: finalCategories,
          selectedCategory: mixedCategoryName,
        ));
      }
    } catch (e) {
      return;
    }
  }

  void changeCategory(String category, String langCode) {
    emit(state.copyWith(selectedCategory: category));
    drawNextQuestion(langCode);
  }

  void drawNextQuestion(String langCode) {
    if (state.allQuestions.isEmpty) return;

    final mixedCategoryName = langCode == 'ar' ? 'مختلط' : 'Mixed';
    List<Map<String, dynamic>> categoryQuestions;

    if (state.selectedCategory == mixedCategoryName) {
      categoryQuestions = List.from(state.allQuestions);
    } else {
      categoryQuestions = state.allQuestions
          .where((q) => q['category'] == state.selectedCategory)
          .toList();
    }

    if (categoryQuestions.isNotEmpty) {
      final random = Random();
      final selectedQuestion =
          categoryQuestions[random.nextInt(categoryQuestions.length)];

      final List<String> options = [
        selectedQuestion['answer'].toString(),
        ...(selectedQuestion['wrong_answers'] as List<String>)
      ];
      options.shuffle();

      emit(state.copyWith(
        currentQuestion: selectedQuestion,
        currentOptions: options,
      ));
    }
  }
}