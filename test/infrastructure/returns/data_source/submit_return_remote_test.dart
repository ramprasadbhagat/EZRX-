import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/submit_return_response_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class SubmitReturnMock extends Mock implements SubmitReturnResponse {}

void main() {
  late SubmitReturnRequestRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  final variables = {
    'returnInput': {},
  };

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = SubmitReturnRequestRemoteDataSource(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        returnRequestMutation: SubmitReturnRequestMutation(),
      );
    },
  );

  group(
    'Submit Return Remote DataSource',
    () {
      test('submit return Success', () async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/getSubmitReturnRequestResponse.json'),
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
            'query': remoteDataSource.returnRequestMutation
                .getReturnRequestMutation(),
            'variables': variables,
          }),
        );

        final result =
            await remoteDataSource.submitReturnRequest(returnInput: {});

        expect(
            result,
            SubmitReturnResponseDto.fromJson(
              res['data']['addRequestV2'],
            ).toDomain());
      });

      test(
        '=> submit return Status not 200',
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
              'query': remoteDataSource.returnRequestMutation
                  .getReturnRequestMutation(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .submitReturnRequest(returnInput: {}).onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(SubmitReturnMock());
          });
        },
      );

      test(
        '=> submit error error',
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
              'query': remoteDataSource.returnRequestMutation
                  .getReturnRequestMutation(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .submitReturnRequest(returnInput: {}).onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(SubmitReturnMock());
          });
        },
      );
    },
  );
}
