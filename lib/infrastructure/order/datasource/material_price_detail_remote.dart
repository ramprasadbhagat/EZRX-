import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_price_detail_dto.dart';

class MaterialPriceDetailRemoteDataSource {
  HttpService httpService;
  MaterialPriceDetailQueryMutation queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  MaterialPriceDetailRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<MaterialPriceDetail>> getMaterialDetail({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required String language,
    required List<String> materialNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialDetail();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCode': shipToCode,
        'request': materialNumbers.map((e) => {'MaterialNumber': e}).toList(),
      };

      if (language.isNotEmpty) variables.addAll({'language': language});

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}pricing',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'customerMaterialPriceDetailsQuery',
      );
      _materialPriceExceptionChecker(res: res);
      final materialDetailData =
          res.data['data']['customerMaterialPriceDetails'];

      return List.from(materialDetailData)
          .map((e) => MaterialDetailDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<List<MaterialPriceDetail>> getMaterialDetailZDP5Enabled({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required String language,
    required Map<String, bool> materialNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialDetail();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customerCode': customerCode,
        'shipToCode': shipToCode,
        'request': materialNumbers.entries
            .map(
              (e) => {
                'MaterialNumber': e.key,
                'exceedQty': e.value,
              },
            )
            .toList(),
      };

      if (language.isNotEmpty) variables.addAll({'language': language});

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}pricing',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'customerMaterialPriceDetailsQuery',
      );
      _materialPriceExceptionChecker(res: res);
      final materialDetailData =
          res.data['data']['customerMaterialPriceDetails'];

      return List.from(materialDetailData)
          .map((e) => MaterialDetailDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _materialPriceExceptionChecker({required Response<dynamic> res}) {
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
