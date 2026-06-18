import 'package:dio/dio.dart';
import 'package:hearai/features/sign_up/sign_up.dart';

abstract interface class AuthRepository {
  Future<SignInfoModel> signUpWechat(SignUpWechatDtoModel dto);
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<SignInfoModel> signUpWechat(SignUpWechatDtoModel dto) async {
    final response = await dio.post("/auth/sign-up-wechat", data: dto.toJson());
    return SignInfoModel.fromJson(response.data);
  }
}
