import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_response_dto.dart';
import 'package:flutter/services.dart';

class OrderLocalDataSource {
  OrderLocalDataSource();

  Future<List<SavedOrder>> getSavedOrders() async {
    await Future.delayed(const Duration(seconds: 5));
    final data = json.decode(
      await rootBundle.loadString('assets/json/getSavedOrdersResponse.json'),
    );

    return List.from(data['data']['draftOrders'])
        .where((e) => json.decode(e['itemlist']) != null)
        .map((e) => SavedOrderDto.fromJson(e).toDomain())
        .toList();
  }

  Future<SavedOrder> deleteSavedOrder() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/deleteSavedOrderTemplateResponse.json'),
    );

    return SavedOrderDto.fromJson(
      data['data']['deleteDraftOrder']['draftOrder'],
    ).toDomain();
  }

  Future<SavedOrder> createDraftOrder() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/createDraftOrderResponse.json'),
    );

    return SavedOrderDto.fromJson(data['data']['createDraftOrder']).toDomain();
  }

  Future<SubmitOrderResponse> submitOrder() async {
    await Future.delayed(const Duration(seconds: 5));
    final data = json.decode(
      await rootBundle.loadString('assets/json/submitOrderResponse.json'),
    );

    return SubmitOrderResponseDto.fromJson(data['data']['submitOrderTwo'])
        .toDomain();
  }

  Future<SavedOrder> getSavedOrderDetail() async {
    await Future.delayed(const Duration(seconds: 5));
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getSavedOrderDetailResponse.json'),
    );

    return SavedOrderDto.fromJson(
      data['data']['draftOrder'],
    ).toDomain();
  }

  Future<SavedOrder> updateDraftOrder() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/updateSavedOrderResponse.json'),
    );

    return SavedOrderDto.fromJson(data['data']['updateDraftOrder']).toDomain();
  }
}
