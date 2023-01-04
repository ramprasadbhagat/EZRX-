import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/policy_configuration_list_dto.dart';

class PolicyConfigurationRemoteDataSource {
  HttpService httpService;
  PolicyConfigurationListQueryMutation policyConfigurationQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  PolicyConfigurationRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.policyConfigurationQueryMutation,
  });

  Future<List<PolicyConfigurationList>> getPolicyConfigurationList({
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final response = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ereturn',
          data: jsonEncode(
            {
              'query':
                  policyConfigurationQueryMutation.getPolicyConfigurationList(),
              'variables': {
                'request': {
                  'salesOrg': salesOrg,
                },
              },
            },
          ),
        );

        _policyConfigExceptionChecker(res: response);

        return List.from(response.data['data']['policies'])
            .map((e) => PolicyConfigurationListDto.fromJson(e).toDomain())
            .toList();
      },
    );
  }

  void _policyConfigExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    }
  }
}
