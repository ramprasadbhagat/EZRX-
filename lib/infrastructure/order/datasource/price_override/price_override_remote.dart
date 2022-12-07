import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/error/price_override_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';

class PriceOverrideRemoteDataSource {
  HttpService httpService;
  PriceOverrideQueryMutation priceOverrideQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  PriceOverrideRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.dataSourceExceptionHandler,
    required this.priceOverrideQueryMutation,
  });

  Future<List<Price>> getOverridePrice({
    required String custCode,
    required String salesOrg,
    required String materialNumber,
    required String price,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryMaterialFilters =
          priceOverrideQueryMutation.getItemPriceOverride();

      final inputVariables = {
        'customer': custCode,
        'salesOrganisation': salesOrg,
        'request': [
          {
            'MaterialNumber': materialNumber,
            'ZPO1': price,
          },
        ],
      };

      final priceList = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}pricing',
        data: jsonEncode({
          'query': queryMaterialFilters,
          'variables': inputVariables,
        }),
        apiEndpoint: 'price',
      );

      _priceOverrideExceptionChecker(res: priceList);
      final finalData = priceList.data['data']['price'];

      return List.from(finalData)
          .map((e) => PriceDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _priceOverrideExceptionChecker({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (res.data['errors'] != null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.data['data']['price'] == null ||
        res.data['data']['price'].isEmpty) {
      throw const PriceException.priceNotFound();
    }
  }
}
