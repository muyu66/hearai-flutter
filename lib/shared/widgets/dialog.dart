import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

Future<void> showConfirm({
  required BuildContext context,
  required String title,
  required DialogType dialogType,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
}) async {
  await AwesomeDialog(
    transitionAnimationDuration: const Duration(milliseconds: 200),
    context: context,
    headerAnimationLoop: false,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    titleTextStyle: context.textTheme.labelLarge,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    btnOkText: '',
    btnOkIcon: Icons.check,
    btnOkColor: context.colorScheme.tertiary,
    btnCancelText: '',
    btnCancelIcon: Icons.close,
    btnCancelColor: context.colorScheme.error,
    btnCancelOnPress:
        onCancel ??
        () {
          HapticsManager.light();
        },
    btnOkOnPress: onConfirm,
  ).show();
}

Future<void> showNotify({
  required BuildContext context,
  required String title,
}) async {
  await AwesomeDialog(
    transitionAnimationDuration: const Duration(milliseconds: 200),
    context: context,
    headerAnimationLoop: false,
    customHeader: Text("😊", style: TextStyle(fontSize: 46)),
    animType: AnimType.scale,
    title: title,
    titleTextStyle: context.textTheme.titleMedium,
    padding: EdgeInsets.fromLTRB(12, 0, 12, 24),
    autoHide: Duration(milliseconds: 1200),
  ).show();
}

Future<void> showOk({required BuildContext context}) async {
  await AwesomeDialog(
    transitionAnimationDuration: const Duration(milliseconds: 150),
    context: context,
    headerAnimationLoop: false,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    body: null,
    width: 120,
    padding: EdgeInsets.zero,
    autoHide: Duration(milliseconds: 700),
    dialogBackgroundColor: Colors.white.withAlpha(0),
  ).show();
}

Future<void> showClassicNotify({
  required BuildContext context,
  required String title,
  required DialogType dialogType,
}) async {
  await AwesomeDialog(
    transitionAnimationDuration: const Duration(milliseconds: 200),
    context: context,
    headerAnimationLoop: false,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    titleTextStyle: context.textTheme.titleLarge,
    padding: EdgeInsets.fromLTRB(12, 12, 12, 24),
    autoHide: Duration(milliseconds: 1200),
  ).show();
}
