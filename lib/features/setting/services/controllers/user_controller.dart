import 'package:hearai/features/setting/setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  late final UserRepository _repo = ref.read(userRepositoryProvider);

  @override
  Future<UserDtoModel> build() async {
    return _repo.getProfile();
  }

  Future<void> refreshProfile() async {
    state = await AsyncValue.guard(() => _repo.getProfile());
  }

  Future<void> updateProfile(UpdateUserDtoModel body) async {
    state = await AsyncValue.guard(() => _repo.updateProfile(body));
  }
}
