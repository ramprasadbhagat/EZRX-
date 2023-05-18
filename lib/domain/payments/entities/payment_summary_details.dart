import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'payment_summary_details.freezed.dart';

@freezed
class PaymentSummaryDetails with _$PaymentSummaryDetails {
  const PaymentSummaryDetails._();

  const factory PaymentSummaryDetails({
    required String paymentID,
    required DateTimeStringValue valueDate,
    required double paymentAmount,
    required String transactionCurrency,
    required String paymentDocument,
    required String status,
    required String paymentMethod,
    required String iban,
    required String bankIdentification,
    required String bankCountryKey,
    required String bankKey,
    required String bankAccountNumber,
    required String bankName,
    required String paymentCardID,
    required String paymentCardNumber,
    required String paymentCardHolderName,
    required String paymentCardMaskedNumber,
    required String paymentCardTypeName,
    required String customId,
    required DateTimeStringValue createdDate,
    required StringValue zzAdvice,
    required StringValue adviceExpiry,
  }) = _PaymentSummaryDetails;
  factory PaymentSummaryDetails.empty() => PaymentSummaryDetails(
        bankAccountNumber: '',
        bankCountryKey: '',
        bankIdentification: '',
        bankKey: '',
        bankName: '',
        customId: '',
        iban: '',
        status: '',
        paymentAmount: 0.0,
        paymentCardHolderName: '',
        paymentCardID: '',
        paymentCardMaskedNumber: '',
        paymentCardNumber: '',
        paymentCardTypeName: '',
        paymentDocument: '',
        paymentID: '',
        paymentMethod: '',
        transactionCurrency: '',
        valueDate: DateTimeStringValue(''),
        createdDate: DateTimeStringValue(''),
        adviceExpiry: StringValue(''),
        zzAdvice: StringValue(''),
      );
}
