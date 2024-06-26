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
    required List<String> materialNumbers,
    required String shipToCode,
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
              },
            )
            .toList(),
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);
      final priceData = res.data['data']['price'];

      return List.from(makeResponseCamelCase(jsonEncode(priceData)))
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList();
    });
  }

  Future<Price> getMaterialPrice({
    required String salesOrgCode,
    required String customerCode,
    required String materialNumber,
    required String shipToCode,
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
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);
      final priceData = res.data['data']['price'][0];

      return PriceDto.fromJson(makeResponseCamelCase(jsonEncode(priceData)))
          .toDomain();
    });
  }

  Future<Price> getMaterialPriceForZDP5({
    required String salesOrgCode,
    required String customerCode,
    required String materialNumber,
    required String shipToCode,
    required bool exceedQty,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getMaterialPrice();

      final variables = {
        'salesOrganisation': salesOrgCode,
        'customer': customerCode,
        'shipToCode': shipToCode,
        'request': {
          'MaterialNumber': materialNumber,
          'exceedQty': exceedQty,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      if (res.data['data']['price']?.isEmpty ?? true) {
        return Price.empty();
      }

      return PriceDto.fromJson(
        makeResponseCamelCase(jsonEncode(res.data['data']['price'][0])),
      ).toDomain();
    });
  }

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
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _materialPriceExceptionChecker,
      );

      final priceData = res.data['data']['price'];

      return List.from(makeResponseCamelCase(jsonEncode(priceData)))
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _materialPriceExceptionChecker(Response<dynamic> res) {
    if (res.data['data'] != null && res.data['data'].isNotEmpty) {
      if (List.from(res.data['data']?['price'] ?? []).isEmpty) {
        throw ServerException(message: 'Error on fetch Price');
      }
    }
  }
}
