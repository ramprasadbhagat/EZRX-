import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_document_type_aggregate_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderDocumentTypeMock extends Mock implements OrderDocumentType {}

void main() {
  late OrderDocumentTypeRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = OrderDocumentTypeRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: OrderDocumentTypeQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Order Document Type',
    () {
      test('Get OrderDocumentType List', () async {
        final variables = {'salesOrg': 'fake-sales-org'};
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/orderDocumentTypeResponse.json'),
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
            'query': remoteDataSource.queryMutation.getOrderDocumentType(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderDocumentTypList(
          salesOrgCode: 'fake-sales-org',
        );
        final orderDocumentTypeData =
            res['data']['orderDocumentType']['documentTypes'];

        expect(
            result,
            List.from(orderDocumentTypeData)
                .map((e) => OrderDocumentTypeDto.fromJson(e).toDomain())
                .toList());
      });

      test('statuscode not equal to 200', () async {
        final variables = {'salesOrg': 'fake-sales-org'};

        dioAdapter.onPost(
          '/api/order',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getOrderDocumentType(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderDocumentTypList(
          salesOrgCode: 'fake-sales-org',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<OrderDocumentTypeMock>[]);
        });
      });

      test('response with error', () async {
        final variables = {'salesOrg': 'fake-sales-org'};

        dioAdapter.onPost(
          '/api/order',
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
            'query': remoteDataSource.queryMutation.getOrderDocumentType(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderDocumentTypList(
          salesOrgCode: 'fake-sales-org',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<OrderDocumentTypeMock>[]);
        });
      });
    },
  );
}
