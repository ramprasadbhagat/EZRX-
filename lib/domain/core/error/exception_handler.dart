import 'package:dio/dio.dart';

class DataSourceExceptionHandler {
  Future<dynamic> handle(Function function) async {
    try {
      return await function();
    } catch (e) {
      rethrow;
    }
  }

  bool isServerResponseError({
    required Response<dynamic> res,
    bool? additionalCondition,
  }) {
    final isServerResponseError = res.data is Map &&
        res.data['errors'] != null &&
        res.data['errors'].isNotEmpty;
    if (additionalCondition != null) {
      return isServerResponseError && additionalCondition;
    }

    return isServerResponseError;
  }
}
