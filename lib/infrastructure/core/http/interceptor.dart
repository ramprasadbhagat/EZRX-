import 'package:dio/dio.dart';
import 'package:ezrxmobile/infrastructure/auth/local_storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  AuthInterceptor({required this.tokenStorage});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await tokenStorage.get();
      options.headers['Authorization'] = 'Bearer V2 ${token.access}';
    } catch (_) {}
    options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    // options.headers['Accept-Language'] = 'en';

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // print('onResponse ${response.statusCode} ${response.data}');
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
    // print('onError ${error.response?.statusCode} ${error.response?.data}');
    return super.onError(err, handler);
  }
}
