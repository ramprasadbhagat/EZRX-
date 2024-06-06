import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_type_code_details_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ReturnRequestTypeCodeDetailsMock extends Mock
    implements ReturnRequestTypeCodeDetails {}

void main() {
  late ReturnRequestTypeCodeRemoteDataSource remoteDataSource;
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
      remoteDataSource = ReturnRequestTypeCodeRemoteDataSource(
        httpService: service,
        config: Config(),
        queryMutation: ReturnRequestTypeCodeQuery(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group(
    'Return Request Type Code',
    () {
      test('Get Return Request Type Code', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getReturnRequestTypeCode.json'),
        );

        final variables = {
          'request': {
            'salesOrg': 'fake-salesorg',
          },
        };

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: jsonEncode({
            'query': remoteDataSource.queryMutation.getReturnRequestTypeCode(),
            'variables': variables,
          }),
        );

        final result = await remoteDataSource.getReturnRequestTypeCodeList(
          salesOrg: 'fake-salesorg',
        );

        expect(
          result,
          List.from(res['data']['typeOfRequest'])
              .map(
                (e) => ReturnRequestTypeCodeDetailsDto.fromJson(e).toDomain(),
              )
              .toList(),
        );
      });

      test(
        '=> ReturnRequestCode Status not 200',
        () async {
          final variables = {
            'request': {
              'salesOrg': 'fake-salesorg',
            },
          };
          dioAdapter.onPost(
            '/api/ereturn',
            (server) => server.reply(
              204,
              {'data': []},
              delay: const Duration(seconds: 1),
            ),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            data: jsonEncode({
              'query':
                  remoteDataSource.queryMutation.getReturnRequestTypeCode(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getReturnRequestTypeCodeList(
            salesOrg: 'fake-salesorg',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<ReturnRequestTypeCodeDetailsMock>[]);
          });
        },
      );

      test(
        'Result with error',
        () async {
          final variables = {
            'request': {
              'salesOrg': 'fake-salesorg',
            },
          };
          dioAdapter.onPost(
            '/api/ereturn',
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
              'query':
                  remoteDataSource.queryMutation.getReturnRequestTypeCode(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getReturnRequestTypeCodeList(
            salesOrg: 'fake-salesorg',
          )
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<ReturnRequestTypeCodeDetailsMock>[]);
          });
        },
      );
    },
  );
}
