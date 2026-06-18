import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static TextTheme _baseTextTheme(Brightness brightness) {
    final base = ThemeData(brightness: brightness).textTheme;
    return base.apply(
      fontFamily: 'NotoSansSC',
      fontFamilyFallback: const ['NotoSerifSC', 'Lora'],
    );
  }

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(AppColors.primarySeed),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: ColorScheme.fromSeed(
      seedColor: Color(AppColors.primarySeed),
      brightness: Brightness.light,
    ).surface,
    textTheme: _baseTextTheme(Brightness.light),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: NoAnimationPageTransitionsBuilder(),
        TargetPlatform.iOS: NoAnimationPageTransitionsBuilder(),
        TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(AppColors.primarySeed),
      brightness: Brightness.dark,
    ),
    textTheme: _baseTextTheme(Brightness.dark),
  );
}

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  final bool allowSnapshotting;
  final bool allowEnterRouteSnapshotting;
  final Color? backgroundColor;

  const NoAnimationPageTransitionsBuilder({
    this.allowSnapshotting = true,
    this.allowEnterRouteSnapshotting = true,
    this.backgroundColor,
  });

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 👇 直接返回 child，不加任何动画
    return child;
  }
}
