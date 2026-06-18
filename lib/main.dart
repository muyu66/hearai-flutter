import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

import 'app.dart';
import 'core/di/injection_container.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await initDependencies();
  await initFluwx();

  runApp(const HearAiApp());
}

Future<void> initFluwx() async {
  final wechatAppId = dotenv.get('WECHAT_APPID', fallback: '');

  final Fluwx fluwx = Fluwx();

  await fluwx.registerApi(appId: wechatAppId, doOnAndroid: true, doOnIOS: true);
  var result = await fluwx.isWeChatInstalled;
  debugPrint('WECHAT is installed = $result');
}
