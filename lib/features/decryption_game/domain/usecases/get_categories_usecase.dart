import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';
import '../repositories/decryption_game_repository.dart';

class GetCategoriesUseCase {
  final DecryptionGameRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call(String langCode) async {
    return await repository.getCategories(langCode);
  }
}