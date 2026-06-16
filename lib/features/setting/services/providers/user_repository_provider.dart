import 'package:hearai/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hearai/features/setting/setting.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return sl<UserRepository>();
}
