import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hearai/core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    // TODO: replace with actual init logic (auth check, data preload)
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(RoutePaths.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -0.4),
        child: Text(
          'Hi',
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
