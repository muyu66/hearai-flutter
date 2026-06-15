import 'package:flutter/material.dart';

/// Convenience getters on [BuildContext] to reduce boilerplate.
extension BuildContextX on BuildContext {
  // --- Theme ---
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // --- Media ---
  Size get mediaSize => MediaQuery.sizeOf(this);
  double get screenWidth => mediaSize.width;
  double get screenHeight => mediaSize.height;

  // --- Navigation ---
  NavigatorState get navigator => Navigator.of(this);
  void pop<T>([T? result]) => navigator.pop(result);
}
