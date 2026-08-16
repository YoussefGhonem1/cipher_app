import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/game_placeholder_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/spyfall/presentation/screens/spyfall_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String spyfallSetup = '/spyfall-setup';
  static const String charadesSetup = '/charades-setup';
  static const String spyfallGame = '/spyfall-game';

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
        builder: (context, state) =>
            const GamePlaceholderScreen(gameId: 'charades'),
      ),
    ],
    errorBuilder: (context, state) => const HomeScreen(),
  );
}
