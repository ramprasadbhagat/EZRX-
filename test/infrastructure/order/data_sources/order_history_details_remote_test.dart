import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryDetailsMock extends Mock implements OrderHistoryDetails {}

void main() {
  late OrderHistoryDetailsRemoteDataSource remoteDataSource;
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
      remoteDataSource = OrderHistoryDetailsRemoteDataSource(
        httpService: service,
        config: Config(),
        orderHistoryDetailsQueryMutation: OrderHistoryDetailsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Order History Details',
    () {
      test('Get OrderHistory Details', () async {
        final variables = {
          'salesDocument': 'fake-order',
          'companyName': 'fake-companyname',
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
            'query': remoteDataSource.orderHistoryDetailsQueryMutation
                .getOrderHistoryDetails(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetails(
            companyName: 'fake-companyname',
            language: 'fake-language',
            loginUserType: 'fake-loginusertype',
            orderId: 'fake-order');

        expect(
            result,
            OrderHistoryDetailsDto.fromJson(
              res['data']['orderDetails'],
            ).toDomain());
      });

      test('Get OrderHistory Details For SalesRep', () async {
        final variables = {
          'salesDocument': 'fake-order',
          'companyName': 'fake-companyname',
          'language': 'fake-language',
          'userName': 'fake-username',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getorderDetailsForSalesRep.json'),
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
            'query': remoteDataSource.orderHistoryDetailsQueryMutation
                .getOrderHistoryDetailsForSalesRep(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getOrderHistoryDetailsForSalesRep(
          companyName: 'fake-companyname',
          language: 'fake-language',
          loginUserType: 'fake-loginusertype',
          orderId: 'fake-order',
          userName: 'fake-username',
        );

        expect(
            result,
            OrderHistoryDetailsDto.fromJson(
              res['data']['orderDetailsForSalesRep'],
            ).toDomain());
      });

      test('status code not equal to 200', () async {
        final variables = {
          'salesDocument': 'fake-order',
          'companyName': 'fake-companyname',
          'language': 'fake-language',
          'userName': 'fake-username',
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
            'query': remoteDataSource.orderHistoryDetailsQueryMutation
                .getOrderHistoryDetailsForSalesRep(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetailsForSalesRep(
          companyName: 'fake-companyname',
          language: 'fake-language',
          loginUserType: 'fake-loginusertype',
          orderId: 'fake-order',
          userName: 'fake-username',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryDetailsMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'salesDocument': 'fake-order',
          'companyName': 'fake-companyname',
          'language': 'fake-language',
          'userName': 'fake-username',
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
            'query': remoteDataSource.orderHistoryDetailsQueryMutation
                .getOrderHistoryDetailsForSalesRep(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getOrderHistoryDetailsForSalesRep(
          companyName: 'fake-companyname',
          language: 'fake-language',
          loginUserType: 'fake-loginusertype',
          orderId: 'fake-order',
          userName: 'fake-username',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(OrderHistoryDetailsMock());
        });
      });
    },
  );
}
