import 'package:hearai/features/home/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'words_controller.g.dart';

@riverpod
class WordsController extends _$WordsController {
  late final WordRepository _repo = ref.read(wordRepositoryProvider);

  @override
  Future<List<WordDtoModel>> build() async {
    return _repo.getTodayWords();
  }

  Future<void> getTodayWords() async {
    state = await AsyncValue.guard(() => _repo.getTodayWords());
  }

  Future<void> report(String taskId, ReportWordDtoModel body) async {
    await _repo.report(taskId, body);
  }

  Future<void> getNextTaskTime() async {
    await _repo.getNextTaskTime();
  }
}
