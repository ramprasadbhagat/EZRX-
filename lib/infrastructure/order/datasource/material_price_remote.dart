import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

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


  //TODO: Will revisit once BE apis are enhanced
  Future<List<Price>> getMaterialPriceList({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required List<String> materialNumbers,
    required List<String> salesDeal,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialPrice();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customer': customerCode,
        'shipToCode': shipToCode,
        'request': materialNumbers
            .map(
              (e) => {
                'MaterialNumber': e,
                'salesDeal': salesDeal,
              },
            )
            .toList(),
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}pricing',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'price',
      );
      _materialPriceExceptionChecker(res: res);
      final priceData = res.data['data']['price'];

      return List.from(priceData)
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<Price> getMaterialPrice({
    required String salesOrgCode,
    required String customerCode,
    required String shipToCode,
    required String materialNumber,
    required List<String> salesDeal,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialPrice();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customer': customerCode,
        'shipToCode': shipToCode,
        'request': {
          'MaterialNumber': materialNumber,
          'salesDeal': salesDeal,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}pricing',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'price',
      );
      _materialPriceExceptionChecker(res: res);
      final priceData = res.data['data']['price'][0];

      return PriceDto.fromJson(priceData).toDomain();
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
