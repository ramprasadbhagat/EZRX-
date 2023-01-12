import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/policy_configuration_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

class PolicyConfigurationListMock extends Mock
    implements PolicyConfiguration {}

void main() {
  late PolicyConfigurationRemoteDataSource remoteDataSource;
  late String salesOrg;
  late Map<String, Object> getPolicyConfigurationListVariables;
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
      remoteDataSource = PolicyConfigurationRemoteDataSource(
        httpService: service,
        policyConfigurationQueryMutation:
            PolicyConfigurationQueryMutation(),
        dataSourceExceptionHandler: DataSourceExceptionHandler(),
        config: locator.get<Config>(),
      );
      salesOrg = '2601';
      getPolicyConfigurationListVariables = {
        'variables': {
          'request': {
            'salesOrg': salesOrg,
          },
        },
      };
    },
  );

  group(
    'Policy Configuration List Remote SUCCESS',
    () {
      test(
        '=> getPolicyConfigurationList',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getPolicyConfigurationResponse.json'),
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .getPolicyConfiguration(),
              'variables': getPolicyConfigurationListVariables,
            }),
          );

          final result = await remoteDataSource.getPolicyConfiguration(
              salesOrg: salesOrg);

          expect(
            result.length,
            List.from(res['data']['policies'])
                .map((e) => PolicyConfigurationDto.fromJson(e).toDomain())
                .toList()
                .length,
          );
        },
      );
    },
  );
  group(
    'Policy Configuration Remote FAILURE',
    () {
      test(
        '=> getPolicyConfiguration StatusCode is not 200',
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .getPolicyConfiguration(),
              'variables': getPolicyConfigurationListVariables,
            }),
          );

          await remoteDataSource
              .getPolicyConfiguration(salesOrg: salesOrg)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<PolicyConfigurationListMock>[]);
          });
        },
      );

      test(
        '=> getPolicyConfigurationList throws an error',
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .getPolicyConfiguration(),
              'variables': getPolicyConfigurationListVariables,
            }),
          );

          await remoteDataSource
              .getPolicyConfiguration(salesOrg: salesOrg)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<PolicyConfigurationListMock>[]);
          });
        },
      );
    },
  );
}
