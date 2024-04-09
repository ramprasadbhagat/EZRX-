import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/notification_settings.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/notification_settings_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/notification_settings_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class NotificationSettingsRemoteDataSource {
  final NotificationSettingsMutation notificationSettingsMutation;
  final HttpService httpService;
  final Config config;
  NotificationSettingsRemoteDataSource({
    required this.notificationSettingsMutation,
    required this.httpService,
    required this.config,
  });

  Future<NotificationSettings> getNotificationSettings() async {
    final queryData = notificationSettingsMutation.getNotificationSettings();

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode({
        'query': queryData,
      }),
    );
    _exceptionChecker(res: res);

    final finalData = res.data['data']['getNotificationSettings']['settings'];

    return NotificationSettingsResponseDto.fromJson(finalData).toDomain;
  }

  Future<NotificationSettings> setNotificationSettings({
    required NotificationSettings notificationSettings,
  }) async {
    final queryData = notificationSettingsMutation.setNotificationSettings();

    final variables = {
      'request': {
        'orderConfirmation':
            notificationSettings.orderConfirmation.getOrCrash(),
        'paymentConfirmation':
            notificationSettings.paymentConfirmation.getOrCrash(),
        'ereturnConfirmation':
            notificationSettings.ereturnConfirmation.getOrCrash(),
      },
    };

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode({
        'query': queryData,
        'variables': variables,
      }),
    );
    _exceptionChecker(res: res);

    final finalData = res.data['data']['setNotificationSettings']['settings'];

    return NotificationSettingsResponseDto.fromJson(finalData).toDomain;
  }

  void _exceptionChecker({required Response<dynamic> res}) {
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
