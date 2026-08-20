import 'package:cipher/features/game_sync/cubit/game_sync_cubit.dart';
import 'package:cipher/features/the_vault/presentation/cubits/vault_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/decryption_game/presentation/cubits/decryption_game_cubit.dart';
import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/presentation/cubits/home_cubit.dart';

import '../../features/spyfall/data/datasources/spyfall_local_data_source.dart';
import '../../features/spyfall/data/repositories/spyfall_repository_impl.dart';
import '../../features/spyfall/domain/repositories/spyfall_repository.dart';
import '../../features/spyfall/presentation/cubits/spyfall_cubit.dart';

import '../../features/decryption_game/data/datasources/decryption_game_local_data_source.dart';
import '../../features/decryption_game/data/repositories/decryption_game_repository_impl.dart';
import '../../features/decryption_game/domain/repositories/decryption_game_repository.dart';
import '../../features/decryption_game/domain/usecases/get_categories_usecase.dart';

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

  getIt.registerLazySingleton<DecryptionGameLocalDataSource>(
    DecryptionGameLocalDataSourceImpl.new,
  );

  getIt.registerLazySingleton<DecryptionGameRepository>(
    () => DecryptionGameRepositoryImpl(getIt<DecryptionGameLocalDataSource>()),
  );

  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(getIt<DecryptionGameRepository>()),
  );

  getIt.registerFactory<DecryptionGameCubit>(
    () => DecryptionGameCubit(getCategoriesUseCase: getIt<GetCategoriesUseCase>()),
  );

  getIt.registerFactory<GameSyncCubit>(
    () => GameSyncCubit(),
  );
  getIt.registerFactory<VaultCubit>(
    () => VaultCubit(),
  );
}