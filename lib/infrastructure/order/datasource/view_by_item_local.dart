import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/cart_addition_info_product.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_addition_info_product_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:flutter/services.dart';

class OrderHistoryLocalDataSource {
  OrderHistoryLocalDataSource();
  Future<OrderHistory> getOrderHistory() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getOrderHistoryV2Response.json'),
    );

    final finalData = data['data']['orderHistoryV2']['OrderHistory'][0];

    return OrderHistoryDto.fromJson(finalData).toDomain();
  }

  Future<OrderHistory> getOrderHistoryForSalesRep() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getorderHistoryForSalesRepV2Response.json'),
    );

    final finalData =
        data['data']['orderHistoryForSalesRepV2']['OrderHistory'][0];

    return OrderHistoryDto.fromJson(finalData).toDomain();
  }

  Future<CartAdditionInfoProduct> getItemProductDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getProductQueryResponse.json',
      ),
    );

    return CartAdditionInfoProductDto.fromJson(data['data']['getProduct']).toDomain;
  }
}
