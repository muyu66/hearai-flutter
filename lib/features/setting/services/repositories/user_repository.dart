import 'package:hearai/features/setting/setting.dart';
import 'package:dio/dio.dart';

abstract interface class UserRepository {
  Future<UserDtoModel> getProfile();
  Future<UserDtoModel> updateProfile(UpdateUserDtoModel body);
}

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<UserDtoModel> getProfile() async {
    final response = await dio.get("/users/me");
    return UserDtoModel.fromJson(response.data);
  }

  @override
  Future<UserDtoModel> updateProfile(UpdateUserDtoModel body) async {
    final response = await dio.patch("/users/me", data: body.toJson());
    return UserDtoModel.fromJson(response.data);
  }
}
