import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class UpdateSalesOrgRemoteDataSource {
  HttpService httpService;
  UpdateSalesOrgQueryMutation updateSalesOrgQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  UpdateSalesOrgRemoteDataSource({
    required this.httpService,
    required this.updateSalesOrgQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<UpdateSalesOrganisationConfigs> updateSalesOrgConfig({
    required Map<String, dynamic> variableData,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/strapiEngineMutation',
        data: jsonEncode({
          'query': updateSalesOrgQueryMutation.getUpdateSalesOrgConfigsQuery(),
          'variables': {'input': variableData},
        }),
      );

      _updateSalesOrgExceptionChecker(res: res);
      if (res.data['data']['updateSalesOrgConfig']['salesOrgConfig'] == null ||
          res.data['data']['updateSalesOrgConfig']['salesOrgConfig'].isEmpty) {
        return UpdateSalesOrganisationConfigs.empty();
      }

      return UpdateSalesOrganisationConfigsDto.fromJson(
        res.data['data']['updateSalesOrgConfig']['salesOrgConfig'],
      ).toDomain();
    });
  }

  void _updateSalesOrgExceptionChecker({required Response<dynamic> res}) {
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
