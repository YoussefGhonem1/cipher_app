import 'package:hive/hive.dart';
import '../../../../core/services/hive_service.dart';
import '../models/game_dossier_model.dart';

abstract class HomeLocalDataSource {
  Future<List<GameDossierModel>> getGamesDossiers();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const String _gamesKey = 'cached_games_dossiers';

  @override
  Future<List<GameDossierModel>> getGamesDossiers() async {
    final box = Hive.box(HiveService.gameBoxName);
    
    final cachedData = box.get(_gamesKey);
    
    if (cachedData == null) {
      final initialGames = [
        const GameDossierModel(
          id: 'spyfall',
          title: 'SPYFALL',
          description: 'Identify the infiltrator before time runs out. Trust is a liability.',
          intelLevel: 'HIGH',
          playerCount: '3-8 PLAYERS',
          duration: '15 MINS',
          isActive: true,
          route: '/spyfall-setup',
        ),
        const GameDossierModel(
          id: 'charades',
          title: 'ACTION PROTOCOL',
          description: 'Analyze high-impact cinematic scenarios for tactical advantage.',
          intelLevel: 'MODERATE',
          playerCount: '4+ PLAYERS',
          duration: '10 MINS',
          isActive: true,
          route: '/charades-setup',
        ),
      ];
      
      await box.put(_gamesKey, initialGames.map((e) => e.toJson()).toList());
      return initialGames;
    }

    final List<dynamic> decodedList = cachedData;
    return decodedList
        .map((e) => GameDossierModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}