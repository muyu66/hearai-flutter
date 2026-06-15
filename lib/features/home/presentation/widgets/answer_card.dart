import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

/// 答案选项卡片
class AnswerCard extends StatelessWidget {
  final VoidCallback? onTap;

  const AnswerCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(AppDimensions.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Center(child: Text("Card", style: context.textTheme.bodyMedium)),
      ),
    );
  }
}
