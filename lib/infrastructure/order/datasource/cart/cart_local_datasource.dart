import 'dart:convert';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_get_total_price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/apl_simulator_order_dto.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';

class CartLocalDataSource {
  CartLocalDataSource();

  Future<List<PriceAggregate>> getAddedToCartProductList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getAddedToCartProductList.json'),
    );
    final finalData = data['data']['cart']['EzRxItems'];

    return List.from(finalData)
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<List<PriceAggregate>> upsertCart() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/upsertQueryResponse.json'),
    );
    final products = data['data']['upsertCart']['EzRxItems'];

    return List.from(products)
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<List<PriceAggregate>> upsertCartItems() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/upsertItemsQueryResponse.json'),
    );
    final products = data['data']['upsertCartItems']['EzRxItems'];

    return List.from(makeResponseCamelCase(jsonEncode(products)))
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<List<PriceAggregate>> upsertCartItemsWithComboOffers() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/upsertCartItemsWithComboOffersResponse.json',
      ),
    );
    final products = data['data']['upsertCartItems']['EzRxItems'];

    return List.from(makeResponseCamelCase(jsonEncode(products)))
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<List<PriceAggregate>> upsertCartItemsWithReorderMaterials() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/upsertCartItemsWithReorderMaterialsResponse.json',
      ),
    );
    final products = data['data']['upsertCartItems']['EzRxItems'];

    return List.from(makeResponseCamelCase(jsonEncode(products)))
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<AplSimulatorOrder> aplSimulateOrder() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/aplSimulateOrderResponse.json'),
    );
    final aplSimulatorOrder = data['data']['aplSimulateOrder'];

    return AplSimulatorOrderDto.fromJson(aplSimulatorOrder).toDomain;
  }

  Future<AplSimulatorOrder> aplGetTotalPrice() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/aplGetTotalPriceResponse.json'),
    );

    return AplGetTotalPriceDto.fromJson(data['data']['AplGetTotalPrice'])
        .toDomain;
  }
}
