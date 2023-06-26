import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/order/entities/cart_product.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';

class CartLocalDataSource {
  CartLocalDataSource();

  Future<List<CartProduct>> getAddedToCartProductList() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getAddedToCartProductList.json'),
    );
    final finalData = data['data']['cart']['EzRxItems'];

    return List.from(finalData)
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }
}
