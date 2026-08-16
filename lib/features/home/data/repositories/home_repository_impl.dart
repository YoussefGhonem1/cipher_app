import '../../domain/entities/game_dossier_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<List<GameDossierEntity>> getGames() async {
    final models = await localDataSource.getGamesDossiers();
    return models;
  }
}