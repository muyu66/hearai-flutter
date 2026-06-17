import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';

/// 答案状态
enum AnswerState { correct, wrong }

/// 答案选项卡片
class AnswerCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String answer;
  final AnswerState? answerState;

  const AnswerCard({
    super.key,
    required this.answer,
    required this.answerState,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(AppDimensions.sm),
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.4,
            color: answerState == null
                ? Colors.grey.shade300
                : (answerState == AnswerState.correct
                      ? Colors.green
                      : Colors.red),
          ),
          color: Colors.white,
        ),
        child: Align(
          child: Text(answer, style: AppTextStyles.serifBody(context)),
        ),
      ),
    );
  }
}
