import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';

class CartRemoteDataSource {
  HttpService httpService;
  CartQueryMutation cartQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  CartRemoteDataSource({
    required this.httpService,
    required this.config,
    required this.cartQueryMutation,
    required this.dataSourceExceptionHandler,
  });

  Future<List<MaterialInfo>> getAddedToCartProductList() async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.cart();
      final variables = {};

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
      );

      _exceptionChecker(res: res);

      final productList = res.data['data']['cart']['EzRxItems'] ?? [];

      return List.from(productList)
          .map((e) => CartProductDto.fromJson(e).toDomain)
          .toList();
    });
  }

  Future<void> deleteCart() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': cartQueryMutation.deleteCartMutation(),
          },
        ),
      );

      _exceptionChecker(res: res);
    });
  }

  Future<List<MaterialInfo>> upsertCart({
    required String productId,
    required int qty,
    required String shipToCode,
    required String customerCode,
    required String salesOrg,
    required String parentId,
    required String language,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.upsertCart();
      final variables = {
        'itemInput': {
          'ProductID': productId,
          'Quantity': qty,
          'ItemSource': 'EZRX',
          'CustomerCode': customerCode,
          'ShipToID': shipToCode,
          'SalesOrg': salesOrg,
          //TODO: Ask auron/wasim, is this always empty?
          'ParentID': parentId,
          'Language': language,
        },
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
      );

      _exceptionChecker(res: res);

      final productList = res.data['data']['upsertCart']['EzRxItems'] ?? [];

      return List.from(productList)
          .map((e) => CartProductDto.fromJson(e).toDomain)
          .toList();
    });
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
