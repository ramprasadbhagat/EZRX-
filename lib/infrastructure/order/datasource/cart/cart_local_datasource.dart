import 'dart:convert';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';

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
      await rootBundle.loadString('assets/json/upsertCartItemsWithComboOffersResponse.json'),
    );
    final products = data['data']['upsertCartItems']['EzRxItems'];

    return List.from(makeResponseCamelCase(jsonEncode(products)))
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }
}
