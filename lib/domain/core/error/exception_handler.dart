import 'package:ezrxmobile/domain/core/error/exception.dart';

class DataSourceExceptionHandler {
  Future<dynamic> handle(Function function) async {
    try {
      return await function();
    } catch (e) {
      if (e is Exception) {
        rethrow;
      } else {
        throw OtherException(message: '$e');
      }
    }
  }
}
