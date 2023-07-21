import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details_response.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_response_dto.dart';
import 'package:flutter/services.dart';


class PaymentSummaryLocalDataSource {
  PaymentSummaryLocalDataSource();

  Future<PaymentSummaryDetailsResponse> getPaymentSummary() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryList.json',
      ),
    );

    return PaymentSummaryDetailsResponseDto.fromJson(data).toDomain();
  }
}
