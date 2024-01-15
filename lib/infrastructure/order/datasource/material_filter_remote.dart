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
    required String searchKey,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryMaterialFilters =
          materialFilterQueryMutation.getMaterialFilterCategoryList();

      final materialFilterInputVariables = {
        'request': {
          'Customer': soldToCustomerCode,
          'SalesOrg': salesOrganisation,
          'ShipTo': shipToCustomerCode,
          'Language': language,
          'SearchKey': searchKey,
        },
      };

      final resMaterialFilters = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryMaterialFilters,
          'variables': materialFilterInputVariables,
        }),
        apiEndpoint: 'GetFilterListRequest',
      );

      _materialFilterExceptionChecker(res: resMaterialFilters);
      final finalData = resMaterialFilters.data['data']['GetFilterList'];

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
