import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';

// 主页
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // 底部文字提示区，当为空字符串时会隐藏底部提示区
  String _hint = '';
  // 是否锁住滚动
  bool _lockScroll = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wordsAsync = ref.watch(wordsControllerProvider);

    return Scaffold(
      appBar: null,
      body: wordsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          return Center(child: Text('Error: $e'));
        },
        data: (words) {
          return SafeArea(
            child: Stack(
              alignment: const Alignment(0, -0.4),
              children: [
                PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      // 空字符串会隐藏提示区
                      _hint = '';
                      // 重新锁定
                      _lockScroll = true;
                    });

                    // WordDtoModel word = words[index - 1];
                    // ref
                    //     .read(wordsControllerProvider.notifier)
                    //     .report(
                    //       word.taskId,
                    //       ReportWordDtoModel(
                    //         taskWordId: word.id,
                    //         failedCount: 0,
                    //         thinkingTime: 0,
                    //         master: false,
                    //       ),
                    //     );
                  },
                  physics: _lockScroll
                      ? const NeverScrollableScrollPhysics()
                      : const _OnlyNextPagePhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: words.length + 1,
                  itemBuilder: (context, index) {
                    if (index == words.length) {
                      return WaitingCard();
                    }
                    WordDtoModel word = words[index];
                    return WordCard(
                      word: word,
                      onResult: (int thinkingTime, int failedCount) async {
                        await ref
                            .read(wordsControllerProvider.notifier)
                            .report(
                              word.taskId,
                              ReportWordDtoModel(
                                taskWordId: word.id,
                                failedCount: failedCount,
                                thinkingTime: thinkingTime,
                              ),
                            );

                        setState(() {
                          _hint = failedCount > 0
                              ? '别气馁，继续下一个'
                              : 'Perfect! 让我们继续';
                          // 解锁滚动
                          _lockScroll = false;
                        });
                      },
                    );
                  },
                ),
                // 顶部按钮区
                Positioned(
                  top: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          HapticsManager.light();
                          context.push(RoutePaths.setting);
                        },
                        icon: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
                // 底部提示区
                if (_hint != '')
                  Positioned(
                    bottom: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_upward),
                        ),
                        Text(_hint, style: context.textTheme.bodySmall),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// 只允许下一个页面滑动
class _OnlyNextPagePhysics extends ScrollPhysics {
  const _OnlyNextPagePhysics({super.parent});

  @override
  _OnlyNextPagePhysics applyTo(ScrollPhysics? ancestor) {
    return _OnlyNextPagePhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // 禁止回滑
    if (value < position.pixels) {
      return value - position.pixels;
    }

    return super.applyBoundaryConditions(position, value);
  }
}
