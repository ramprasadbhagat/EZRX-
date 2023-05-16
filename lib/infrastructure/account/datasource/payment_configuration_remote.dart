import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:ezrxmobile/domain/account/error/payment_method_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_configuration_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/available_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/delete_payment_method_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/edit_payment_method_dto.dart';
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

  Future<EditPaymentMethod> updatePaymentMethods({
    required String salesOrg,
    required String oldPaymentMethod,
    required String newPaymentMethod,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query':
              paymentConfigurationQueryMutation.updatePaymentMethodsMutation(),
          'variables': {
            'input': {
              'salesOrg': salesOrg,
              'newPaymentMethod': newPaymentMethod,
              'oldPaymentMethod': oldPaymentMethod,
            },
          },
        }),
        apiEndpoint: 'updatePaymentMethodMutation',
      );
      _paymentConfigurationExceptionChecker(res: res);
      if (res.data['data']['updatePaymentMethods'] == null ||
          !res.data['data']['updatePaymentMethods']['success']) {
        throw const PaymentMethodException.paymentMethodUpdateFailure();
      }

      return EditPaymentMethodDto.fromJson(
        res.data['data']['updatePaymentMethods'],
      ).toDomain();
    });
  }

  Future<DeletePaymentMethod> deletePaymentMethods({
    required String salesOrg,
    required String paymentMethod,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpay',
        data: jsonEncode({
          'query':
              paymentConfigurationQueryMutation.deletePaymentMethodsMutation(),
          'variables': {
            'request': {
              'salesOrg': salesOrg,
              'paymentMethod': paymentMethod,
            },
          },
        }),
        apiEndpoint: 'deletePaymentMethods',
      );
      _paymentConfigurationExceptionChecker(res: res);
      if (res.data['data']['deletePaymentMethods'] == null ||
          !res.data['data']['deletePaymentMethods']['success']) {
        throw const PaymentMethodException.paymentMethodDeleteFailure();
      }

      return DeletePaymentMethodDto.fromJson(
        res.data['data']['deletePaymentMethods'],
      ).toDomain();
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
