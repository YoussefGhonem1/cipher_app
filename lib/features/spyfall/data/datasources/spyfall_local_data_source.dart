import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/hive_service.dart';
import '../models/spyfall_location_model.dart';

abstract class SpyfallLocalDataSource {
  Future<List<SpyfallLocationModel>> getLocations();
}

@LazySingleton(as: SpyfallLocalDataSource)
class SpyfallLocalDataSourceImpl implements SpyfallLocalDataSource {
  static const String _locationsKey = 'spyfall_locations';

  static const List<SpyfallLocationModel> _seedLocations = [
    SpyfallLocationModel(id: 'embassy', titleKey: 'spyfallLocationEmbassy', intelLevelKey: 'spyfallIntelHigh'),
    SpyfallLocationModel(id: 'submarine', titleKey: 'spyfallLocationSubmarine', intelLevelKey: 'spyfallIntelCritical'),
    SpyfallLocationModel(id: 'research_lab', titleKey: 'spyfallLocationResearchLab', intelLevelKey: 'spyfallIntelLow'),
    SpyfallLocationModel(id: 'nightclub', titleKey: 'spyfallLocationNightclub', intelLevelKey: 'spyfallIntelMid'),
    SpyfallLocationModel(id: 'secret_base', titleKey: 'spyfallLocationSecretBase', intelLevelKey: 'spyfallIntelConfirmed'),
    SpyfallLocationModel(id: 'airport', titleKey: 'spyfallLocationAirport', intelLevelKey: 'spyfallIntelLow'),
    SpyfallLocationModel(id: 'bank', titleKey: 'spyfallLocationBank', intelLevelKey: 'spyfallIntelHigh'),
    SpyfallLocationModel(id: 'hospital', titleKey: 'spyfallLocationHospital', intelLevelKey: 'spyfallIntelMid'),
    SpyfallLocationModel(id: 'space_station', titleKey: 'spyfallLocationSpaceStation', intelLevelKey: 'spyfallIntelCritical'),
    SpyfallLocationModel(id: 'pirate_ship', titleKey: 'spyfallLocationPirateShip', intelLevelKey: 'spyfallIntelLow'),
    SpyfallLocationModel(id: 'circus', titleKey: 'spyfallLocationCircus', intelLevelKey: 'spyfallIntelMid'),
    SpyfallLocationModel(id: 'police_station', titleKey: 'spyfallLocationPoliceStation', intelLevelKey: 'spyfallIntelHigh'),
    SpyfallLocationModel(id: 'school', titleKey: 'spyfallLocationSchool', intelLevelKey: 'spyfallIntelLow'),
    SpyfallLocationModel(id: 'passenger_train', titleKey: 'spyfallLocationPassengerTrain', intelLevelKey: 'spyfallIntelMid'),
    SpyfallLocationModel(id: 'haunted_house', titleKey: 'spyfallLocationHauntedHouse', intelLevelKey: 'spyfallIntelLow'),
    SpyfallLocationModel(id: 'film_studio', titleKey: 'spyfallLocationFilmStudio', intelLevelKey: 'spyfallIntelMid'),
    SpyfallLocationModel(id: 'arctic_station', titleKey: 'spyfallLocationArcticStation', intelLevelKey: 'spyfallIntelCritical'),
    SpyfallLocationModel(id: 'museum', titleKey: 'spyfallLocationMuseum', intelLevelKey: 'spyfallIntelHigh'),
    SpyfallLocationModel(id: 'stadium', titleKey: 'spyfallLocationStadium', intelLevelKey: 'spyfallIntelLow'),
    SpyfallLocationModel(id: 'restaurant', titleKey: 'spyfallLocationRestaurant', intelLevelKey: 'spyfallIntelMid'),
    SpyfallLocationModel(id: 'casino', titleKey: 'spyfallLocationCasino', intelLevelKey: 'spyfallIntelHigh'),
  ];

  @override
  Future<List<SpyfallLocationModel>> getLocations() async {
    final box = Hive.box(HiveService.gameBoxName);
    final cachedData = box.get(_locationsKey);

    if (cachedData is! List) {
      await _storeSeedLocations(box);
      return _seedLocations;
    }

    final locations = cachedData
        .whereType<Map>()
        .map((e) => SpyfallLocationModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    if (locations.isEmpty) {
      await _storeSeedLocations(box);
      return _seedLocations;
    }

    return locations;
  }

  Future<void> _storeSeedLocations(Box box) {
    return box.put(
      _locationsKey,
      _seedLocations.map((e) => e.toJson()).toList(growable: false),
    );
  }
}