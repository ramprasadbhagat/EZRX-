import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
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
}
