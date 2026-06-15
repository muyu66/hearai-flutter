import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
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
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(AppColors.primarySeed),
      brightness: Brightness.dark,
    ),
  );
}
