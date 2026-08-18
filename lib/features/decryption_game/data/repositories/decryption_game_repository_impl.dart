import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/decryption_game_repository.dart';
import '../datasources/decryption_game_local_data_source.dart';

class DecryptionGameRepositoryImpl implements DecryptionGameRepository {
  final DecryptionGameLocalDataSource localDataSource;

  DecryptionGameRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories(String langCode) async {
    try {
      final categories = await localDataSource.getCategories(langCode);
      return Right(categories);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}