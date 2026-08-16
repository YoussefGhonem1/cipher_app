import '../entities/spyfall_location_entity.dart';

abstract class SpyfallRepository {
  Future<List<SpyfallLocationEntity>> getLocations();
}
