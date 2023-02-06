import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class StockInfoMock extends Mock implements StockInfo {}

void main() {
  late StockInfoRemoteDataSource remoteDataSource;
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
      remoteDataSource = StockInfoRemoteDataSource(
        httpService: service,
        config: Config(),
        stockInfoQueryMutation: StockInfoQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Stock Information',
    () {
      test('Get StockInfo', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/stockInformationResponse.json'),
        );

        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.stockInfoQueryMutation.getStockInfo(),
            'variables': {
              'materialNumber': 'fake-material',
              'plant': 'fake-plant',
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
            },
          }),
        );

        final result = await remoteDataSource.getStockInfo(
          materialNumber: 'fake-material',
          plant: 'fake-plant',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        );

        expect(result,
            StockInfoDto.fromJson(res['data']['stockInformation']).toDomain());
      });

      test('Get StockInfoList', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/stockInformationListResponse.json'),
        );

        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.stockInfoQueryMutation.getStockInfoList(),
            'variables': {
              'materialNumber': 'fake-material',
              'plant': 'fake-plant',
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
            },
          }),
        );

        final result = await remoteDataSource.getStockInfoList(
          materialNumber: 'fake-material',
          plant: 'fake-plant',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        );

        expect(
            result,
            List.from(res['data']['stockInformationList'])
                .map((e) => StockInfoDto.fromJson(e).toDomain())
                .toList());
      });

      test('statuscode not equal to 200', () async {

        dioAdapter.onPost(
          '/api//order',
          (server) => server.reply(
            205,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.stockInfoQueryMutation.getStockInfo(),
            'variables': {
              'materialNumber': 'fake-material',
              'plant': 'fake-plant',
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
            },
          }),
        );

        await remoteDataSource
            .getStockInfo(
          materialNumber: 'fake-material',
          plant: 'fake-plant',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(StockInfoMock());
        });
      });

      test('response with error', () async {

        dioAdapter.onPost(
          '/api//order',
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
            'query': remoteDataSource.stockInfoQueryMutation.getStockInfo(),
            'variables': {
              'materialNumber': 'fake-material',
              'plant': 'fake-plant',
              'customerCode': 'fake-customercode',
              'salesOrganisation': 'fake-salesorg',
            },
          }),
        );

        await remoteDataSource
            .getStockInfo(
          materialNumber: 'fake-material',
          plant: 'fake-plant',
          salesOrg: 'fake-salesorg',
          selectedCustomerCode: 'fake-customercode',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(StockInfoMock());
        });
      });
    },
  );
}
