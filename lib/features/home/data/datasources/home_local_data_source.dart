import 'package:hive/hive.dart';
import '../../../../core/routers/app_router.dart';
import '../../../../core/services/hive_service.dart';
import '../models/game_dossier_model.dart';

abstract class HomeLocalDataSource {
  Future<List<GameDossierModel>> getGamesDossiers();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const String _gamesKey = 'cached_games_dossiers';

  static const List<GameDossierModel> _seedGames = [
    GameDossierModel(
      id: 'spyfall',
      title: 'SPYFALL',
      description:
          'Identify the infiltrator before time runs out. Trust is a liability.',
      intelLevel: 'HIGH',
      playerCount: '3-8 PLAYERS',
      duration: '15 MINS',
      isActive: true,
      route: AppRouter.spyfallSetup,
    ),
    GameDossierModel(
      id: 'charades',
      title: 'ACTION PROTOCOL',
      description:
          'Analyze high-impact cinematic scenarios for tactical advantage.',
      intelLevel: 'MODERATE',
      playerCount: '4+ PLAYERS',
      duration: '10 MINS',
      isActive: true,
      route: AppRouter.charadesSetup,
    ),
  ];

  @override
  Future<List<GameDossierModel>> getGamesDossiers() async {
    final box = Hive.box(HiveService.gameBoxName);
    final cachedData = box.get(_gamesKey);

    if (cachedData is! List) {
      await _storeSeedGames(box);
      return _seedGames;
    }

    final decodedList = cachedData
        .whereType<Map>()
        .map((e) => GameDossierModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    if (decodedList.isEmpty) {
      await _storeSeedGames(box);
      return _seedGames;
    }

    return decodedList;
  }

  Future<void> _storeSeedGames(Box box) {
    return box.put(
      _gamesKey,
      _seedGames.map((e) => e.toJson()).toList(growable: false),
    );
  }
}
