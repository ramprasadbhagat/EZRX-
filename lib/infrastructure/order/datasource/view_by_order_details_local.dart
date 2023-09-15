import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:flutter/services.dart';

class ViewByOrderDetailsLocalDataSource {
  ViewByOrderDetailsLocalDataSource();
  Future<OrderHistoryDetails> getOrderHistoryDetails() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getOrderDetailsResponse.json'),
    );

    final finalData = data['data']['orderHistoryV3']['orderHeaders'][0];

    return OrderHistoryDetailsDto.fromJson(finalData).toDomain();
  }
}
