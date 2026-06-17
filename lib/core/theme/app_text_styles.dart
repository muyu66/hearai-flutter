import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  // --- Display ---
  static TextStyle displayLarge(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge!;

  // --- Headline ---
  static TextStyle headlineLarge(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge!;
  static TextStyle headlineMedium(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!;
  static TextStyle headlineSmall(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall!;

  // --- Body ---
  static TextStyle bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!;
  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;
  static TextStyle bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;

  // --- Label ---
  static TextStyle labelLarge(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge!;
  static TextStyle labelMedium(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium!;

  // --- 英文单词展示（Lora 衬线体）---
  static TextStyle wordDisplay({
    required BuildContext context,
    double? fontSize,
  }) => Theme.of(context).textTheme.headlineMedium!.copyWith(
    fontFamily: 'Lora',
    fontFamilyFallback: const ['NotoSansSC', 'NotoSerifSC'],
    fontSize: fontSize,
  );
}
