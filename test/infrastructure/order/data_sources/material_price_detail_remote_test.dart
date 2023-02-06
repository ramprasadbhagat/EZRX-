import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_price_detail_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class MaterialPriceDetailMock extends Mock implements MaterialPriceDetail {}

void main() {
  late MaterialPriceDetailRemoteDataSource remoteDataSource;
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
      remoteDataSource = MaterialPriceDetailRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: MaterialPriceDetailQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Material Price Detail',
    () {
      test('Get Material Detail', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customerCode': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'request': [],
          'language': 'fake-language'
        };
        final res = json.decode(
          await rootBundle.loadString(
              'assets/json/getCustomerMaterialPriceDetailResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialDetail(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getMaterialDetail(
          customerCode: 'fake-customer-code',
          language: 'fake-language',
          queryString: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
        );
        final materialDetailData = res['data']['customerMaterialPriceDetails'];

        expect(
            result,
            List.from(materialDetailData)
                .map((e) => MaterialDetailDto.fromJson(e).toDomain())
                .toList());
      });

      test('Get Material Detail ZDP5 Enabled', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customerCode': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'request': [],
          'language': 'fake-language',
        };
        final res = json.decode(
          await rootBundle.loadString(
              'assets/json/getCustomerMaterialPriceDetailResponse.json'),
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
            'query': remoteDataSource.queryMutation.getMaterialDetail(),
            'variables': variables
          }),
        );

        final result = await remoteDataSource.getMaterialDetailZDP5Enabled(
          language: 'fake-language',
          customerCode: 'fake-customer-code',
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
          materialNumbers: {},
        );
        final materialDetailData = res['data']['customerMaterialPriceDetails'];

        expect(
            result,
            List.from(materialDetailData)
                .map((e) => MaterialDetailDto.fromJson(e).toDomain())
                .toList());
      });

      test('status code not equal to 200', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customerCode': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'request': [],
          'language': 'fake-language'
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
            'query': remoteDataSource.queryMutation.getMaterialDetail(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getMaterialDetail(
          customerCode: 'fake-customer-code',
          language: 'fake-language',
          queryString: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MaterialPriceDetailMock>[]);
        });
      });

      test('response with error', () async {
        final variables = {
          'salesOrganisation': 'fake-sales-org',
          'customerCode': 'fake-customer-code',
          'shipToCode': 'fake-shipto-code',
          'request': [],
          'language': 'fake-language'
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
            'query': remoteDataSource.queryMutation.getMaterialDetail(),
            'variables': variables
          }),
        );

        await remoteDataSource
            .getMaterialDetail(
          customerCode: 'fake-customer-code',
          language: 'fake-language',
          queryString: [],
          salesOrgCode: 'fake-sales-org',
          shipToCode: 'fake-shipto-code',
        )
            .onError((error, _) async {
          expect(error, isA<ServerException>());
          return Future.value(<MaterialPriceDetailMock>[]);
        });
      });
    },
  );
}
