import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_repository_provider.g.dart';

@riverpod
WordRepository wordRepository(Ref ref) {
  return sl<WordRepository>();
}
