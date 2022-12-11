import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_filter_dto.dart';

class MaterialFilterRemoteDataSource {
  HttpService httpService;
  MaterialFilterQueryMutation materialFilterQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  MaterialFilterRemoteDataSource({
    required this.httpService,
    required this.materialFilterQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<MaterialFilter> getFilters({
    required String salesOrganisation,
    required String soldToCustomerCode,
    required String shipToCustomerCode,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryMaterialFilters =
          materialFilterQueryMutation.getMaterialFilterCategoryList();

      final materialFilterInputVariables = {
        'customer': soldToCustomerCode,
        'salesOrganisation': salesOrganisation,
        'shipToCustomer': shipToCustomerCode,
        'language': language,
      };

      final resMaterialFilters = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryMaterialFilters,
          'variables': materialFilterInputVariables,
        }),
        apiEndpoint: 'materialsWithMeta',
      );

      _materialFilterExceptionChecker(res: resMaterialFilters);
      final finalData =
          resMaterialFilters.data['data']['materialsWithMeta']['rawMetaData'];

      return MaterialFilterDto.fromJson(finalData).toDomain();
    });
  }

  Future<MaterialFilter> getFiltersSalesRep({
    required String salesOrganisation,
    required String soldToCustomerCode,
    required String shipToCustomerCode,
    required String userName,
    required bool gimmickMaterial,
    required String pickAndPack,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryMaterialFilters =
          materialFilterQueryMutation.getMaterialFilterCategoryListSalesRep();

      final materialFilterInputVariables = {
        'customer': soldToCustomerCode,
        'salesOrganisation': salesOrganisation,
        'customerShipToCode': shipToCustomerCode,
        'username': userName,
        'gimmickMaterial': gimmickMaterial,
        'language': language,
      };

      final resMaterialFilters = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryMaterialFilters,
          'variables': materialFilterInputVariables,
        }),
        apiEndpoint: 'customerMaterialsForSalesRep',
      );

      _materialFilterExceptionChecker(res: resMaterialFilters);
      final finalData = resMaterialFilters.data['data']
          ['customerMaterialsForSalesRep']['rawMetaData'];

      return MaterialFilterDto.fromJson(finalData).toDomain();
    });
  }

  void _materialFilterExceptionChecker({required Response<dynamic> res}) {
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
