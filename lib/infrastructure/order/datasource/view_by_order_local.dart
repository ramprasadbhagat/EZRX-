import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_dto.dart';
import 'package:flutter/services.dart';

class ViewByOrderHistoryLocalDataSource {
  ViewByOrderHistoryLocalDataSource();
  Future<ViewByOrderHistory> getViewByOrderHistory() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getOrderHistoryResponse.json'),
    );

    final finalData = data['data']['orderHistory']['orderHeaders'][0];

    return ViewByOrderHistoryDto.fromJson(finalData).toDomain();
  }
}
