import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

/// 答案选项卡片
class AnswerCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String answer;

  const AnswerCard({super.key, required this.answer, this.onTap});

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
        child: Center(child: Text(answer, style: context.textTheme.bodyMedium)),
      ),
    );
  }
}
