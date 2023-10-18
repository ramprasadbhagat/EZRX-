import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_payment_info.freezed.dart';

@freezed
class CustomerPaymentInfo with _$CustomerPaymentInfo {
  const CustomerPaymentInfo._();

  const factory CustomerPaymentInfo({
    required String zzHtmcs,
    required String paymentID,
    required String paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
    required String zzAdvice,
        required String valueDate,

  }) = _CustomerPaymentInfo;

  factory CustomerPaymentInfo.empty() => const CustomerPaymentInfo(
        zzHtmcs: '',
        accountingDocExternalReference: '',
        paymentID: '',
        paymentBatchAdditionalInfo: '',
        zzAdvice: '',
        valueDate: '',
      );
}
