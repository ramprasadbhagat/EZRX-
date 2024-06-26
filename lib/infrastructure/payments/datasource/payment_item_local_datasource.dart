import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_detail_dto.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/payment_item_dto.dart';

class PaymentItemLocalDataSource {
  static const String sgQrCodeId = '213';
  static const String phPaymentGatewayId = '214';
  static const String phBankInId = '215';

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

  Future<dynamic> get _getPaymentSummaryDetailsJson async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryListResponse.json',
      ),
    );

    return data['data']['customerPayment']['customerPaymentResponse'];
  }

  Future<PaymentSummaryDetails> getPaymentSummaryDetails() async {
    final data = await _getPaymentSummaryDetailsJson;

    return PaymentSummaryDetailsDto.fromJson(
      data[0],
    ).toDomain();
  }

  Future<PaymentSummaryDetails> getPaymentSummaryDetailsByPaymentId(
    String paymentId,
  ) async {
    final data = await _getPaymentSummaryDetailsJson;

    final payment = data.firstWhere(
      (element) => element['paymentID'] == paymentId,
      orElse: () => PaymentSummaryDetails.empty(),
    );

    return PaymentSummaryDetailsDto.fromJson(
      payment,
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

  Future<PaymentSummaryDetails> getTransaction() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getTransactionResponse.json',
      ),
    );

    return TransactionDetailDto.fromJson(
      data['data']['getTransaction'],
    ).toDomain();
  }

  Future<String> cancelPaymentAdvice() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/cancelVirtualTxnResponse.json',
      ),
    );

    return data['data']['cancelVirtualAccount']['id'] as String;
  }
}
