import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class SavedOrderMock extends Mock implements SavedOrder {}

void main() {
  late OrderRemoteDataSource remoteDataSource;
  late String userId;
  late String saleOrgName;
  late String shipToCode;
  late String customerCode;
  late int pageSize;
  late int offset;

  late Map<String, Object> variables;
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
      remoteDataSource = OrderRemoteDataSource(
        httpService: service,
        queryMutation: OrderQueryMutation(),
        exceptionHandler: DataSourceExceptionHandler(),
      );
      userId = '11461';
      saleOrgName = '2601';
      shipToCode = '0000002610';
      customerCode = '0000002610';
      pageSize = 10;
      offset = 0;

      variables = {
        'whereQuery': {
          'draftorder': true,
          'processingStatusIn': ['Draft', 'Failed'],
          'user': userId,
          'SalesOrganization': saleOrgName,
          'ShipToParty': shipToCode,
          'SoldToParty': customerCode,
        },
        'first': pageSize,
        'after': offset,
      };
    },
  );

  group(
    'Order Remote',
    () {
      test(
        'Get Saved order with invalid itemlist json',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getSavedOrdersResponse.json'),
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
              'query': remoteDataSource.queryMutation.getSaveOrderHistory(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getSavedOrder(
            userId: userId,
            saleOrgName: saleOrgName,
            shipToCode: shipToCode,
            customerCode: customerCode,
            pageSize: pageSize,
            offset: offset,
          );

          expect(
            result.length,
            List.from(res['data']['draftOrders'])
                .where((e) => json.decode(e['itemlist']) != null)
                .map((e) => SavedOrderDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );
    },
  );
}
