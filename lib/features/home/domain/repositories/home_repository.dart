import '../entities/game_dossier_entity.dart';

abstract class HomeRepository {
  Future<List<GameDossierEntity>> getGames();
}