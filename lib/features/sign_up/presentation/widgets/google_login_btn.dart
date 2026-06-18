import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hearai/core/core.dart';

/// Google 登录按钮。
///
/// 样式参考 Google Sign-In 品牌规范：浅色背景 + 彩色 G 字标。
class GoogleLoginBtn extends StatelessWidget {
  const GoogleLoginBtn({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  // 微信品牌绿
  static const Color _googleBlue = Color.fromARGB(255, 72, 123, 231);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.buttonHeight,
      width: 200,
      child: FilledButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: _googleBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          ),
        ),
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.white,
                size: 16,
              ),
        label: Text(
          'Google 登录',
          style: AppTextStyles.labelLarge(
            context,
          ).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
