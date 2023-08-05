import 'package:dio/dio.dart';
import 'package:ezrxmobile/infrastructure/core/datadog/datadog_service.dart';

class DatadogInterceptor extends Interceptor {
  final DatadogService datadogService;

  DatadogInterceptor({
    required this.datadogService,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requestString =
        '***REQUEST***\n**URL**: ${options.uri.toString()}\n**DATA**: ${options.data.toString()}\n**HEADERS**: ${options.headers.toString()}';
    datadogService.logs?.info(requestString);

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    datadogService.logs?.info('***RESPONSE***: ${response.toString()}');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final errorString =
        '***ERROR***\n**URL**: ${err.requestOptions.uri.toString()}\n**DATA**: ${err.requestOptions.data.toString()}\n**HEADERS**: ${err.requestOptions.headers.toString()}\n**MESSAGE**: ${err.message}';
    datadogService.logs?.error(errorString);

    return super.onError(err, handler);
  }
}
