import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';

class HttpService {
  static late Dio _dio;
  Dio dio() => _dio;

  HttpService({
    required Config config,
    required List<Interceptor> interceptors,
  }) {
    _dio = Dio(BaseOptions(baseUrl: config.baseUrl));
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      ...interceptors,
    ]);
  }

  Future<Response> request({
    required String method,
    required String url,
    dynamic data = const {}, // can be Map<String, dynamic> or FormData
  }) async {
    try {
      _dio.options.method = method;
      final response = await _dio.request(
        url,
        data: data,
      );
      return response;
    } on DioError catch (e) {
      throw ServerException(
        code: e.response?.data?['code'] ?? 0,
        message: e.response?.data?['error'] ?? _readAbleErrorMessage(e),
      );
    }
  }

  String _readAbleErrorMessage(DioError error) {
    switch (error.error.runtimeType) {
      case SocketException:
        return 'Network Connection Error';
      case TimeoutException:
        return 'Timeout Error';
      default:
        return error.message;
    }
  }
}
