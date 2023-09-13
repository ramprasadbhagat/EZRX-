import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info.freezed.dart';

@freezed
class PaymentInfo with _$PaymentInfo {
  const PaymentInfo._();

  const factory PaymentInfo({
    required String zzHtmcs,
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
  }) = _PaymentInfo;

  factory PaymentInfo.empty() => const PaymentInfo(
        zzHtmcs: '',
        accountingDocExternalReference: '',
        paymentID: '',
        paymentBatchAdditionalInfo: '',
      );

  String get subAccountingDocExternalReference =>
      accountingDocExternalReference.characters.getRange(0, 1).string;
}
