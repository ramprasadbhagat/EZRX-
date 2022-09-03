import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class SalesOrgRemoteDataSource {
  HttpService httpService;
  SalesOrgQueryMutation salesOrgQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  SalesOrgRemoteDataSource({
    required this.httpService,
    required this.salesOrgQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<SalesOrganisationConfigs> getConfig({required String salesOrg}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngine',
        data: jsonEncode({
          'query': salesOrgQueryMutation.getSalesOrgConfigsQuery(salesOrg),
        }),
      );
      _salesOrgExceptionChecker(res: res);

      return SalesOrganisationConfigsDto.fromJson(
        res.data['data']['salesOrgConfigs'][0],
      ).toDomain();
    });
  }

  void _salesOrgExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['data'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
