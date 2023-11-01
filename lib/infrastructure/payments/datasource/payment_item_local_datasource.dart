import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
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

  Future<PaymentSummaryDetails> getPaymentSummaryDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryListResponse.json',
      ),
    );

    return PaymentSummaryDetailsDto.fromJson(
      data['data']['customerPayment']['customerPaymentResponse'][0],
    ).toDomain();
  }

  Future<bool> deleteCustomerPayment() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/deleteCustomerPaymentResponse.json',
      ),
    );

    final statusMessage =
        data['data']['deleteCustomerPayment']['statusMessage'];

    return statusMessage ==
        'Customer Payment Advice has been Deleted Successfully';
  }
}
