import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/auth/local_storage/i_token_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  final ITokenStorage tokenStorage;
  AuthInterceptor({required this.tokenStorage});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await tokenStorage.get();
      if (token.access.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer V2 ${token.access}';
      }
    } on LocalException catch (e) {
      debugPrint('load token failure: ${e.message}');
    }
    options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    // options.headers['Accept-Language'] = 'en';

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // debugPrint('onResponse ${response.statusCode} ${response.data}');
    // if (response.requestOptions.path.contains('/api/loginAd') &&
    //     response.statusCode == 200) {
    //   tokenStorage.set(jwtDto);
    // }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    // debugPrint('onError ${error.response?.statusCode} ${error.response?.data}');
    return super.onError(err, handler);
  }
}
