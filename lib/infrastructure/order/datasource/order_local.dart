import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:flutter/services.dart';

class OrderLocalDataSource {
  OrderLocalDataSource();

  Future<List<SavedOrder>> getSavedOrders() async {
    await Future.delayed(const Duration(seconds: 5));
    final data = json.decode(
      await rootBundle.loadString('assets/json/getSavedOrdersResponse.json'),
    );

    return List.from(data['data']['draftorders'])
        .map((e) => SavedOrderDto.fromJson(e).toDomain())
        .toList();
  }

  Future<SavedOrder> deleteSavedOrder({required SavedOrder item}) async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/deleteSavedOrderTemplateResponse.json'),
    );

    return SavedOrderDto.fromJson(
      data['data']['deleteDraftOrder']['draftOrder'],
    ).toDomain();
  }

  Future<SavedOrder> createDraftOrder({
    required SavedOrderDto draftOrder,
  }) async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/createDraftOrderResponse.json'),
    );

    return SavedOrderDto.fromJson(data['data']['createDraftOrder']).toDomain();
  }
}
