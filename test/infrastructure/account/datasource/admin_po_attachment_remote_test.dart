import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/admin_po_attachment_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryMock extends Mock implements OrderHistory {}

void main() {
  late AdminPoAttachmentRemoteDataSource remoteDataSource;
  late Config config;
  late int pageSize;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton<Config>(config);
      pageSize = config.pageSize;
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = AdminPoAttachmentRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        adminPoAttachmentQueryMutation: AdminPoAttachmentQueryMutation(),
      );
    },
  );

  group(
    'AdminPoAttachmentRemoteDataSource',
    () {
      test('Get OrderHistory', () async {
        final variables = {
          'first': pageSize,
          'after': 0,
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getPOAttachmentResponse.json'),
        );

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.adminPoAttachmentQueryMutation
                .adminPoAttachmentQuery(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getAdminPoAttachment(
          offset: 0,
          pageSize: pageSize,
          filterQuery: {},
        );

        expect(
          result,
          List.from(res['data']['getPOAttachment'])
              .map((e) => AdminPoAttachmentDto.fromJson(e).toDomain())
              .toList(),
        );
      });

      test('status code not equal to 200', () async {
        final variables = {
          'first': pageSize,
          'after': 0,
        };
        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.adminPoAttachmentQueryMutation
                .adminPoAttachmentQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource.getAdminPoAttachment(
          offset: 0,
          pageSize: pageSize,
          filterQuery: {},
        ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([]);
        });
      });

      test('response with error', () async {
        final variables = {
          'first': pageSize,
          'after': 0,
        };
        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            200,
            {
              'data': null,
              'errors': [
                {'message': 'fake-error'},
              ],
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.adminPoAttachmentQueryMutation
                .adminPoAttachmentQuery(),
            'variables': variables,
          }),
        );

        await remoteDataSource.getAdminPoAttachment(
          offset: 0,
          pageSize: pageSize,
          filterQuery: {},
        ).onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value([]);
        });
      });
    },
  );
}
