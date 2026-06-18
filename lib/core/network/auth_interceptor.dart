import 'package:dio/dio.dart';

/// Injects the current auth token into every request's Authorization header.
///
/// The token is fetched lazily via [getToken] so it always reflects the
/// current [AuthController] state (post-login, post-restore, post-logout).
class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.getToken});

  final String? Function() getToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
