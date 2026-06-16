import 'package:hearai/features/home/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'next_task_time_controller.g.dart';

@riverpod
class NextTaskTimeController extends _$NextTaskTimeController {
  late final WordRepository _repo = ref.read(wordRepositoryProvider);

  @override
  Future<NextTaskTimeDtoModel> build() async {
    return _repo.getNextTaskTime();
  }
}
