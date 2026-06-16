import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import 'api_response.dart';

/// 拦截所有响应，统一解包后端的 [ApiResponse] 包装：
///   { code, message, data } → response.data = data
///
/// code != 200 时抛 [ServerException]，由上层统一处理。
class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final body = response.data;

    if (body is Map<String, dynamic> && body.containsKey('code')) {
      final apiResponse = ApiResponse.fromJson(body, null);

      if (apiResponse.isSuccess) {
        response.data = apiResponse.data;
      } else {
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: ServerException(
              statusCode: apiResponse.code,
              message: apiResponse.message,
            ),
          ),
        );
        return;
      }
    }

    handler.next(response);
  }
}
