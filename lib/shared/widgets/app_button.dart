import 'package:flutter/material.dart';

/// Reusable button with standardised styling.
///
/// Wrap common variants (primary, secondary, ghost) in named
/// constructors or static factory methods.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final effectiveLabel = isLoading ? '' : label;
    final effectiveIcon = isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : icon;

    return switch (variant) {
      AppButtonVariant.primary => FilledButton.icon(
        onPressed: onPressed,
        icon: effectiveIcon,
        label: Text(effectiveLabel),
      ),
      AppButtonVariant.secondary => OutlinedButton.icon(
        onPressed: onPressed,
        icon: effectiveIcon,
        label: Text(effectiveLabel),
      ),
      AppButtonVariant.ghost => TextButton.icon(
        onPressed: onPressed,
        icon: effectiveIcon,
        label: Text(effectiveLabel),
      ),
    };
  }
}

enum AppButtonVariant { primary, secondary, ghost }
