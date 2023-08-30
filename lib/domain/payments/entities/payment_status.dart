import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status.freezed.dart';

@freezed
class PaymentStatus with _$PaymentStatus {
  const PaymentStatus._();

  const factory PaymentStatus({
    required Uri uri,
  }) = _PaymentStatus;

  factory PaymentStatus.empty() => PaymentStatus(
        uri: Uri(),
      );

  String get txnStatusEncrypt => uri.queryParameters['TxnStatus'] ?? '';

  String get paymentIdEncrypt => uri.queryParameters['paymentId'] ?? '';

  String get transactionRefEncrypt =>
      uri.queryParameters['transactionReference'] ?? '';

  String get host => uri.host;

  String get market => host.characters
      .getRange(
        host.indexOf('.ezrx.com') - 2,
        host.indexOf('.ezrx.com'),
      )
      .string;
}
