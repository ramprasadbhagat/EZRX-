import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementMock extends Mock implements Announcement {}

void main() {
  late AnnouncementRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AnnouncementRemoteDataSource(
        httpService: service,
        queryMutation: AnnouncementQueryMutation(),
        exceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );
  group(
    'Announcement remote',
    () {
      test(
        'Get announcement success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getAnnouncementsResponse.json'),
          );

          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getAnnouncementsQuery(),
            }),
          );

          final result = await remoteDataSource.getAnnouncements();

          expect(
            result,
            AnnouncementDto.fromJson(res['data']['getAnnouncements'][0])
                .toDomain,
          );
        },
      );

      test(
        'Get announcement success but empty',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              200,
              {
                'data': {
                  'getAnnouncements': [],
                }
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getAnnouncementsQuery(),
            }),
          );

          await remoteDataSource.getAnnouncements().onError((error, _) async {
            expect(error, isA<OtherException>());
            return Future.value(AnnouncementMock());
          });
        },
      );

      test(
        'Get announcement error with data null and have errors',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
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
              'query': remoteDataSource.queryMutation.getAnnouncementsQuery(),
            }),
          );

          await remoteDataSource.getAnnouncements().onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(AnnouncementMock());
          });
        },
      );

      test(
        'Get announcement error with status code != 200',
        () async {
          dioAdapter.onPost(
            '/api/strapiEngine',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getAnnouncementsQuery(),
            }),
          );

          await remoteDataSource.getAnnouncements().onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(AnnouncementMock());
          });
        },
      );
    },
  );
}
