import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';

class PaymentItemLocalDataSource {
  PaymentItemLocalDataSource();

  Future<List<PaymentItem>> getPaymentItems() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentItemResponse.json',
      ),
    );

    return List.from(data['paymentItems'])
        .map((e) => PaymentItemDto.fromJson(e).toDomain())
        .toList();
  }
}
