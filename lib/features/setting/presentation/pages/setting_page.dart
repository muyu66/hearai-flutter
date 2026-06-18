import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/setting/setting.dart';
import 'package:hearai/shared/shared.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userControllerProvider);

    return Scaffold(
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          return Center(child: Text('Error: $e'));
        },
        data: (user) {
          return ListView(
            children: [
              _buildHeader(context, user),
              const SizedBox(height: 16),

              // 学习设置
              SectionTitle(
                title: '学习设置',
                children: [
                  DropdownSelectionTile<int>(
                    title: '每日单词数',
                    value: user.dailyWordCount,
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
                      ref
                          .read(userControllerProvider.notifier)
                          .updateProfile(
                            UpdateUserDtoModel(dailyWordCount: value),
                          );
                      showClassicNotify(
                        context: context,
                        title: '明日生效',
                        dialogType: DialogType.success,
                      );
                    },
                  ),
                  DropdownSelectionTile<int>(
                    title: '词汇量等级',
                    value: user.wordLevel,
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
                      ref
                          .read(userControllerProvider.notifier)
                          .updateProfile(UpdateUserDtoModel(wordLevel: value));
                      showClassicNotify(
                        context: context,
                        title: '明日生效',
                        dialogType: DialogType.success,
                      );
                    },
                  ),
                  DropdownSelectionTile<PronType>(
                    title: '音标',
                    value: user.pronType,
                    items: [
                      DropdownMenuItem(value: PronType.US, child: Text('美式')),
                      DropdownMenuItem(value: PronType.UK, child: Text('英式')),
                    ],
                    onChanged: (value) async {
                      HapticsManager.light();
                      if (value == null) return;
                      ref
                          .read(userControllerProvider.notifier)
                          .updateProfile(UpdateUserDtoModel(pronType: value));
                      showClassicNotify(
                        context: context,
                        title: '重启应用后生效',
                        dialogType: DialogType.success,
                      );
                    },
                  ),
                  ClickableTile(
                    title: '隐私政策',
                    subtitle: '点击查看隐私政策',
                    icon: Icons.privacy_tip,
                    onTap: () {
                      HapticsManager.light();
                    },
                  ),
                ],
              ),

              const SizedBox(height: 42),
              _buildCopyright(context),
              const SizedBox(height: 52),
            ],
          );
        },
      ),
    );
  }

  // Header 区域
  Widget _buildHeader(BuildContext context, UserDtoModel user) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 返回
              IconButton(
                iconSize: 24,
                icon: Icon(Icons.arrow_back),
                onPressed: () async {
                  HapticsManager.light();
                  context.pop();
                },
              ),
              // 分享
              IconButton(
                iconSize: 24,
                icon: Icon(Icons.share),
                onPressed: () async {
                  HapticsManager.light();
                },
              ),
            ],
          ),
          Icon(Icons.account_circle, size: 72),
          const SizedBox(height: 12),
          Text(user.nickname, style: context.textTheme.titleLarge),
        ],
      ),
    );
  }

  // 版权
  Widget _buildCopyright(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("© 2026 zhuzhu"),
          const SizedBox(height: 4),
          Text("version 2.0"),
        ],
      ),
    );
  }
}
