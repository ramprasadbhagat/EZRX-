import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_details_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_detail_dto.dart';
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

  Future<PaymentSummaryDetails> getPaymentSummaryDetailsSG() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryListResponse.json',
      ),
    );
    final list = data['data']['customerPayment']['customerPaymentResponse'];

    final payment = list.firstWhere(
      (element) => element['paymentID'] == '213',
      orElse: () => PaymentSummaryDetails.empty(),
    );

    return PaymentSummaryDetailsDto.fromJson(
      payment,
    ).toDomain();
  }

  Future<PaymentSummaryDetails> getPaymentSummaryDetailsPHPayment() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryListResponse.json',
      ),
    );
    final list = data['data']['customerPayment']['customerPaymentResponse'];

    final payment = list.firstWhere(
      (element) => element['paymentID'] == '214',
      orElse: () => PaymentSummaryDetails.empty(),
    );

    return PaymentSummaryDetailsDto.fromJson(
      payment,
    ).toDomain();
  }

  Future<PaymentSummaryDetails> getPaymentSummaryDetailsPHBankIn() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryListResponse.json',
      ),
    );

    final list = data['data']['customerPayment']['customerPaymentResponse'];

    final payment = (list as List).firstWhere(
      (element) => element['paymentID'] == '215',
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
