import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/sign_up/sign_up.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isGoogleLoading = false;
  bool _isWechatLoading = false;

  @override
  void initState() {
    super.initState();
  }

  // --- Handlers ---

  Future<void> _onGoogleLogin() async {
    setState(() => _isGoogleLoading = true);
    try {
      await Future.delayed(const Duration(seconds: 1));
    } finally {
      if (mounted) setState(() => _isGoogleLoading = false);
    }
  }

  Future<void> _onWechatLogin() async {
    setState(() => _isWechatLoading = true);
    try {
      await Future.delayed(const Duration(seconds: 1));
    } finally {
      if (mounted) setState(() => _isWechatLoading = false);
    }
  }

  // --- Build ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Social login buttons
                GoogleLoginBtn(
                  onPressed: _onGoogleLogin,
                  isLoading: _isGoogleLoading,
                ),
                const SizedBox(height: AppDimensions.md),
                WechatLoginBtn(
                  onPressed: _onWechatLogin,
                  isLoading: _isWechatLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
