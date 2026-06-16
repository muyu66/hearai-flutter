import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/shared/shared.dart';
import 'package:go_router/go_router.dart';

// 注册 - 初始设置
class InitSettingsPage extends StatefulWidget {
  const InitSettingsPage({super.key});

  @override
  State<InitSettingsPage> createState() => _InitSettingsPageState();
}

class _InitSettingsPageState extends State<InitSettingsPage> {
  final List<SelectOption<int>> _levels = [
    SelectOption(label: '单词宝宝', value: 1),
    SelectOption(label: '萌新蛋子', value: 2),
    SelectOption(label: '半熟菜鸟', value: 3),
    SelectOption(label: '老油条', value: 4),
    SelectOption(label: 'Wordmon 大师', value: 5),
    SelectOption(label: '做题来评估', value: -1),
  ];

  // 用户选择的词汇量等级
  Set<int> _selectedLevel = {1};
  // 用户的单词数量
  int _selectedWordCount = 10;

  @override
  void initState() {
    super.initState();
  }

  // --- Build ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSlider(
                  title: '每日单词数',
                  value: _selectedWordCount,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  onChanged: (value) {
                    setState(() {
                      _selectedWordCount = value;
                    });
                  },
                  onChangeEnd: (value) {
                    _selectedWordCount = value;
                  },
                ),
                SelectableCard<int>(
                  options: _levels,
                  multiSelect: false,
                  selectedValues: _selectedLevel,
                  onChanged: (newSelected) {
                    HapticsManager.light();
                    setState(() => _selectedLevel = newSelected);
                  },
                ),
                AppButton(
                  label: "让我们开始！",
                  onPressed: () {
                    HapticsManager.light();
                    context.go(RoutePaths.home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
