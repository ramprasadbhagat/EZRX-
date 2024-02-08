import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ViewByOrderRemoteDataSource remoteDataSource;
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
      remoteDataSource = ViewByOrderRemoteDataSource(
        httpService: service,
        config: Config(),
        viewByOrderQuery: ViewByOrderDetailsQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'View By Order',
    () {
      test('Get View By Order Items', () async {
        final variables = {
          'soldTo': 'fake-soldTo',
          'first': 24,
          'after': 0,
          'language': 'fake-language',
          'orderBy': 'datetime',
          'sort': 'desc',
          'salesOrg': ['fake-salesOrg'],
          'shipTo': ['fake-shipTo'],
          'searchKey': 'fake-searchKey',
          'isDetailsPage': false,
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getOrderHistoryV3Response.json'),
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
            'query': remoteDataSource.viewByOrderQuery.getOrderHistoryDetails(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getViewByOrders(
          salesOrg: 'fake-salesOrg',
          searchKey: 'fake-searchKey',
          soldTo: 'fake-soldTo',
          shipTo: 'fake-shipTo',
          language: 'fake-language',
          filterQuery: {},
          offset: 0,
          pageSize: 24,
          orderBy: 'datetime',
          sort: 'desc',
          isDetailsPage: false,
        );

        expect(
          result,
          ViewByOrderDto.fromJson(
            res['data']['orderHistoryV3'],
          ).toDomain(),
        );
      });
    },
  );
}
