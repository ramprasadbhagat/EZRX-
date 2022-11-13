import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';

class PriceOverrideRemoteDataSource {
  HttpService httpService;
  PriceOverrideQueryMutation priceOverrideQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PriceOverrideRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.priceOverrideQueryMutation,
  });

  void _priceOverrideExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
