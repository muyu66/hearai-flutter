import 'package:dio/dio.dart';

/// Logs request and response details in debug mode.
///
/// In production, log level should be capped to [LogLevel.none] or
/// replaced with a crashlytics-aware interceptor.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ignore: avoid_print
    print('→ ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: avoid_print
    print('← ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // ignore: avoid_print
    print('✗ ${err.response?.statusCode ?? 'N/A'} ${err.requestOptions.uri}');
    handler.next(err);
  }
}
