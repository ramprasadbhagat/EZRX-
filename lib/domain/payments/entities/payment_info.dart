import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info.freezed.dart';

@freezed
class PaymentInfo with _$PaymentInfo {
  const PaymentInfo._();

  const factory PaymentInfo({
    required String paymentID,
    required String paymentBatchAdditionalInfo,
  }) = _PaymentInfo;

  factory PaymentInfo.empty() => const PaymentInfo(
        paymentID: '',
        paymentBatchAdditionalInfo: '',
      );
}
