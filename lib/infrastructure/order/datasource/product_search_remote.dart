import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

class ProductSearchRemoteDataSource {
  HttpService httpService;
  MaterialsWithMetaQuery materialListQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  ProductSearchRemoteDataSource({
    required this.httpService,
    required this.materialListQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<MaterialResponse> getSearchedMaterialList({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required int pageSize,
    required int offset,
    required bool gimmickMaterial,
    required String language,
    required String searchKey,
    required String eanNumber,
    required bool? isCovidSelected,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = materialListQuery.getProductQuery(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );

      final variables = {
        'request': {
          'After': offset,
          'Customer': customerCode,
          'First': pageSize,
          'Language': language,
          'OrderByName': 'asc',
          'SalesOrg': salesOrgCode,
          'ShipTo': shipToCode,
          'isGimmick': gimmickMaterial,
          'SearchKey': searchKey,
          'isFOCMaterial': isCovidSelected,
        },
      };
      if (eanNumber.isNotEmpty) variables['request']!['ean'] = eanNumber;

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _materialListExceptionChecker(res: res);
      final finalData =
          makeResponseCamelCase(jsonEncode(res.data['data']['GetAllProducts']));

      return MaterialResponseDto.fromJson(finalData).toDomain();
    });
  }

  void _materialListExceptionChecker({required Response<dynamic> res}) {
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
