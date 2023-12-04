import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryDetailsMock extends Mock implements OrderHistoryDetails {}

void main() {
  late ViewByOrderDetailsRemoteDataSource remoteDataSource;
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
      remoteDataSource = ViewByOrderDetailsRemoteDataSource(
        httpService: service,
        config: Config(),
        viewByOrderDetailsQueryMutation: ViewByOrderDetailsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Order History Details',
    () {
      test('Get OrderHistory Details', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getOrderDetailsResponse.json'),
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
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
        );

        expect(
          result,
          OrderHistoryDetailsDto.fromJson(
            res['data']['orderHistoryV3']['orderHeaders'][0],
          ).toDomain(),
        );
      });

      test('status code not equal to 200', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
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
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryDetailsMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'searchKey': 'fake-searchKey',
          'language': 'fake-language',
          'soldTo': 'fake-soldTo',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
        };

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
            'query': remoteDataSource.viewByOrderDetailsQueryMutation
                .getOrderHistoryDetails(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetails(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          language: 'fake-language',
          shipTo: 'fake-shipTo',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryDetailsMock());
        });
      });
    },
  );
}
