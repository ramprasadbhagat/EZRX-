import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/recent_order_favourite_dto.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/recent_order_dto.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_favourite.dart';

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

  Future<RecentOrderFavouriteStatus> fetchProductsFavouriteStatus() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/fetchProductsFavouriteStatusResponse.json'),
    );
    final finalData = data['data']['materialDetails'];

    return RecentOrderFavouriteDto.fromJson(finalData).toDomain();
  }
}
