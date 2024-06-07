import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/policy_configuration_dto.dart';

class PolicyConfigurationRemoteDataSource {
  HttpService httpService;
  PolicyConfigurationQueryMutation policyConfigurationQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  PolicyConfigurationRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.policyConfigurationQueryMutation,
  });

  Future<List<PolicyConfiguration>> getPolicyConfiguration({
    required String salesOrg,
    required String searchKey,
    required int offset,
    required int pageSize,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final response = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ereturn',
          data: jsonEncode(
            {
              'query':
                  policyConfigurationQueryMutation.getPolicyConfiguration(),
              'variables': {
                'request': {
                  'salesOrg': salesOrg,
                  'searchKey': searchKey,
                  'first': pageSize,
                  'after': offset,
                },
              },
            },
          ),
        );

        _policyConfigExceptionChecker(res: response);

        return List.from(response.data['data']['policies'])
            .map((e) => PolicyConfigurationDto.fromJson(e).toDomain())
            .toList();
      },
    );
  }

  Future<PolicyConfiguration> getDeletePolicyConfiguration({
    required PolicyConfiguration policyConfiguration,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final response = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ereturn',
          data: jsonEncode(
            {
              'query':
                  policyConfigurationQueryMutation.deletePolicyConfiguration(),
              'variables': {
                'input': {'uuid': policyConfiguration.uuid},
              },
            },
          ),
        );
        _policyConfigExceptionChecker(res: response);

        return PolicyConfigurationDto.fromJson(
          response.data['data']['deletePolicy'],
        ).toDomain();
      },
    );
  }

  Future<PolicyConfiguration> geAddPolicyConfiguration({
    required PolicyConfiguration policyConfiguration,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        Map<String, Object> variables;
        variables = {
          'salesOrg': policyConfiguration.salesOrg.getOrCrash(),
          'principalCode':
              policyConfiguration.principalCode.getOrDefaultValue(''),
          'returnsAllowed':
              policyConfiguration.returnsAllowed.getOrDefaultValue(false),
        };

        if (policyConfiguration.returnsAllowed.getOrDefaultValue(false)) {
          variables.addEntries({
            MapEntry(
              'monthsBeforeExpiry',
              policyConfiguration.monthsBeforeExpiry.displayMonthsBeforeExpiry,
            ),
            MapEntry(
              'monthsAfterExpiry',
              policyConfiguration.monthsAfterExpiry.displayMonthsAfterExpiry,
            ),
          });
        }

        final response = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ereturn',
          data: jsonEncode(
            {
              'query':
                  policyConfigurationQueryMutation.addPolicyConfiguration(),
              'variables': {
                'input': variables,
              },
            },
          ),
        );

        _policyConfigExceptionChecker(res: response);

        return PolicyConfigurationDto.fromJson(
          response.data['data']['addPolicy'],
        ).toDomain();
      },
    );
  }

  void _policyConfigExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (dataSourceExceptionHandler.isServerResponseError(res: res)) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.data['data']['deletePolicy'] != null) {
      if (res.data['data']['deletePolicy']['status'] != null) {
        if (res.data['data']['deletePolicy']['status'] !=
            'data deleted successfully') {
          throw ServerException(
            message: res.data['data']['deletePolicy']['status'],
          );
        }
      } else {
        throw ServerException(message: 'data not deleted');
      }
    } else if (res.data['data']['addPolicy'] != null) {
      if (res.data['data']['addPolicy']['status'] != null) {
        if (res.data['data']['addPolicy']['status'] !=
            'Successfully added the Policy Configuration') {
          throw ServerException(
            message: res.data['data']['addPolicy']['status'],
          );
        }
      } else {
        throw ServerException(
          message:
              'Policy Configuration is already there for the given Principal Code',
        );
      }
    }
  }
}
