import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_request_by_user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/requests_by_user_return_summary_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class ReturnSummaryRequestByUserMock extends Mock implements ReturnSummaryRequestByUser{}

void main() {
  late ReturnSummaryRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio);
  final service = HttpService.mockDio(dio);

  setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ReturnSummaryRemoteDataSource(
        httpService: service,
        config: Config(),
        returnSummaryQueryMutation: ReturnSummaryQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
      );
    },
  );

  group('Return Summary Remote Data Test', () {

    test('=> getReturnSummaryRequestByUser with status code 200', () async {
      final res = json.decode(
        await rootBundle.loadString('assets/json/requestsByUserV2Response.json'),
      );

      final data = jsonEncode({
        'query': remoteDataSource.returnSummaryQueryMutation.getrequestsByUserV2Query(),
        'variables': {
          'request': {
            'soldTo': 'mock_soldTo',
            'shipTo': 'mock_shipTo',
            'username': 'mock_username',
            'first': 1,
            'after': 0,
            ...{},
          },
        },
      });

      dioAdapter.onPost('/api/ereturn', (server) => server.reply(
          200,
          res,
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: data,
      );

      final result = await remoteDataSource.getReturnSummaryRequestByUser(
        soldTo: 'mock_soldTo',
        shipTo: 'mock_shipTo',
        username: 'mock_username',
        pageSize: 1,
        offSet: 0,
        filterQuery: {},
      );

      expect(
        result,
        ReturnSummaryRequestByUserDto.fromJson(res['data']['requestsByUserV2'],).toDomain(),
      );
    });

    test('=> getReturnSummaryRequestByUser status code not 200', () async {
      final data = jsonEncode({
        'query': remoteDataSource.returnSummaryQueryMutation.getrequestsByUserV2Query(),
        'variables': {
          'request': {
            'soldTo': 'mock_soldTo',
            'shipTo': 'mock_shipTo',
            'username': 'mock_username',
            'first': 1,
            'after': 0,
            ...{},
          },
        },
      });

      dioAdapter.onPost('/api/ereturn', (server) => server.reply(
          204,
          {'data':[]},
          delay: const Duration(seconds: 1),
        ),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        data: data,
      );

      await remoteDataSource.getReturnSummaryRequestByUser(
        soldTo: 'mock_soldTo',
        shipTo: 'mock_shipTo',
        username: 'mock_username',
        pageSize: 1,
        offSet: 0,
        filterQuery: {},
      ).onError((error, stackTrace)async{
        expect(error, isA<ServerException>());
        return Future.value(ReturnSummaryRequestByUser.empty());
      });
    });

    test('=> getReturnSummaryRequestByUser with error', () async {
      final data = jsonEncode({
        'query': remoteDataSource.returnSummaryQueryMutation.getrequestsByUserV2Query(),
        'variables': {
          'request': {
            'soldTo': 'mock_soldTo',
            'shipTo': 'mock_shipTo',
            'username': 'mock_username',
            'first': 1,
            'after': 0,
            ...{},
          },
        },
      });

      dioAdapter.onPost('/api/ereturn', (server) => server.reply(
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

      await remoteDataSource.getReturnSummaryRequestByUser(
        soldTo: 'mock_soldTo',
        shipTo: 'mock_shipTo',
        username: 'mock_username',
        pageSize: 1,
        offSet: 0,
        filterQuery: {}
      ).onError((error, stackTrace)async{
        expect(error, isA<ServerException>());
        return Future.value(ReturnSummaryRequestByUser.empty());
      });
    });

    },
  );
}
