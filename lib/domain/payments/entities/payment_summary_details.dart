import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'payment_summary_details.freezed.dart';

@freezed
class PaymentSummaryDetails with _$PaymentSummaryDetails {
  const PaymentSummaryDetails._();

  const factory PaymentSummaryDetails({
    required StringValue paymentID,
    required DateTimeStringValue valueDate,
    required double paymentAmount,
    required String transactionCurrency,
    required String paymentDocument,
    required StatusType status,
    required StringValue paymentMethod,
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
    required StringValue paymentBatchAdditionalInfo,
    required String accountingDocExternalReference,
  }) = _PaymentSummaryDetails;
  factory PaymentSummaryDetails.empty() => PaymentSummaryDetails(
        bankAccountNumber: '',
        bankCountryKey: '',
        bankIdentification: '',
        bankKey: '',
        bankName: '',
        customId: '',
        iban: '',
        status: StatusType(''),
        paymentAmount: 0.0,
        paymentCardHolderName: '',
        paymentCardID: '',
        paymentCardMaskedNumber: '',
        paymentCardNumber: '',
        paymentCardTypeName: '',
        paymentDocument: '',
        paymentID: StringValue(''),
        paymentMethod: StringValue(''),
        transactionCurrency: '',
        valueDate: DateTimeStringValue(''),
        createdDate: DateTimeStringValue(''),
        adviceExpiry: StringValue(''),
        zzAdvice: StringValue(''),
        paymentBatchAdditionalInfo: StringValue(''),
        accountingDocExternalReference: '',
      );

  String get adviceExpiryText => status.getIsSuccessfulOrProcessed
      ? 'NA'.tr()
      : status.getIsFailed
          ? 'Expires in ${adviceExpiry.displayDashIfEmpty}'.tr()
          : 'in ${adviceExpiry.displayDashIfEmpty}'.tr();

  String get paymentDate =>
      status.getIsSuccessfulOrProcessed ? valueDate.dateString.tr() : '-'.tr();

  String get dateOrExpiry => status.getIsSuccessfulOrProcessed
      ? 'Payment date: ${createdDate.dateString}'
      : 'Expires in ${adviceExpiry.displayDashIfEmpty}';
}

extension PaymentSummaryListExtension on List<PaymentSummaryDetails> {
  List<PaymentSummaryGroup> get getPaymentSummaryGroupList {
    return List<PaymentSummaryDetails>.from(this)
        .groupListsBy((item) => item.createdDate)
        .entries
        .map(
          (entry) => PaymentSummaryGroup(
            createdDate: entry.key,
            paymentSummaryDetails: entry.value,
          ),
        )
        .toList();
  }
}
