import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hearai/core/core.dart';

/// Called by GoRouter on every navigation. Returns a redirect path, or null
/// if the current route is allowed.
///
/// Rules (in order):
/// 1. Still loading — let the current route through.
/// 2. Not authenticated — only [RoutePaths.signUp] is allowed.
/// 3. Authenticated but new user — only [RoutePaths.initSettings] is allowed.
/// 4. Fully authenticated — bounce away from public pages to home.
Future<String?> routeGuard(BuildContext context, GoRouterState state) async {
  final auth = sl<AuthController>();

  // Wait until the auth state is known (e.g. after checking persisted token).
  if (auth.isLoading) return null;

  final location = state.uri.toString();
  final isOnSignUp = location == RoutePaths.signUp;
  final isOnInitSettings = location == RoutePaths.initSettings;

  // --- Not authenticated ------------------------------------------------
  if (!auth.isAuthenticated) {
    if (!isOnSignUp) return RoutePaths.signUp;
    return null;
  }

  // --- Authenticated but not yet onboarded ------------------------------
  if (auth.isNewUser) {
    if (!isOnInitSettings) return RoutePaths.initSettings;
    return null;
  }

  // --- Fully authenticated — keep public pages out ----------------------
  if (isOnSignUp || isOnInitSettings) return RoutePaths.home;

  return null;
}
