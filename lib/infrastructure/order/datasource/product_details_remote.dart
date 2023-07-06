import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_query.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_detail_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_meta_data_dto.dart';

class ProductDetailRemoteDataSource {
  HttpService httpService;
  ProductDetailQuery productDetailQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ProductDetailRemoteDataSource({
    required this.httpService,
    required this.productDetailQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });
  Future<MaterialInfo> getProductDetails({
    required String materialNumber,
    required String language,
    required String salesOrg,
    required String customerCode,
    required String shipToCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = productDetailQuery.getMaterialDetails();

      final variables = {
        'materialNumber': materialNumber,
        'language': language,
        'salesOrg': salesOrg,
        'customerCode': customerCode,
        'shipToCode': shipToCode,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _exceptionChecker(res: res);
      final finalData = res.data['data']['materialDetails'];

      return ProductDetailDto.fromJson(finalData).toDomain();
    });
  }

  Future<List<MaterialInfo>> getSimilarProduct({
    required String materialNumber,
    required String language,
    required String salesOrg,
    required String customerCode,
    required String shipToCode,
    required String principalCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = productDetailQuery.getSimilarProductQuery();

      final variables = {
        'after': 0,
        'first': 4,
        'language': language,
        'customerCode': customerCode,
        'excludeMaterialNumber': materialNumber,
        'resultCount': 1,
        'shipToCode': shipToCode,
        'principalCode': principalCode,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _exceptionChecker(res: res);
      final finalData = res.data['data']['similarSearches']['materials'];

      return List.from(finalData)
          .map((e) => MaterialDto.fromJson(e).toDomain())
          .toList();
    });
  }

  

  Future<ProductMetaData> getItemProductMetaData({
    required List<String> materialIDs,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': productDetailQuery.getProductMetaData(),
          'variables': {
            'request': {
              'materialID': materialIDs,
            },
          },
        },
      ),
    );
    _exceptionChecker(res: res);
    final data = res.data['data']['getProduct'];

    return ProductMetaDataDto.fromJson(data).toDomain();
  }

  void _exceptionChecker({required Response<dynamic> res}) {
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
