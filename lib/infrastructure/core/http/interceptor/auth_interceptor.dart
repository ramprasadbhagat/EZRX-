import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final PackageInfoService packageInfoService;
  AuthInterceptor({
    required this.tokenStorage,
    required this.packageInfoService,
  });
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await tokenStorage.get();
      if (token.access.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer V2 ${token.access}';
      }
      options.headers['package'] = await packageInfoService.getPackageName();
      options.headers['version'] = await packageInfoService.getVersion();
      options.headers['build'] = await packageInfoService.getBuildNumber();
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
