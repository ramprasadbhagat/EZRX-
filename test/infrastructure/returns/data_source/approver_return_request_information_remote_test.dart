import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_request_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late ApproverReturnRequestInformationRemote remoteDataSource;
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
      'requestID': 'fake-requestId',
    },
  };

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      remoteDataSource = ApproverReturnRequestInformationRemote(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        approverReturnRequestInformationQuery:
            ApproverReturnRequestInformationQuery(),
      );
    },
  );

  group(
    'Return Approver information Remote Datasource',
    () {
      test(
        'getApproverReturnRequestInfomration Success',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
                'assets/json/returnRequestInformationV2Response.json'),
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
              'query': remoteDataSource.approverReturnRequestInformationQuery
                  .getReturnInformationQuery(),
              'variables': variables,
            }),
          );

          final result =
              await remoteDataSource.getApproverReturnRequestInfomration(
            returnRequestId: 'fake-requestId',
          );

          expect(
            result,
            ApproverReturnRequestDto.fromJson(
                    res['data']['requestInformationV2'])
                .toDomain(),
          );
        },
      );

      test(
        'getApproverReturnRequestInfomration status is not 200',
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
              'query': remoteDataSource.approverReturnRequestInformationQuery
                  .getReturnInformationQuery(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getApproverReturnRequestInfomration(
            returnRequestId: 'fake-requestId',
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return ApproverReturnRequest.empty();
          });
        },
      );

      test(
        'getApproverReturnRequestInfomration throws an error',
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
              'query': remoteDataSource.approverReturnRequestInformationQuery
                  .getReturnInformationQuery(),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getApproverReturnRequestInfomration(
            returnRequestId: 'fake-requestId',
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return ApproverReturnRequest.empty();
          });
        },
      );
    },
  );
}
