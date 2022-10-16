import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/material/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/material/dtos/price_dto.dart';

class MaterialPriceRemoteDataSource {
  HttpService httpService;
  MaterialPriceQueryMutation queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  MaterialPriceRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<Price>> getMaterialList({
    required String salesOrgCode,
    required String customerCode,
    required List<String> materialNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialPrice();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customer': customerCode,
        'request': materialNumbers.map((e) => {'MaterialNumber': e}).toList(),
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

      return List.from(priceData)
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _materialPriceExceptionChecker({required Response<dynamic> res}) {
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
