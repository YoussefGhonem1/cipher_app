import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imagePath,
    required super.intelLevel,
    required super.wordsPool,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      intelLevel: json['intelLevel'],
      wordsPool: List<String>.from(json['wordsPool']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'intelLevel': intelLevel,
      'wordsPool': wordsPool,
    };
  }
}