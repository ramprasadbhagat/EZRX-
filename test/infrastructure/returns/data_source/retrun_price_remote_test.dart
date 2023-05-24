import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_price.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_price_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ReturnPriceMock extends Mock implements ReturnPrice {}

void main() {
  late ReturnPriceRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  final variables = {
    'invoiceDetails': {
      'invoiceNumber': 'invoiceNumber',
      'salesOrg': 'salesOrg',
      'materials': {},
    },
  };

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ReturnPriceRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        queryMutation: ReturnPriceQuery(),
      );
    },
  );

  group(
    'Return Price Remote DataSource',
    () {
      test('get return price Success', () async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/getReturnPrice.json'),
        );

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getReturnPrice(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getReturnPrice(
            invoiceNumber: 'invoiceNumber',
            materials: {},
            salesOrg: 'salesOrg');

        expect(
            result,
            ReturnPriceDto.fromJson(res['data']['getReturnPrice'][0])
                .toDomain());
      });

      test(
        '=> get return price Status not 200',
        () async {
          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query': remoteDataSource.queryMutation.getReturnPrice(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getReturnPrice(
                  invoiceNumber: 'invoiceNumber',
                  materials: {},
                  salesOrg: 'salesOrg')
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ReturnPriceMock());
          });
        },
      );

      test(
        '=> get return price with error',
        () async {
          dioAdapter.onPost(
            '/api/ereturn',
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
              'query': remoteDataSource.queryMutation.getReturnPrice(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getReturnPrice(
                  invoiceNumber: 'invoiceNumber',
                  materials: {},
                  salesOrg: 'salesOrg')
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ReturnPriceMock());
          });
        },
      );
    },
  );
}
