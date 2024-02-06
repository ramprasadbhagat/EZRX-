import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class SalesOrgRemoteDataSource {
  HttpService httpService;
  SalesOrgQueryMutation salesOrgQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  RemoteConfigService remoteConfigService;

  SalesOrgRemoteDataSource({
    required this.httpService,
    required this.salesOrgQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.remoteConfigService,
  });

  Future<SalesOrganisationConfigs> getConfig({required String salesOrg}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/license',
        data: jsonEncode({
          'query': salesOrgQueryMutation
              .getSalesOrgConfigsQuery(remoteConfigService.marketPlaceConfig),
          'variables': {
            'request': {
              'salesOrg': salesOrg,
            },
          },
        }),
        apiEndpoint: 'salesOrgConfigs',
      );

      _salesOrgExceptionChecker(res: res);
      if (res.data['data']['salesOrgConfigs'] == null ||
          res.data['data']['salesOrgConfigs'].isEmpty) {
        return SalesOrganisationConfigs.empty();
      }

      return SalesOrganisationConfigsDto.fromJson(
        res.data['data']['salesOrgConfigs'][0],
      ).toDomain();
    });
  }

  void _salesOrgExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
