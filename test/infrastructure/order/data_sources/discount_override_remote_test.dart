import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class PriceMock extends Mock implements Price {}

void main() {
  late DiscountOverrideRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = DiscountOverrideRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: MaterialPriceQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Discount Override',
    () {
      test(
        'Get Material Override Price List',
        () async {
          final variables = {
            'salesOrganisation': '',
            'customer': '',
            'request': [{}],
            'shipToCode': '',
          };
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getMaterialPriceResponse.json'),
          );

          final finalData = res['data']['price'];

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
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
          );

          expect(
            result,
            List.from(makeResponseCamelCase(jsonEncode(finalData)))
                .map((e) => PriceDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );

      test(
        'Status not 200',
        () async {
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
              'variables': {
                'salesOrganisation': '',
                'customer': '',
                'request': [{}],
                'shipToCode': '',
              },
            }),
          );

          await remoteDataSource
              .getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<PriceMock>[]);
          });
        },
      );

      test(
        'response with error',
        () async {
          dioAdapter.onPost(
            '/api/pricing',
            (server) => server.reply(
              200,
              {
                'data': null,
                'errors': [
                  {'message': 'fake-error'},
                ],
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getMaterialPrice(),
              'variables': {
                'salesOrganisation': '',
                'customer': '',
                'request': [{}],
                'shipToCode': '',
              },
            }),
          );

          await remoteDataSource
              .getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<PriceMock>[]);
          });
        },
      );

      test(
        'List Empty',
        () async {
          dioAdapter.onPost(
            '/api/pricing',
            (server) => server.reply(
              200,
              {
                'data': {'price': []},
              },
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getMaterialPrice(),
              'variables': {
                'salesOrganisation': '',
                'customer': '',
                'request': [{}],
                'shipToCode': '',
              },
            }),
          );

          await remoteDataSource
              .getMaterialOverridePriceList(
            customerCode: '',
            materialQuery: {},
            salesOrgCode: '',
            shipToCode: '',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<PriceMock>[]);
          });
        },
      );
    },
  );
}
