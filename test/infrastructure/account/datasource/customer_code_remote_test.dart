import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class SavedOrderMock extends Mock implements SavedOrder {}

void main() {
  late CustomerCodeRemoteDataSource remoteDataSource;
  late String saleOrgName;
  late int pageSize;
  late bool hideCustomer;
  late String mockCustomerCode;

  late Map<String, Object> variables;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = CustomerCodeRemoteDataSource(
        httpService: service,
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: Config(),
        customerCodeQueryMutation: CustomerCodeQueryMutation(),
      );
      saleOrgName = '2601';
      pageSize = 10;

      hideCustomer = true;
      mockCustomerCode = '0000002610';

      variables = {
        'searchKey': mockCustomerCode,
        'salesOrganisation': '2203',
        'first': 10,
        'after': 0,
        'filterBlockCustomer': true,
      };
    },
  );

  group(
    'Customer Code',
    () {
      test(
        'get code',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/getCustomerInformationResponse.json',
            ),
          );

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerInfoBySearch(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getCustomerCodeList(
            customerCode: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hidecustomer: hideCustomer,
            offset: 0,
          );
          expect(
              result.length,
              res['data']['customerInformationSearch']['SoldToInformation']
                  .length);
        },
      );

      test(
        'Get the server exception',
        () async {
          final data = {'userName': saleOrgName};

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              {
                'data': data,
                'errors': [
                  {'message': 'fake-error'}
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerInfoBySearch(),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .getCustomerCodeList(
            customerCode: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hidecustomer: hideCustomer,
            offset: 0,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value([CustomerCodeInfo.empty()]);
          });
        },
      );
      test(
        'Status code != 200',
        () async {
          final data = {'userName': saleOrgName};

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              201,
              {
                'data': data,
                'errors': null,
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerInfoBySearch(),
              'variables': variables,
            }),
          );
          await remoteDataSource
              .getCustomerCodeList(
            customerCode: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hidecustomer: hideCustomer,
            offset: 0,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value([CustomerCodeInfo.empty()]);
          });
        },
      );

      test(
        'Get Saved order with invalid itemlist json',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/getCustomerInformationResponseForSalesRep.json',
            ),
          );

          final data = {
            'salesOrganisation': '2203',
            'first': 10,
            'after': 0,
            'username': mockCustomerCode,
            'searchKey': mockCustomerCode,
          };

          dioAdapter.onPost(
            '/api/license',
            (server) => server.reply(
              200,
              res,
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.customerCodeQueryMutation
                  .getCustomerListForSalesRep(),
              'variables': data,
            }),
          );

          final result = await remoteDataSource.getSalesRepCustomerCodeList(
            customerCode: mockCustomerCode,
            salesOrg: '2203',
            pageSize: pageSize,
            hidecustomer: hideCustomer,
            userName: mockCustomerCode,
            offset: 0,
          );
          expect(
            result.length,
            res['data']['customerListForSalesRep'].length,
          );
        },
      );
    },
  );
}
