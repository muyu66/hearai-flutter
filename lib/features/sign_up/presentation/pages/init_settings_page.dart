import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/setting/setting.dart';
import 'package:hearai/shared/shared.dart';
import 'package:go_router/go_router.dart';

// 注册 - 初始设置
class InitSettingsPage extends StatefulWidget {
  const InitSettingsPage({super.key});

  @override
  State<InitSettingsPage> createState() => _InitSettingsPageState();
}

class _InitSettingsPageState extends State<InitSettingsPage> {
  final authController = sl<AuthController>();
  final userRepository = sl<UserRepository>();

  // 用户选择的词汇量等级
  int _selectedLevel = 1;
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
                SectionTitle(
                  title: '首次配置',
                  children: [
                    DropdownSelectionTile<int>(
                      title: '每日单词数',
                      value: _selectedWordCount,
                      items: [
                        DropdownMenuItem(value: 5, child: Text('5 个')),
                        DropdownMenuItem(value: 10, child: Text('10 个')),
                        DropdownMenuItem(value: 30, child: Text('30 个')),
                        DropdownMenuItem(value: 50, child: Text('50 个')),
                        DropdownMenuItem(value: 80, child: Text('80 个')),
                        DropdownMenuItem(value: 100, child: Text('100 个')),
                      ],
                      onChanged: (value) async {
                        HapticsManager.light();
                        if (value == null) return;
                        setState(() {
                          _selectedWordCount = value;
                        });
                      },
                    ),
                    DropdownSelectionTile<int>(
                      title: '词汇量等级',
                      value: _selectedLevel,
                      items: [
                        DropdownMenuItem(value: 1, child: Text('单词宝宝')),
                        DropdownMenuItem(value: 2, child: Text('萌新蛋子')),
                        DropdownMenuItem(value: 3, child: Text('半熟菜鸟')),
                        DropdownMenuItem(value: 4, child: Text('老油条')),
                        DropdownMenuItem(value: 5, child: Text('Wordmon 大师')),
                      ],
                      onChanged: (value) async {
                        HapticsManager.light();
                        if (value == null) return;
                        setState(() {
                          _selectedLevel = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.xl),
                FilledButton.icon(
                  onPressed: () async {
                    HapticsManager.light();
                    await userRepository.updateProfile(
                      UpdateUserDtoModel(
                        dailyWordCount: _selectedWordCount,
                        wordLevel: _selectedLevel,
                      ),
                    );
                    authController.completeOnboarding();
                    if (!context.mounted) return;
                    context.go(RoutePaths.home);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.borderRadius,
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.menu_book,
                    color: Colors.white,
                    size: 24,
                  ),
                  iconAlignment: IconAlignment.start,
                  label: Text(
                    ' 让我们开始学习！ ',
                    style: AppTextStyles.labelLarge(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
