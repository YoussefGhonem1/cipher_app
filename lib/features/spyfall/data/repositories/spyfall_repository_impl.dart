import '../../domain/entities/spyfall_location_entity.dart';
import '../../domain/repositories/spyfall_repository.dart';
import '../datasources/spyfall_local_data_source.dart';

class SpyfallRepositoryImpl implements SpyfallRepository {
  final SpyfallLocalDataSource localDataSource;

  SpyfallRepositoryImpl({required this.localDataSource});

  @override
  Future<List<SpyfallLocationEntity>> getLocations() {
    return localDataSource.getLocations();
  }
}
