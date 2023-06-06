import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/add_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_header_logo.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/add_payment_advice_footer_response_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_footer_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/payment_advice_header_logo_dto.dart';
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

  Future<AddPaymentAdviceFooterResponse> addPaymentAdvice() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/addPaymentAdviceMutationResponse.json'),
    );

    return AddPaymentAdviceFooterResponseDto.fromJson(
      data['data']['addPaymentAdvice'],
    ).toDomain();
  }


  Future<PaymentAdviceHeaderLogo> headerLogoUpload() async {
    await Future.delayed(const Duration(seconds: 3));
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentAdviceHeaderLogoUploadResponse.json',
      ),
    );

    return PaymentAdviceHeaderLogoDto.fromJson(data).toDomain();
  }
}
