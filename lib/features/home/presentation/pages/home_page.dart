import 'package:flutter/material.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';

// 主页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  // 是否显示底部提示区
  bool _displayBottomHint = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          alignment: const Alignment(0, -0.4),
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  // 用户知晓可以滑动之后，就不用提示了
                  _displayBottomHint = false;
                });
              },
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return WordCard();
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
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
            ),
            // 底部提示区
            if (_displayBottomHint)
              Positioned(
                bottom: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_upward),
                    ),
                    Text('无需记忆这个单词', style: context.textTheme.bodySmall),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
