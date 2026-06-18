import 'package:go_router/go_router.dart';
import 'package:hearai/core/di/injection_container.dart';
import 'package:hearai/features/home/home.dart';
import 'package:hearai/features/sign_up/sign_up.dart';
import 'package:hearai/features/setting/setting.dart';

import '../auth/auth_controller.dart';
import 'route_guards.dart';
import 'route_paths.dart';

GoRouter get appRouter => GoRouter(
  redirect: routeGuard,
  refreshListenable: sl<AuthController>(),
  initialLocation: RoutePaths.signUp,
  routes: [
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
