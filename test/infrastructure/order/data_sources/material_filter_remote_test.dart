import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_filter_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialFilterMock extends Mock implements MaterialFilter {}

void main() {
  late MaterialFilterRemoteDataSource remoteDataSource;
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
      remoteDataSource = MaterialFilterRemoteDataSource(
        httpService: service,
        config: Config(),
        materialFilterQueryMutation: MaterialFilterQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Material Filter',
    () {
      test('Get Material Filter List', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-sales-org',
          'shipToCustomer': 'fake-shiptocode',
          'language': 'fake-language',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getMaterialFilterResponse.json'),
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
            'query': remoteDataSource.materialFilterQueryMutation
                .getMaterialFilterCategoryList(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getFilters(
          language: 'fake-language',
          salesOrganisation: 'fake-sales-org',
          shipToCustomerCode: 'fake-shiptocode',
          soldToCustomerCode: 'fake-customer-code',
        );
        final finalData = res['data']['materialsWithMeta']['rawMetaData'];

        expect(result, MaterialFilterDto.fromJson(finalData).toDomain());
      });

      test('Get Material Filter List For Sales Rep', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-sales-org',
          'customerShipToCode': 'fake-shiptocode',
          'username': 'fake-username',
          'gimmickMaterial': false,
          'language': 'fake-language',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getMaterialFilterResponseSalesRep.json'),
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
            'query': remoteDataSource.materialFilterQueryMutation
                .getMaterialFilterCategoryListSalesRep(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getFiltersSalesRep(
          language: 'fake-language',
          salesOrganisation: 'fake-sales-org',
          shipToCustomerCode: 'fake-shiptocode',
          soldToCustomerCode: 'fake-customer-code',
          gimmickMaterial: false,
          pickAndPack: '',
          userName: 'fake-username',
        );
        final finalData =
            res['data']['customerMaterialsForSalesRep']['rawMetaData'];

        expect(result, MaterialFilterDto.fromJson(finalData).toDomain());
      });

      test('status not equal to 200', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-sales-org',
          'customerShipToCode': 'fake-shiptocode',
          'username': 'fake-username',
          'gimmickMaterial': false,
          'language': 'fake-language',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getMaterialFilterResponseSalesRep.json'),
        );

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.materialFilterQueryMutation
                .getMaterialFilterCategoryListSalesRep(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getFiltersSalesRep(
          language: 'fake-language',
          salesOrganisation: 'fake-sales-org',
          shipToCustomerCode: 'fake-shiptocode',
          soldToCustomerCode: 'fake-customer-code',
          gimmickMaterial: false,
          pickAndPack: '',
          userName: 'fake-username',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(MaterialFilterMock());
        });
      });

      test('response with error', () async {
        final variables = {
          'customer': 'fake-customer-code',
          'salesOrganisation': 'fake-sales-org',
          'customerShipToCode': 'fake-shiptocode',
          'username': 'fake-username',
          'gimmickMaterial': false,
          'language': 'fake-language',
        };
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getMaterialFilterResponseSalesRep.json'),
        );

        dioAdapter.onPost(
          '/api/license',
          (server) => server.reply(
            204,
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
            'query': remoteDataSource.materialFilterQueryMutation
                .getMaterialFilterCategoryListSalesRep(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getFiltersSalesRep(
          language: 'fake-language',
          salesOrganisation: 'fake-sales-org',
          shipToCustomerCode: 'fake-shiptocode',
          soldToCustomerCode: 'fake-customer-code',
          gimmickMaterial: false,
          pickAndPack: '',
          userName: 'fake-username',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(MaterialFilterMock());
        });
      });
    },
  );
}
