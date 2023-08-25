import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_remote.dart';
import 'package:ezrxmobile/infrastructure/notification/dtos/notification_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class NotificationMock extends Mock implements Notifications {}

void main() {
  late NotificationRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat-my.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = NotificationRemoteDataSource(
      httpService: service,
      dataSourceExceptionHandler: DataSourceExceptionHandler(),
      config: Config(),
      notificationQuery: NotificationQuery(),
    );
  });
  group('Notification remote data source test', () {
    test('Get notification', () async {
      final res = json.decode(
        await rootBundle
            .loadString('assets/json/getClevertapNotificationsResponse.json'),
      );

      dioAdapter.onPost(
        '/api/notifications',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.notificationQuery.getNotificationQuery(),
          'variables': {
            'page': 1,
            'perPage': 24,
          },
        }),
      );

      final result = await remoteDataSource.getNotification(
        page: 1,
        perPage: 24,
      );

      expect(
        result,
        NotificationDto.fromJson(res['data']['getClevertapNotifications'])
            .toDomain(),
      );
    });
    test('Get notification', () async {
      final res = json.decode(
        await rootBundle
            .loadString('assets/json/getClevertapNotificationsResponse.json'),
      );

      dioAdapter.onPost(
        '/api/notifications',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.notificationQuery.getNotificationQuery(),
          'variables': {
            'page': 1,
            'perPage': 24,
          },
        }),
      );

      final result = await remoteDataSource.getNotification(
        page: 1,
        perPage: 24,
      );

      expect(
        result,
        NotificationDto.fromJson(res['data']['getClevertapNotifications'])
            .toDomain(),
      );
    });
    test('Read notification', () async {
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/changeClevertapNotificationStatusResponse.json',
        ),
      );

      dioAdapter.onPost(
        '/api/notifications',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.notificationQuery.readNotification(),
          'variables': {
            'notificationId': 13610,
          },
        }),
      );

      final result = await remoteDataSource.readNotification(
        notificationId: 13610,
      );

      expect(
        result,
        res['data']['changeClevertapNotificationStatus']['message'] ==
            'Change status done',
      );
    });
    test('Delete notification', () async {
      final res = {
        'data': {
          'clearAllClevertapNotifications': {'message': 'clear done'},
        }
      };

      dioAdapter.onPost(
        '/api/notifications',
        (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.notificationQuery.clearNotification(),
        }),
      );

      expect(remoteDataSource.deleteAllNotifications(), completes);
    });

    test('statuscode not equal to 200', () async {
      dioAdapter.onPost(
        '/api/notifications',
        (server) => server.reply(
          205,
          {'data': []},
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.notificationQuery.getNotificationQuery(),
          'variables': {
            'page': 1,
            'perPage': 24,
          },
        }),
      );

      await remoteDataSource
          .getNotification(
        page: 1,
        perPage: 24,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(NotificationMock());
      });
    });

    test('response with error', () async {
      dioAdapter.onPost(
        '/api/notifications',
        (server) => server.reply(
          200,
          {
            'data': null,
            'errors': [
              {'message': 'fake-error'}
            ],
          },
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: jsonEncode({
          'query': remoteDataSource.notificationQuery.getNotificationQuery(),
          'variables': {
            'page': 1,
            'perPage': 24,
          },
        }),
      );

      await remoteDataSource
          .getNotification(
        page: 1,
        perPage: 24,
      )
          .onError((error, _) async {
        expect(error, isA<ServerException>());
        return Future.value(NotificationMock());
      });
    });
  });
}
