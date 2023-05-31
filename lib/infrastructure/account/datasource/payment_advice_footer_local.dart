import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_footer_dto.dart';
import 'package:flutter/services.dart';

class PaymentAdviceFooterLocalDataSource {
  PaymentAdviceFooterLocalDataSource();

  Future<List<PaymentAdviceFooter>> getPaymentAdvice() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getPaymentAdviceResponse.json',
      ),
    );

    return List.from(data['data']['paymentAdvice'])
        .map((e) => PaymentAdviceFooterDto.fromJson(e).toDomain())
        .toList();
  }
}
