import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:flutter/services.dart';

class OrderHistoryLocalDataSource {
  OrderHistoryLocalDataSource();
  Future<List<OrderHistory>> getOrderHistory({
    required String loginUserType,
  }) async {
    final data = json.decode(
      await rootBundle.loadString(loginUserType == 'client'
          ? 'assets/json/getOrderHistoryV2Response.json'
          : 'assets/json/getorderHistoryForSalesRepV2Response.json'),
    );

    final finalData = loginUserType == 'client'
        ? data['data']['orderHistoryV2']['OrderHistory'][0]['OrderItems']
        : data['data']['orderHistoryForSalesRepV2']['OrderHistory'][0]
            ['OrderItems'];

    return List.from(finalData)
        .map((e) => OrderHistoryDto.fromJson(e).toDomain())
        .toList();
  }
}
