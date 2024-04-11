import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';

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
  final remoteConfigService = RemoteConfigServiceMock();
  const fakeMarket = 'fake-market';
  final fakeEnableMarketPlaceMarkets = [fakeMarket];
  final fakeConfigValue = fakeEnableMarketPlaceMarkets.contains(fakeMarket);

  final variables = {
    'request': {
      'requestID': 'fake-requestId',
    },
  };

  setUpAll(
    () {
            WidgetsFlutterBinding.ensureInitialized();
      when(() => remoteConfigService.enableMarketPlaceMarkets)
          .thenReturn(fakeEnableMarketPlaceMarkets);
      remoteDataSource = ApproverReturnRequestInformationRemote(
        httpService: service,
        config: Config(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        approverReturnRequestInformationQuery: RequestInformationQuery(),
        remoteConfigService: remoteConfigService,
      );
    },
  );

  group(
    'Return Approver information Remote Datasource',
    () {
      test(
        'getApproverReturnRequestInformation Success',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/returnRequestInformationV2Response.json',
            ),
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
                  .getReturnInformationQuery(fakeConfigValue),
              'variables': variables,
            }),
          );

          final result =
              await remoteDataSource.getApproverReturnRequestInformation(
            returnRequestId: 'fake-requestId',
            market: fakeMarket,
          );

          expect(
            result,
            RequestInformationDto.fromJson(res['data']['requestInformationV2'])
                .toDomain(),
          );
        },
      );

      test(
        'getApproverReturnRequestInformation status is not 200',
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
                  .getReturnInformationQuery(fakeConfigValue),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getApproverReturnRequestInformation(
            returnRequestId: 'fake-requestId',
            market: fakeMarket,
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return RequestInformation.empty();
          });
        },
      );

      test(
        'getApproverReturnRequestInformation throws an error',
        () async {
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
              'query': remoteDataSource.approverReturnRequestInformationQuery
                  .getReturnInformationQuery(fakeConfigValue),
              'variables': variables,
            }),
          );

          await remoteDataSource
              .getApproverReturnRequestInformation(
            returnRequestId: 'fake-requestId',
            market: fakeMarket,
          )
              .onError((error, _) {
            expect(error, isA<ServerException>());
            return RequestInformation.empty();
          });
        },
      );
    },
  );
}
