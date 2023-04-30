import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MockPrice extends Mock implements Price {}

void main() {
  late MaterialPriceRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

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
      remoteDataSource = MaterialPriceRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: MaterialPriceQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Material Price',
    () {
      test('Get Material List', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-code',
          'request': [],
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getMaterialPriceResponse.json'),
        );

        dioAdapter.onPost(
          '/api/pricing',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getMaterialPrice(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getMaterialPriceList(
          customerCode: 'fake-customer-code',
          salesDeal: [],
          materialNumbers: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-code',
        );
        final priceData = res['data']['price'];

        expect(
            result,
            List.from(priceData)
                .map((e) => PriceDto.fromJson(e).toDomain())
                .toList());
      });

      test('Get Material Price test', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'salesDeal': [],
          },
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getMaterialPriceResponse.json'),
        );

        dioAdapter.onPost(
          '/api/pricing',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getMaterialPrice(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getMaterialPrice(
          customerCode: 'fake-customer-code',
          salesDeal: [],
          materialNumber: 'fake-number',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-code',
        );
        final priceData = res['data']['price'][0];

        expect(
          result,
          PriceDto.fromJson(priceData).toDomain(),
        );
      });

      test('Statuscode not equal to 200', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-code',
          'request': [],
        };

        dioAdapter.onPost(
          '/api/pricing',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getMaterialPrice(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getMaterialPriceList(
          customerCode: 'fake-customer-code',
          salesDeal: [],
          materialNumbers: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-code',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MockPrice>[]);
        });
      });

      test('response with errors', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipToCode': 'fake-ship-code',
          'request': {
            'MaterialNumber': 'fake-number',
            'salesDeal': [],
          },
        };

        dioAdapter.onPost(
          '/api/pricing',
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
            'query': remoteDataSource.queryMutation.getMaterialPrice(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getMaterialPriceList(
          customerCode: 'fake-customer-code',
          salesDeal: [],
          materialNumbers: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-ship-code',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MockPrice>[]);
        });
      });
    },
  );
}
