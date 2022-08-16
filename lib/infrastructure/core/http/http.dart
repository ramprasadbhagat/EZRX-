import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';

class HttpService {
  static late Dio _dio;
  Dio dio() => _dio;

  HttpService({
    required Config config,
    required List<Interceptor> interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        sendTimeout: config.httpSendTimeout,
        connectTimeout: config.httpConnectTimeout,
        receiveTimeout: config.httpReceiveTimeout,
      ),
    );
    _dio.interceptors.addAll([
      ...interceptors,
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  Future<Response> request({
    required String method,
    required String url,
    dynamic data = const {}, // can be Map<String, dynamic> or FormData
    ResponseType responseType = ResponseType.json,
  }) async {
    // try {
    _dio.options.method = method;
    _dio.options.responseType = responseType;

    final response = await _dio.request(
      url,
      data: data,
    );
    return response;
    // } on DioError catch (e) {
    //   throw ServerException(
    //     code: e.response?.statusCode ?? 0,
    //     message: e.response?.data.toString() ?? '',
    //     //?? _readAbleErrorMessage(e),
    //   );
    // }
  }

  // String _readAbleErrorMessage(DioError error) {
  //   switch (error.error.runtimeType) {
  //     case SocketException:
  //       return 'Network Connection Error';
  //     case TimeoutException:
  //       return 'Timeout Error';
  //     default:
  //       return error.message;
  //   }
  // }
}
