import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/sign_up/sign_up.dart';

// 注册 - 登录
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final authRepository = sl<AuthRepository>();
  final authController = sl<AuthController>();

  // bool _isGoogleLoading = false;
  bool _isWechatLoading = false;
  final Fluwx _fluwx = Fluwx();

  @override
  void initState() {
    super.initState();
    _fluwx.addSubscriber(_onWechatAuthResponse);
  }

  // --- WeChat auth callback ---

  Future<void> _onWechatAuthResponse(WeChatResponse response) async {
    if (response is! WeChatAuthResponse) return;
    final code = response.code;
    if (code == null) return;

    try {
      final result = await authRepository.signUpWechat(
        SignUpWechatDtoModel(code: code),
      );

      if (!mounted) return;

      authController.setAuth(
        accessToken: result.accessToken,
        newUser: result.newUser,
      );
      // Navigation is handled by GoRouter's redirect — no manual push needed.
    } on Exception {
      if (mounted) {
        setState(() => _isWechatLoading = false);
      }
      debugPrint('SignUpPage: _onWechatAuthResponse: $response');
    }
  }

  // --- Handlers ---

  // Future<void> _onGoogleLogin() async {
  //   setState(() => _isGoogleLoading = true);
  //   try {
  //     await Future.delayed(const Duration(seconds: 1));
  //   } finally {
  //     if (mounted) {
  //       setState(() => _isGoogleLoading = false);
  //       context.push(RoutePaths.initSettings);
  //     }
  //   }
  // }

  Future<void> _onWechatLogin() async {
    setState(() => _isWechatLoading = true);
    try {
      await _fluwx.authBy(
        which: NormalAuth(scope: 'snsapi_userinfo', state: 'zhuzhu123'),
      );
      // The result comes back through _onWechatAuthResponse above.
    } finally {
      if (mounted) {
        setState(() => _isWechatLoading = false);
      }
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
                // GoogleLoginBtn(
                //   onPressed: _onGoogleLogin,
                //   isLoading: _isGoogleLoading,
                // ),
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
