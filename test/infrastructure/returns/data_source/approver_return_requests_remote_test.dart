import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_requests_id_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ApproverReturnRequestsRemote remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://uat.ezrx.com',
    ),
  );
  final dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  final service = HttpService.mockDio(dio);

  final variables = {
    'request': {
      'username': 'username',
      'first': 11,
      'after': 0,
    },
  };

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ApproverReturnRequestsRemote(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        approverReturnRequestQuery: ApproverReturnRequestQuery(),
      );
    },
  );

  group(
    'Return Approver Remote Datasource',
    () {
      test(
        'getReturns Success',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
                'assets/json/returnRequestsForApproverV2Response.json'),
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
              'query': remoteDataSource.approverReturnRequestQuery
                  .getReturnRequestQuery(),
              'variables': variables,
            }),
          );

          final result = await remoteDataSource.getReturns(
            username: '',
            offset: 0,
            pageSize: 11,
            filterQuery: {},
          );

          expect(
              result,
              List.from(res['data']['requestsForApproverV2']['requestID'])
                  .map(
                    (e) => ReturnRequestsIdDto.fromJson({'requestId': e})
                        .toDomain(),
                  )
                  .toList()
                ..retainWhere((element) => element.isValidRequestId));
        },
      );

      test(
        'getReturns status is not 200',
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
              'query': remoteDataSource.approverReturnRequestQuery
                  .getReturnRequestQuery(),
              'variables': variables,
            }),
          );

          await remoteDataSource.getReturns(
            username: '',
            offset: 0,
            pageSize: 11,
            filterQuery: {},
          ).onError((error, _) {
            expect(error, isA<ServerException>());
            return [];
          });
        },
      );

      test(
        'getReturns throws an error',
        () async {
          dioAdapter.onPost(
            '/api/ereturn',
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
              'query': remoteDataSource.approverReturnRequestQuery
                  .getReturnRequestQuery(),
              'variables': variables,
            }),
          );

          await remoteDataSource.getReturns(
            username: '',
            offset: 0,
            pageSize: 11,
            filterQuery: {},
          ).onError((error, _) {
            expect(error, isA<ServerException>());
            return [];
          });
        },
      );
    },
  );
}
