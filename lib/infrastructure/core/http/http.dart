import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';

class HttpService {
  late Dio _dio;
  Dio dio() => _dio;

  HttpService({
    required Config config,
    required List<Interceptor> interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl(),
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

  HttpService.mockDio(Dio dio) : _dio = dio;

  Future<Response> request({
    required String method,
    required String url,
    dynamic data = const {}, // can be Map<String, dynamic> or FormData
    ResponseType responseType = ResponseType.json,
    String apiEndpoint = '',
    bool overrideBaseUrl = false,
    String cacheControl = '',
    Map<String, dynamic> headers = const <String, dynamic>{},
  }) async {
    try {
      if (overrideBaseUrl) _dio.options.baseUrl = url;

      _dio.options.method = method;
      _dio.options.responseType = responseType;
      _dio.options.headers['apiEndpoint'] = apiEndpoint;
      _dio.options.headers['cache-control'] = cacheControl;
      for (final headerInfo in headers.entries) {
        _dio.options.headers[headerInfo.key] = headerInfo.value;
      }

      return await _dio.request(
        url,
        data: data,
      );
    } on DioError catch (e) {
      throw e.error;
      // switch (e.error.runtimeType) {
      //   case SocketException:
      //     throw SocketException(message: e.message);
      //   case TimeoutException:
      //     throw TimeoutException(message: e.message);
      //   case HttpException:
      //     throw ServerException(message: e.message);
      //   case FormatException:
      //     throw FormatException(message: e.message);
      //   default:
      //     throw OtherException(message: e.message);
      // }
    }
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
