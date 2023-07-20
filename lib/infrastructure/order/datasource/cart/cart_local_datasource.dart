import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_dto.dart';

class CartLocalDataSource {
  CartLocalDataSource();

  Future<List<MaterialInfo>> getAddedToCartProductList() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getAddedToCartProductList.json'),
    );
    final finalData = data['data']['cart']['EzRxItems'];

    return List.from(finalData)
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }

  Future<List<MaterialInfo>> upsertCart() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/upsertQueryResponse.json'),
    );
    final products = data['data']['upsertCart']['EzRxItems'];

    return List.from(products)
        .map((e) => CartProductDto.fromJson(e).toDomain)
        .toList();
  }
}
