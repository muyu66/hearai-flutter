import 'package:flutter/material.dart';

/// Full-screen or inline loading indicator.
///
/// When [fullScreen] is true the spinner is centered in a [Scaffold].
/// Otherwise render it inside your own layout.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.fullScreen = true, this.message});

  final bool fullScreen;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        if (message != null) ...[
          const SizedBox(height: 16),
          Text(message!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ],
    );

    if (!fullScreen) return Center(child: content);

    return Scaffold(body: Center(child: content));
  }
}
