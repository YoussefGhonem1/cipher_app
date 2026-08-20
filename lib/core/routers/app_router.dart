import 'package:cipher/features/the_vault/presentation/screens/vault_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/service_locator.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/spyfall/presentation/screens/spyfall_screen.dart';
import '../../features/decryption_game/presentation/cubits/decryption_game_cubit.dart';
import '../../features/decryption_game/presentation/screens/category_selection_screen.dart';
import '../../features/decryption_game/presentation/screens/charades_preparation_screen.dart';
import '../../features/decryption_game/presentation/screens/charades_active_screen.dart';
import '../../features/decryption_game/presentation/screens/charades_report_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String spyfallSetup = '/spyfall-setup';
  static const String charadesSetup = '/charades-setup';
  static const String charadesPrep = '/charades-prep';
  static const String charadesActive = '/charades-active';
  static const String charadesReport = '/charades-report';
  static const String theVault = '/the-vault';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: spyfallSetup,
        builder: (context, state) => const SpyfallScreen(),
      ),
      GoRoute(
        path: charadesSetup,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<DecryptionGameCubit>(),
          child: const CategorySelectionScreen(),
        ),
      ),
      GoRoute(
        path: charadesPrep,
        builder: (context, state) {
          final cubit = state.extra as DecryptionGameCubit;
          return BlocProvider.value(
            value: cubit,
            child: const CharadesPreparationScreen(),
          );
        },
      ),
      GoRoute(
        path: charadesActive,
        builder: (context, state) {
          final cubit = state.extra as DecryptionGameCubit;
          return BlocProvider.value(
            value: cubit,
            child: const CharadesActiveScreen(),
          );
        },
      ),
      GoRoute(
        path: charadesReport,
        builder: (context, state) {
          final cubit = state.extra as DecryptionGameCubit;
          return BlocProvider.value(
            value: cubit,
            child: const CharadesReportScreen(),
          );
        },
      ),
      GoRoute(
        path: theVault,
        builder: (context, state) => const VaultScreen(),
      ),
    ],
    errorBuilder: (context, state) => const HomeScreen(),
  );
}
