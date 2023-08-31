import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:flutter/services.dart';

class ViewByItemDetailsLocalDataSource {
  ViewByItemDetailsLocalDataSource();
  Future<OrderHistory> getViewByItemDetails() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/viewByItemDetailsResponse.json'),
    );

    final finalData = data['data']['orderHistoryFetchByItems']['OrderHistory'][0];

    return OrderHistoryDto.fromJson(finalData).toDomain();
  }
}
