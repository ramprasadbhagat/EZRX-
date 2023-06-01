import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_payment_notification_mutation.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

import 'package:ezrxmobile/domain/account/entities/update_payment_notification_response.dart';

import 'package:ezrxmobile/infrastructure/account/dtos/update_payment_notification_response_dto.dart';

import 'package:ezrxmobile/config.dart';

class UpdatePaymentNotificationRemoteDataSource {
  HttpService httpService;
  UpdatePaymentNotificationMutation updatePaymentNotificationMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  UpdatePaymentNotificationRemoteDataSource({
    required this.httpService,
    required this.updatePaymentNotificationMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<UpdatePaymentNotificationResponse> updatePaymentNotification({
    required bool disablePaymentNotification,
    required List<Map<String, dynamic>> paymentNotification,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final data = {
        'disablePaymentNotification': disablePaymentNotification,
        'paymentNotification': paymentNotification,
      };
      final mutation =
          updatePaymentNotificationMutation.updatePaymentNotificationMutation();
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ezpayMutation',
        data: jsonEncode({
          'query': mutation,
          'variables': {
            'input': data,
          },
        }),
      );
      _updatePaymentNotificationExceptionChecker(res: res);

      return UpdatePaymentNotificationResponseDto.fromJson(
        res.data['data']['updatePaymentConfig'],
      ).toDomain();
    });
  }

  void _updatePaymentNotificationExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
