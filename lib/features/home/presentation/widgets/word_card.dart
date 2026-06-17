import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';

/// 单词卡状态
enum WordState { thinking, answer }

/// 单词卡
class WordCard extends StatefulWidget {
  const WordCard({super.key, required this.word, required this.onResult});

  final WordDtoModel word;
  final Function(int thinkingTime, int failedCount) onResult;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  // 思考计数器
  final Stopwatch _stopwatch = Stopwatch();
  // 选择的答案 无论正确与否
  int _selectIndex = 0;
  // 是否显示答案
  bool _showAnswer = false;

  @override
  void initState() {
    super.initState();
    _thinkingTimer = Timer(const Duration(seconds: 5), () => _toAnswer());
  }

  @override
  void dispose() {
    _stopwatch.stop();
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

  AnswerState? _getState(int index) {
    final isCorrect = widget.word.correctAnswerIndex == index;
    final isSelected = _selectIndex == index;

    // 不展示答案，则返回null
    if (!_showAnswer) {
      return null;
    }

    // 选择的答案，一定显示正确与否
    if (isSelected) {
      return isCorrect ? AnswerState.correct : AnswerState.wrong;
    }
    // 未选择的答案，除了正确答案都不显示
    return isCorrect ? AnswerState.correct : null;
  }

  void _onSelect(int index) {
    if (_showAnswer) return;

    setState(() {
      _selectIndex = index;
      _showAnswer = true;
    });

    _stopwatch.stop();
    final int thinkingTime = _stopwatch.elapsedMilliseconds;

    widget.onResult(
      thinkingTime,
      // 选择了错误答案，则上报错误次数=1
      index == widget.word.correctAnswerIndex ? 0 : 1,
    );
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
                style: AppTextStyles.wordDisplay(context: context),
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
        switch (widget.word.questionMode) {
          case QuestionMode.TRAN_TO_WORD:
            return Text('拼写？', style: context.textTheme.titleMedium);
          case QuestionMode.WORD_TO_SOUND:
            return Text('发音？', style: context.textTheme.titleMedium);
          case QuestionMode.SOUND_TO_TRAN:
            return Text('中文释义？', style: context.textTheme.titleMedium);
          case QuestionMode.WORD_TO_TRAN:
            return Text('中文释义？', style: context.textTheme.titleMedium);
        }

      case WordState.answer:
        _stopwatch.reset();
        _stopwatch.start();

        final answers = [
          widget.word.answers[0],
          widget.word.answers[1],
          widget.word.answers[2],
          "我不知道",
        ];

        return Center(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: answers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return AnswerCard(
                answer: answers[index],
                answerState: _getState(index),
                onTap: () => _onSelect(index),
              );
            },
          ),
        );
    }
  }
}
