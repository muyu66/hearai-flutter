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
