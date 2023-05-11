import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_configuration_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/available_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class PaymentConfigurationRemoteDataSource {
  HttpService httpService;
  PaymentConfigurationQueryMutation paymentConfigurationQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  PaymentConfigurationRemoteDataSource({
    required this.httpService,
    required this.paymentConfigurationQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<AvailablePaymentMethod>> getAvailablePaymentMethods() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query': paymentConfigurationQueryMutation
              .getAvailablePaymentMethodsQuery(),
          'variables': {'request': {}},
        }),
        apiEndpoint: 'availablePaymentMethods',
      );
      _paymentConfigurationExceptionChecker(res: res);

      return List.from(res.data['data']['availablePaymentMethods'])
          .map((e) => AvailablePaymentMethodDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _paymentConfigurationExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
