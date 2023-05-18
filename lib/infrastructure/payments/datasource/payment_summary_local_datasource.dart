import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_dto.dart';

class PaymentSummaryLocalDataSource {
  PaymentSummaryLocalDataSource();

  Future<List<PaymentSummaryDetails>> getPaymentSummary() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryList.json',
      ),
    );

    return List.from(data['data']['customerPayment'])
        .map((e) => PaymentSummaryDetailsDto.fromJson(e).toDomain())
        .toList();
  }
}
