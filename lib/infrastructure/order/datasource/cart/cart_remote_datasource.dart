import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/error/cart_exception.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/cart.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_get_total_price_dto.dart';

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

  Future<Cart> getAddedToCartProductList() async {
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

      final cart = res.data['data']['cart'] ?? {};

      return CartDto.fromJson(makeResponseCamelCase(jsonEncode(cart)))
          .toDomain();
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

  Future<List<PriceAggregate>> upsertCart({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = requestParams['Type'] == 'bundle'
          ? cartQueryMutation.upsertCartItems()
          : cartQueryMutation.upsertCart();
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}cart',
        data: jsonEncode(
          {
            'query': query,
            'variables': {
              'itemInput': requestParams,
            },
          },
        ),
      );

      _exceptionChecker(res: res);

      final productList = res.data['data'][requestParams['Type'] == 'bundle'
              ? 'upsertCartItems'
              : 'upsertCart']['EzRxItems'] ??
          [];

      return List.from(makeResponseCamelCase(jsonEncode(productList))).map((e) {
        return CartProductDto.fromJson(e).toDomain;
      }).toList();
    });
  }

  Future<List<PriceAggregate>> upsertCartItems({
    required List<Map<String, dynamic>> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.upsertCartItems();
      final variables = {
        'itemInput': requestParams,
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
        apiEndpoint: 'UpsertCartItems',
      );

      _exceptionChecker(res: res);

      final productList =
          res.data['data']['upsertCartItems']['EzRxItems'] ?? [];

      return List.from(makeResponseCamelCase(jsonEncode(productList)))
          .map((e) => CartProductDto.fromJson(e).toDomain)
          .toList();
    });
  }

  Future<AplSimulatorOrder> aplSimulateOrder({
    required String salesOrgCode,
    required String customerCode,
    required List<Map<String, String>> materialQuantityPairList,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.aplSimulateOrderQuery();
      final variables = {
        'input': {
          'customer': customerCode,
          'materials': materialQuantityPairList,
          'salesOrg': salesOrgCode,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
        apiEndpoint: 'aplSimulateOrder',
      );

      _exceptionChecker(res: res);

      return AplSimulatorOrderDto.fromJson(res.data['data']['aplSimulateOrder'])
          .toDomain;
    });
  }

  Future<AplSimulatorOrder> aplGetTotalPrice({
    required double totalPrice,
    required String salesOrgCode,
    required String customerCode,
    required List<String> materialNumbers,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final query = cartQueryMutation.aplGetTotalPrice();
      final variables = {
        'AplGetTotalPrice': {
          'Customer': customerCode,
          'Amount': totalPrice,
          'MaterialNumber': materialNumbers,
          'SalesOrg': salesOrgCode,
        },
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}price',
        data: jsonEncode(
          {
            'query': query,
            'variables': variables,
          },
        ),
        apiEndpoint: 'AplGetTotalPrice',
      );

      _exceptionChecker(res: res);

      return AplGetTotalPriceDto.fromJson(res.data['data']['AplGetTotalPrice'])
          .toDomain;
    });
  }

  //Note* 'no cart found' error message is received when the cart is empty hence
  //we do not show any error message to the user.
  void _exceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null &&
        res.data['errors'].isNotEmpty &&
        res.data['errors'][0]['message'] ==
            'shipToAddress changed from existing cart. Delete the cart and then add new item') {
      throw const CartException.cartHasDifferentAddress();
    } else if (res.data['errors'] != null &&
        res.data['errors'].isNotEmpty &&
        res.data['errors'][0]['message'] != 'no cart found') {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
