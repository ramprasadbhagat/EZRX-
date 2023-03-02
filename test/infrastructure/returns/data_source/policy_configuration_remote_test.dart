import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
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

class PolicyConfigurationListMock extends Mock implements PolicyConfiguration {}

void main() {
  late PolicyConfigurationRemoteDataSource remoteDataSource;
  late String salesOrg;
  late String uuid;
  late PolicyConfiguration policyConfiguration;
  late Map<String, Object> getPolicyConfigurationListVariables;
  late Map<String, Object> getPolicyConfigurationDeleteVariables;
  late Map<String, Object> getPolicyConfigurationAddVariables;
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
        policyConfigurationQueryMutation: PolicyConfigurationQueryMutation(),
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
      uuid = 'cfe3d45d-9812-49d7-8b83-ad028b9ae383';
      policyConfiguration = PolicyConfiguration(
          salesOrg: SalesOrg('2601'),
          principalCode: PrincipalCode('2601'),
          monthsBeforeExpiry: MonthsBeforeExpiry.change('0'),
          monthsAfterExpiry: MonthsAfterExpiry.change('0'),
          uuid: 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
          returnsAllowed: ReturnsAllowed(true),
          principalName: PrincipalName(''),
          status: '');
      getPolicyConfigurationDeleteVariables = {
        'variables': {
          'input': {'uuid': uuid},
        },
      };
      getPolicyConfigurationAddVariables = {
        'variables': {
          'input': {
            'salesOrg': policyConfiguration.salesOrg.getOrCrash(),
            'principalCode':
                policyConfiguration.principalCode.getOrDefaultValue(''),
            'returnsAllowed':
                policyConfiguration.returnsAllowed.getOrDefaultValue(false),
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

          final result =
              await remoteDataSource.getPolicyConfiguration(salesOrg: salesOrg,
              offSet: 0,
              pageSize: 10,
              searchKey: '',);

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
              .getPolicyConfiguration(salesOrg: salesOrg,
              offSet: 0,
              pageSize: 10,
              searchKey: '',)
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
              .getPolicyConfiguration(salesOrg: salesOrg,
              offSet: 0,
              pageSize: 10,
              searchKey: '',)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(<PolicyConfigurationListMock>[]);
          });
        },
      );
    },
  );

  group(
    'Policy Configuration delete Remote SUCCESS',
    () {
      test(
        '=> getDeletePolicyConfiguration',
        () async {
          final res = {
            'data': {
              'deletePolicy': {
                'salesOrg': '2601',
                'principalCode': '2001',
                'monthsBeforeExpiry': '0',
                'monthsAfterExpiry': '0',
                'uuid': 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
                'returnsAllowed': true,
                'principalName': '',
                'status': 'data deleted successfully'
              },
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .deletePolicyConfiguration(),
              'variables': getPolicyConfigurationDeleteVariables,
            }),
          );

          final result = await remoteDataSource.getDeletePolicyConfiguration(
            policyConfiguration: policyConfiguration,
          );

          expect(
            result.uuid,
            policyConfiguration.uuid,
          );
        },
      );
    },
  );

  group(
    'Policy Configuration delete Remote FAILED',
    () {
      test(
        '=> getDeletePolicyConfiguration when status is null',
        () async {
          final res = {
            'data': {
              'deletePolicy': {
                'salesOrg': '2601',
                'principalCode': '2001',
                'monthsBeforeExpiry': '0',
                'monthsAfterExpiry': '0',
                'uuid': 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
                'returnsAllowed': true,
                'principalName': '',
                'status': null
              },
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .deletePolicyConfiguration(),
              'variables': getPolicyConfigurationDeleteVariables,
            }),
          );

          await remoteDataSource
              .getDeletePolicyConfiguration(
                  policyConfiguration: policyConfiguration)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(policyConfiguration);
          });
        },
      );
      test(
        '=> getDeletePolicyConfiguration when status not equal to data deleted successfully',
        () async {
          final res = {
            'data': {
              'deletePolicy': {
                'salesOrg': '2601',
                'principalCode': '2001',
                'monthsBeforeExpiry': '0',
                'monthsAfterExpiry': '0',
                'uuid': 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
                'returnsAllowed': true,
                'principalName': '',
                'status': 'fake-status'
              },
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .deletePolicyConfiguration(),
              'variables': getPolicyConfigurationDeleteVariables,
            }),
          );

          await remoteDataSource
              .getDeletePolicyConfiguration(
                  policyConfiguration: policyConfiguration)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(policyConfiguration);
          });
        },
      );
    },
  );

  group(
    'Policy Configuration add Remote SUCCESS',
    () {
      test(
        '=> geAddPolicyConfiguration',
        () async {
          final res = {
            'data': {
              'addPolicy': {
                'salesOrg': '2601',
                'principalCode': '2001',
                'monthsBeforeExpiry': '0',
                'monthsAfterExpiry': '0',
                'uuid': 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
                'returnsAllowed': true,
                'principalName': '',
                'status': 'Successfully added the Policy Configuration'
              },
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .addPolicyConfiguration(),
              'variables': getPolicyConfigurationAddVariables,
            }),
          );

          final result = await remoteDataSource.geAddPolicyConfiguration(
            policyConfiguration: policyConfiguration,
          );

          expect(
            result.uuid,
            policyConfiguration.uuid,
          );
        },
      );
    },
  );

  group(
    'Policy Configuration add Remote FAILED',
    () {
      test(
        '=> geAddPolicyConfiguration when status is null',
        () async {
          final res = {
            'data': {
              'addPolicy': {
                'salesOrg': '2601',
                'principalCode': '2001',
                'monthsBeforeExpiry': '0',
                'monthsAfterExpiry': '0',
                'uuid': 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
                'returnsAllowed': true,
                'principalName': '',
                'status': null
              },
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .addPolicyConfiguration(),
              'variables': getPolicyConfigurationAddVariables,
            }),
          );

          await remoteDataSource
              .geAddPolicyConfiguration(
                  policyConfiguration: policyConfiguration)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(policyConfiguration);
          });
        },
      );
      test(
        '=> geAddPolicyConfiguration when status not equal to Successfully added the Policy Configuration',
        () async {
          final res = {
            'data': {
              'addPolicy': {
                'salesOrg': '2601',
                'principalCode': '2001',
                'monthsBeforeExpiry': '0',
                'monthsAfterExpiry': '0',
                'uuid': 'cfe3d45d-9812-49d7-8b83-ad028b9ae383',
                'returnsAllowed': true,
                'principalName': '',
                'status': 'fake-status'
              },
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
              'query': remoteDataSource.policyConfigurationQueryMutation
                  .addPolicyConfiguration(),
              'variables': getPolicyConfigurationAddVariables,
            }),
          );

          await remoteDataSource
              .geAddPolicyConfiguration(
                  policyConfiguration: policyConfiguration)
              .onError((error, _) async {
            expect(error, isA<ServerException>());
            return Future.value(policyConfiguration);
          });
        },
      );
    },
  );
}
