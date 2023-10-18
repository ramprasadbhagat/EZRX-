import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

class DiscountOverrideRemoteDataSource {
  HttpService httpService;
  MaterialPriceQueryMutation queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  DiscountOverrideRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<Price>> getMaterialOverridePriceList({
    required String salesOrgCode,
    required String customerCode,
    required Map<String, dynamic> materialQuery,
    required String shipToCode,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialPrice();
      final variables = {
        'salesOrganisation': salesOrgCode,
        'customer': customerCode,
        'request': [materialQuery],
        'shipToCode': shipToCode,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}pricing',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _materialPriceExceptionChecker(res: res);
      final priceData = res.data['data']['price'];

      return List.from(makeResponseCamelCase(jsonEncode(priceData)))
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _materialPriceExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (List.from(res.data['data']['price']).isEmpty) {
      throw ServerException(message: 'Error on fetch Price');
    }
  }
}
