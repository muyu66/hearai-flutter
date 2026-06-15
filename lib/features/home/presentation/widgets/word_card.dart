import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';

// 单词卡
class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Word', style: context.textTheme.headlineMedium)],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(AppDimensions.md),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(), // 禁用滚动
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: [
                AnswerCard(),
                AnswerCard(),
                AnswerCard(),
                AnswerCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
