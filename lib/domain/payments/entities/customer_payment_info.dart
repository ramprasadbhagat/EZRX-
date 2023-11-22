import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
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
    required DateTimeStringValue createdDate,
    required AdviceExpiryValue adviceExpiry,
  }) = _CustomerPaymentInfo;

  factory CustomerPaymentInfo.empty() => CustomerPaymentInfo(
        zzHtmcs: '',
        accountingDocExternalReference: '',
        paymentID: '',
        paymentBatchAdditionalInfo: '',
        zzAdvice: '',
        createdDate: DateTimeStringValue(''),
        adviceExpiry: AdviceExpiryValue(''),
      );
}
