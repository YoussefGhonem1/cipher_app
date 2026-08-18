import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String intelLevel;
  final List<String> wordsPool;

  const CategoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.intelLevel,
    required this.wordsPool,
  });

  @override
  List<Object> get props => [id, title, description, imagePath, intelLevel, wordsPool];
}