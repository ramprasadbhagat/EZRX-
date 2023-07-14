import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ReturnSummaryDetailsRequestInformationRemote remoteDataSource;

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
      remoteDataSource = ReturnSummaryDetailsRequestInformationRemote(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        requestInformationQuery: RequestInformationQuery(),
      );
    },
  );

  group(
    'Return Summary Details Remote Data Test',
    () {
      test('=> getRequestInformation with status code 200', () async {
        final res = json.decode(
          await rootBundle.loadString(
              'assets/json/returnRequestInformationV2Response.json'),
        );

        final data = jsonEncode({
          'query': remoteDataSource.requestInformationQuery
              .getReturnInformationQuery(),
          'variables': {
            'request': {
              'invoiceID': 'mock_id',
              'requestID': 'mock_id',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            res,
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        final result = await remoteDataSource.getRequestInformation(
          returnRequestId: 'mock_id',
          invoiceId: 'mock_id',
        );

        expect(
          result,
          RequestInformationDto.fromJson(res['data']['requestInformationV2'])
              .toDomain(),
        );
      });

      test('=> getRequestInformation with status code not 200', () async {
        final data = jsonEncode({
          'query': remoteDataSource.requestInformationQuery
              .getReturnInformationQuery(),
          'variables': {
            'request': {
              'invoiceID': 'mock_id',
              'requestID': 'mock_id',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            204,
            {'data': []},
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await remoteDataSource
            .getRequestInformation(
          returnRequestId: 'mock_id',
          invoiceId: 'mock_id',
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(RequestInformation.empty());
        });
      });

      test('=> getRequestInformation with error', () async {
        final data = jsonEncode({
          'query': remoteDataSource.requestInformationQuery
              .getReturnInformationQuery(),
          'variables': {
            'request': {
              'invoiceID': 'mock_id',
              'requestID': 'mock_id',
            },
          },
        });

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
          data: data,
        );

        await remoteDataSource
            .getRequestInformation(
          returnRequestId: 'mock_id',
          invoiceId: 'mock_id',
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(RequestInformation.empty());
        });
      });

      test('=> getRequestInformation with data equal to null', () async {
        final data = jsonEncode({
          'query': remoteDataSource.requestInformationQuery
              .getReturnInformationQuery(),
          'variables': {
            'request': {
              'invoiceID': 'mock_id',
              'requestID': 'mock_id',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            {
              'data': null,
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await remoteDataSource
            .getRequestInformation(
          returnRequestId: 'mock_id',
          invoiceId: 'mock_id',
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(RequestInformation.empty());
        });
      });

      test(
          '=> getRequestInformation with data requestInformationV2 equal to null',
          () async {
        final data = jsonEncode({
          'query': remoteDataSource.requestInformationQuery
              .getReturnInformationQuery(),
          'variables': {
            'request': {
              'invoiceID': 'mock_id',
              'requestID': 'mock_id',
            },
          },
        });

        dioAdapter.onPost(
          '/api/ereturn',
          (server) => server.reply(
            200,
            {
              'data': {'requestInformationV2': null},
            },
            delay: const Duration(seconds: 1),
          ),
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          data: data,
        );

        await remoteDataSource
            .getRequestInformation(
          returnRequestId: 'mock_id',
          invoiceId: 'mock_id',
        )
            .onError((error, stackTrace) async {
          expect(error, isA<ServerException>());
          return Future.value(RequestInformation.empty());
        });
      });
    },
  );
}
