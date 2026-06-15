import 'package:go_router/go_router.dart';
import 'package:hearai/features/home/home.dart';
import 'package:hearai/features/sign_up/sign_up.dart';
import 'package:hearai/features/splash/splash.dart';
import 'package:hearai/features/setting/setting.dart';

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
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      name: 'signUp',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: RoutePaths.initSettings,
      name: 'initSettings',
      builder: (context, state) => const InitSettingsPage(),
    ),
    GoRoute(
      path: RoutePaths.setting,
      name: 'setting',
      builder: (context, state) => const SettingPage(),
    ),
  ],
);
