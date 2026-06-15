import 'package:flutter/material.dart';

import 'package:hearai/core/core.dart';

/// Placeholder page for routes that haven't been implemented yet.
class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 64,
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: AppDimensions.lg),
            Text('Coming Soon', style: context.textTheme.headlineSmall),
            const SizedBox(height: AppDimensions.sm),
            Text(
              'This feature is under construction.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
