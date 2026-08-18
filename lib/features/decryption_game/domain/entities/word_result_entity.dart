import 'package:equatable/equatable.dart';

class WordResultEntity extends Equatable {
  final String word;
  final bool isCorrect;

  const WordResultEntity({
    required this.word,
    required this.isCorrect,
  });

  @override
  List<Object> get props => [word, isCorrect];
}