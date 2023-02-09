import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_list_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ReturnRequestMock extends Mock implements ReturnRequest {}

void main() {
  late RequestReturnRemoteDatasource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  final variables = {
    'searchReturnMaterialsRequest': {
      'batch': '',
      'dateFrom': '',
      'dateTo': '',
      'invoiceNo': '',
      'materialDescription': '',
      'materialNumber': '',
      'principalSearch': '',
      'salesOrg': 'salesOrg',
      'soldTo': 'soldTo',
      'shipTo': 'shipTo',
      'first': 10,
      'after': 0,
    },
  };

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = RequestReturnRemoteDatasource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        query: ReturnRequestListQuery(),
      );
    },
  );

  group(
    'Request Return Remote Datasource => ',
    () {
      test(
        'searchReturnMaterials Success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getRequestReturnMaterials.json'),
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
              'query': remoteDataSource.query.getReturnRequestList(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.searchReturnMaterials(
            batch: '',
            dateFrom: '',
            dateTo: '',
            invoiceNo: '',
            materialDescription: '',
            materialNumber: '',
            offSet: 0,
            pageSize: 10,
            principalSearch: '',
            salesOrg: 'salesOrg',
            shipTo: 'shipTo',
            soldTo: 'soldTo',
          );

          expect(
              result.items.length,
              ReturnRequestDto.fromJson(res['data']['searchReturnMaterials'])
                  .toDomain()
                  .items
                  .length);
        },
      );

      test(
        '=> searchReturnMaterials Status not 200',
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
              'query': remoteDataSource.query.getReturnRequestList(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .searchReturnMaterials(
            batch: '',
            dateFrom: '',
            dateTo: '',
            invoiceNo: '',
            materialDescription: '',
            materialNumber: '',
            principalSearch: '',
            salesOrg: 'salesOrg',
            shipTo: 'shipTo',
            soldTo: 'soldTo',
            pageSize: 10,
            offSet: 0,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ReturnRequestMock());
          });
        },
      );

      test(
        '=> searchReturnMaterials with error',
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
              'query': remoteDataSource.query.getReturnRequestList(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .searchReturnMaterials(
            batch: '',
            dateFrom: '',
            dateTo: '',
            invoiceNo: '',
            materialDescription: '',
            materialNumber: '',
            principalSearch: '',
            salesOrg: 'salesOrg',
            shipTo: 'shipTo',
            soldTo: 'soldTo',
            pageSize: 10,
            offSet: 0,
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(ReturnRequestMock());
          });
        },
      );
    },
  );
}
