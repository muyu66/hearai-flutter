import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

/// 微信登录按钮。
///
/// 使用微信品牌绿色作为填充背景，符合微信生态视觉规范。
class WechatLoginBtn extends StatelessWidget {
  const WechatLoginBtn({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  // 微信品牌绿
  static const Color _wechatGreen = Color(0xFF07C160);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.buttonHeight,
      width: 180,
      child: FilledButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: _wechatGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          ),
        ),
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.wechat, color: Colors.white, size: 20),
        label: Text(
          '微信登录',
          style: AppTextStyles.labelLarge(
            context,
          ).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
