import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/recent_order_dto.dart';
import 'package:flutter/services.dart';

class RecentOrdersLocalDataSource {
  RecentOrdersLocalDataSource();

  Future<List<RecentOrderItem>> getRecentOrderedProducts() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getRecentOrderedProductsResponse.json'),
    );
    final finalData = data['data']['recentOrders']['orderItems'];

    return List.from(finalData)
        .map((e) => RecentOrderDto.fromJson(e).toDomain())
        .toList();
  }
}
