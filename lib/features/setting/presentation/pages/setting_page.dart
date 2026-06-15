import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/setting/setting.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),

          // 学习设置
          SectionTitle(
            title: 'learn',
            children: [
              SliderTile(
                title: 'sayRatio',
                value: 0,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    // _userProfile.sayRatio = value;
                  });
                },
                onChangeEnd: (value) {
                  // _updateSayRatio(value);
                },
              ),
              DropdownSelectionTile<int>(
                title: 'wordsLevel',
                value: 1,
                items: [
                  DropdownMenuItem(value: 1, child: Text('wordsLevel1')),
                  DropdownMenuItem(value: 2, child: Text('wordsLevel2')),
                  DropdownMenuItem(value: 3, child: Text('wordsLevel3')),
                  DropdownMenuItem(value: 4, child: Text('wordsLevel4')),
                  DropdownMenuItem(value: 5, child: Text('wordsLevel5')),
                ],
                onChanged: (value) async {
                  if (value == null) return;
                  // _updateWordsLevel(value);
                },
              ),
            ],
          ),

          const SizedBox(height: 42),
          _buildCopyright(context),
          const SizedBox(height: 52),
        ],
      ),
    );
  }

  // Header 区域
  Widget _buildHeader(BuildContext context) {
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
          Text("猪猪"),
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
