import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String spyfallSetup = '/spyfall-setup';
  static const String spyfallGame = '/spyfall-game';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}