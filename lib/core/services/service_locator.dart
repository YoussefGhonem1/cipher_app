import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/presentation/cubits/home_cubit.dart';

import '../../features/spyfall/data/datasources/spyfall_local_data_source.dart';
import '../../features/spyfall/data/repositories/spyfall_repository_impl.dart';
import '../../features/spyfall/domain/repositories/spyfall_repository.dart';
import '../../features/spyfall/presentation/cubits/spyfall_cubit.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  if (getIt.isRegistered<HomeCubit>()) {
    return;
  }

  getIt.registerLazySingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl.new);

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(localDataSource: getIt<HomeLocalDataSource>()),
  );

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(homeRepository: getIt<HomeRepository>()),
  );

  getIt.registerLazySingleton<SpyfallLocalDataSource>(SpyfallLocalDataSourceImpl.new);

  getIt.registerLazySingleton<SpyfallRepository>(
    () => SpyfallRepositoryImpl(localDataSource: getIt<SpyfallLocalDataSource>()),
  );

  getIt.registerFactory<SpyfallCubit>(
    () => SpyfallCubit(repository: getIt<SpyfallRepository>()),
  );
}