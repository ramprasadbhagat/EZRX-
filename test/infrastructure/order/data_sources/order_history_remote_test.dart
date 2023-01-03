import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryMock extends Mock implements OrderHistory {}

void main() {
  late OrderHistoryRemoteDataSource remoteDataSource;
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
      remoteDataSource = OrderHistoryRemoteDataSource(
        httpService: service,
        config: Config(),
        orderHistoryQueryMutation: OrderHistoryQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Order History',
    () {
      test('Get OrderHistory', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'fromDate': '20220906',
          'toDate': '20221008',
          'sort': 'ASC',
          'orderNumber': 'fake-orderid',
          'poReference': 'fake-poreference',
          'materialSearch': 'fake-material',
          'principalSearch': 'fake-material',
          'companyName': 'fake-companyname',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getOrderHistoryV2Response.json'),
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
            'query':
                remoteDataSource.orderHistoryQueryMutation.getOrderHistoryRep(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderHistory(
            companyName: 'fake-companyname',
            fromDate: '20220906',
            materialSearch: 'fake-material',
            offset: 0,
            orderBy: 'fake-order',
            pageSize: 10,
            poNumber: 'fake-poreference',
            principalSearch: 'fake-material',
            shipTo: 'fake-shipto',
            soldTo: 'fake-soldto',
            sort: 'ASC',
            toDate: '20221008',
            loginUserType: 'fake-loginusertype',
            orderId: 'fake-orderid');

        expect(
            result,
            OrderHistoryDto.fromJson(
              res['data']['orderHistoryV2']['OrderHistory'][0],
            ).toDomain());
      });

      test('Get OrderHistory for salesrep', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'fromDate': '20220906',
          'toDate': '20221008',
          'sort': 'ASC',
          'orderNumber': 'fake-orderid',
          'poReference': 'fake-poreference',
          'materialSearch': 'fake-material',
          'principalSearch': 'fake-material',
          'userName': 'fake-userName',
          'language': 'fake-language',
        };
        final res = json.decode(
          await rootBundle.loadString(
              'assets/json/getorderHistoryForSalesRepV2Response.json'),
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
            'query': remoteDataSource.orderHistoryQueryMutation
                .getOrderHistoryForSalesRep(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderHistorySalesRep(
            userName: 'fake-userName',
            language: 'fake-language',
            fromDate: '20220906',
            materialSearch: 'fake-material',
            offset: 0,
            orderBy: 'fake-order',
            pageSize: 10,
            poNumber: 'fake-poreference',
            principalSearch: 'fake-material',
            shipTo: 'fake-shipto',
            soldTo: 'fake-soldto',
            sort: 'ASC',
            toDate: '20221008',
            loginUserType: 'fake-loginusertype',
            orderId: 'fake-orderid');

        expect(
            result,
            OrderHistoryDto.fromJson(
              res['data']['orderHistoryForSalesRepV2']['OrderHistory'][0],
            ).toDomain());
      });

      test('statuscode not equal to 200', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'fromDate': '20220906',
          'toDate': '20221008',
          'sort': 'ASC',
          'orderNumber': 'fake-orderid',
          'poReference': 'fake-poreference',
          'materialSearch': 'fake-material',
          'principalSearch': 'fake-material',
          'companyName': 'fake-companyname',
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
            'query':
                remoteDataSource.orderHistoryQueryMutation.getOrderHistoryRep(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistory(
                companyName: 'fake-companyname',
                fromDate: '20220906',
                materialSearch: 'fake-material',
                offset: 0,
                orderBy: 'fake-order',
                pageSize: 10,
                poNumber: 'fake-poreference',
                principalSearch: 'fake-material',
                shipTo: 'fake-shipto',
                soldTo: 'fake-soldto',
                sort: 'ASC',
                toDate: '20221008',
                loginUserType: 'fake-loginusertype',
                orderId: 'fake-orderid')
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'soldTo': 'fake-soldto',
          'shipTo': ['fake-shipto'],
          'first': 10,
          'after': 0,
          'orderBy': 'fake-order',
          'fromDate': '20220906',
          'toDate': '20221008',
          'sort': 'ASC',
          'orderNumber': 'fake-orderid',
          'poReference': 'fake-poreference',
          'materialSearch': 'fake-material',
          'principalSearch': 'fake-material',
          'companyName': 'fake-companyname',
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
            'query':
                remoteDataSource.orderHistoryQueryMutation.getOrderHistoryRep(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistory(
                companyName: 'fake-companyname',
                fromDate: '20220906',
                materialSearch: 'fake-material',
                offset: 0,
                orderBy: 'fake-order',
                pageSize: 10,
                poNumber: 'fake-poreference',
                principalSearch: 'fake-material',
                shipTo: 'fake-shipto',
                soldTo: 'fake-soldto',
                sort: 'ASC',
                toDate: '20221008',
                loginUserType: 'fake-loginusertype',
                orderId: 'fake-orderid')
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryMock());
        });
      });
    },
  );
}
