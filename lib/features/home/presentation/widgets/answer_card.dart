import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

// 单词卡
class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDimensions.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Center(child: Text("Card", style: context.textTheme.bodyMedium)),
    );
  }
}
