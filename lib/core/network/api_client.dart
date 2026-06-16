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
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxIiwibmlja25hbWUiOiJKb2huIERvZSIsImlzV2VjaGF0VXNlciI6dHJ1ZSwiaXNHb29nbGVVc2VyIjpmYWxzZX0.Q38Z9OhGGwPnLLD5LXxn2aHkwpgjA9QzJVs3xn9bCGo',
      },
    ),
  );

  dio.interceptors.addAll([
    ApiResponseInterceptor(), // 统一解包 { code, message, data }
    LoggingInterceptor(),
    // AuthInterceptor(),  // TODO: wire up after auth is implemented
  ]);

  return dio;
}
