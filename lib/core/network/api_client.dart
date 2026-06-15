import 'package:dio/dio.dart';
import 'package:hearai/core/core.dart' as api_const;

import 'api_interceptors.dart';

/// Pre-configured [Dio] HTTP client.
///
/// All network requests should go through this singleton so that
/// interceptors, timeouts, and base configuration are applied
/// uniformly.
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
    LoggingInterceptor(),
    // AuthInterceptor(),  // TODO: wire up after auth is implemented
  ]);

  return dio;
}
