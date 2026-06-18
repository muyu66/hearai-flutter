import 'package:just_audio/just_audio.dart';

class AudioManager {
  // 单例
  AudioManager._internal();
  static final AudioManager instance = AudioManager._internal();
  factory AudioManager() => instance;

  final _player = AudioPlayer();

  Future<void> playUrl(String url) async {
    if (isPlaying()) {
      await _player.stop(); // 播放新音频前先停止当前音频
    }
    await _player.setUrl(url);
    await _player.play();
  }

  /// 暂停
  Future<void> pause() => _player.pause();

  /// 停止
  Future<void> stop() async {
    if (isPlaying()) {
      await _player.stop();
    }
  }

  /// 设置音量
  Future<void> setVolume(double volume) => _player.setVolume(volume);

  /// 是否正在播放
  bool isPlaying() {
    return _player.playing;
  }
}
