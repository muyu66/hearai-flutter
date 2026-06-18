import 'package:dio/dio.dart';
import 'package:hearai/core/core.dart' as api_const;

import 'api_interceptors.dart';
import 'api_response_interceptor.dart';

Dio createApiClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: api_const.ApiConstants.baseUrl,
      connectTimeout: api_const.ApiConstants.connectTimeout,
      receiveTimeout: api_const.ApiConstants.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.addAll([
    ApiResponseInterceptor(), // 统一解包 { code, message, data }
    LoggingInterceptor(),
  ]);

  return dio;
}
