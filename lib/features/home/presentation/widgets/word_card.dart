import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';

/// 单词卡状态
enum WordState { thinking, answer, result }

/// 单词卡
class WordCard extends StatefulWidget {
  const WordCard({super.key, required this.word});

  final WordDtoModel word;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  void initState() {
    super.initState();
    _thinkingTimer = Timer(const Duration(seconds: 3), () => _toAnswer());
  }

  @override
  void dispose() {
    _thinkingTimer?.cancel();
    super.dispose();
  }

  WordState _state = WordState.thinking;
  Timer? _thinkingTimer;

  void _toAnswer() {
    if (_state == WordState.thinking) {
      setState(() => _state = WordState.answer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 上半部分：单词 (40%)
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.word.question,
                style: context.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        // 下半部分：状态内容 (60%)
        Expanded(
          flex: 7,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              margin: const EdgeInsets.all(AppDimensions.md),
              alignment: Alignment.center,
              child: _buildContent(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (_state) {
      case WordState.thinking:
        return Text('默想它的中文释义', style: context.textTheme.bodyLarge);

      case WordState.answer:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: AnswerCard(
                    onTap: () => setState(() => _state = WordState.result),
                    answer: widget.word.answers[0],
                  ),
                ),
                Expanded(
                  child: AnswerCard(
                    onTap: () => setState(() => _state = WordState.result),
                    answer: widget.word.answers[1],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AnswerCard(
                    onTap: () => setState(() => _state = WordState.result),
                    answer: widget.word.answers[2],
                  ),
                ),
                Expanded(
                  child: AnswerCard(
                    onTap: () => setState(() => _state = WordState.result),
                    answer: "我不知道",
                  ),
                ),
              ],
            ),
          ],
        );

      case WordState.result:
        return Text('✓ Perfect', style: context.textTheme.bodyLarge);
    }
  }
}
