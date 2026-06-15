import 'package:go_router/go_router.dart';
import 'package:hearai/features/sign_up/sign_up.dart';
import 'package:hearai/features/splash/splash.dart';
import 'package:hearai/shared/pages/pages.dart';

import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePaths.home,
      name: 'home',
      builder: (context, state) => const UnderConstructionPage(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      name: 'signUp',
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
