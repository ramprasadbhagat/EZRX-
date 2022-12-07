import 'package:dio/dio.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';

class CountlyInterceptor extends Interceptor {
  final CountlyService countlyService;
  CountlyInterceptor({required this.countlyService});

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final apiEndpoint =
        response.requestOptions.headers['apiEndpoint'].toString(); 
    if (apiEndpoint.isNotEmpty && response.data['errors'] != null) {
      await countlyService.addCountlyEvent('API Failure', segmentation: {
        'API': apiEndpoint,
        'message': response.data['errors'][0]['message'],
      });
    }
    
    return super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final apiEndpoint = err.requestOptions.headers['apiEndpoint'].toString();
    if (apiEndpoint.isNotEmpty) {
      if (err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.receiveTimeout ||
          err.type == DioErrorType.sendTimeout) {
        await countlyService
            .addCountlyEvent('API Timeout', segmentation: {'API': apiEndpoint});
      } else {
        await countlyService.addCountlyEvent('API Failure', segmentation: {
          'API': apiEndpoint,
          'message': err.message,
        });
      }
    }

    return super.onError(err, handler);
  }
}
