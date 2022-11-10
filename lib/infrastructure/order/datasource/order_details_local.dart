import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_dto.dart';
import 'package:flutter/services.dart';

class OrderHistoryDetailsLocalDataSource {
  OrderHistoryDetailsLocalDataSource();
  Future<OrderHistoryDetails> getOrderHistoryDetails() async {
    
    final data = json.decode(
      await rootBundle.loadString('assets/json/getOrderDetailsResponse.json'),
    );

    final finalData = data['data']['orderDetails'];

    return OrderHistoryDetailsDto.fromJson(finalData).toDomain(); 
  }
  Future<OrderHistoryDetails> getOrderHistoryDetailsForSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getorderDetailsForSalesRep.json'),
    );
    

    final finalData = data['data']['orderDetailsForSalesRep'];
    
    return OrderHistoryDetailsDto.fromJson(finalData).toDomain(); 
  }

}
