import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/notification/dtos/notification_dto.dart';

class NotificationRemoteDataSource {
  HttpService httpService;
  NotificationQuery notificationQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  NotificationRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.notificationQuery,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<Notifications> getNotification({
    required int page,
    required int perPage,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationQuery.getNotificationQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'page': page,
        'perPage': perPage,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}notifications',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'getClevertapNotifications',
      );

      _notificationExceptionChecker(res: res);

      return NotificationDto.fromJson(
        res.data['data']['getClevertapNotifications'],
      ).toDomain();
    });
  }

  Future<void> deleteAllNotifications() async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationQuery.clearNotification();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}notifications',
        data: jsonEncode({
          'query': queryData,
        }),
        apiEndpoint: 'clearAllClevertapNotifications',
      );

      _notificationExceptionChecker(res: res);
    });
  }

  Future<bool> readNotification({
    required int notificationId,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = notificationQuery.readNotification();
      final variables = {
        'notificationId': notificationId,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}notifications',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'changeClevertapNotificationStatus',
      );

      _notificationExceptionChecker(res: res);

      return true;
    });
  }

  void _notificationExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
