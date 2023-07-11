import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'payment_summary_dto.freezed.dart';
part 'payment_summary_dto.g.dart';

@freezed
class PaymentSummaryDetailsDto with _$PaymentSummaryDetailsDto {
  const PaymentSummaryDetailsDto._();

  const factory PaymentSummaryDetailsDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'valueDate', defaultValue: '', readValue: paymentDate)
        required String valueDate,
    @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
        required double paymentAmount,
    @JsonKey(name: 'transactionCurrency', defaultValue: '')
        required String transactionCurrency,
    @JsonKey(name: 'paymentDocument', defaultValue: '')
        required String paymentDocument,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'paymentMethod', defaultValue: '')
        required String paymentMethod,
    @JsonKey(name: 'iban', defaultValue: '') required String iban,
    @JsonKey(name: 'bankKey', defaultValue: '') required String bankKey,
    @JsonKey(name: 'bankCountryKey', defaultValue: '')
        required String bankCountryKey,
    @JsonKey(name: 'bankAccountNumber', defaultValue: '')
        required String bankAccountNumber,
    @JsonKey(name: 'bankName', defaultValue: '') required String bankName,
    @JsonKey(name: 'paymentCardID', defaultValue: '')
        required String paymentCardID,
    @JsonKey(name: 'paymentCardNumber', defaultValue: '')
        required String paymentCardNumber,
    @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
        required String paymentCardHolderName,
    @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
        required String paymentCardMaskedNumber,
    @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
        required String paymentCardTypeName,
    @JsonKey(name: 'customId', defaultValue: '') required String customId,
    @JsonKey(name: 'bankIdentification', defaultValue: '')
        required String bankIdentification,
    @JsonKey(name: 'createdDate', defaultValue: '', readValue: createdAtDate)
        required String createdDate,
    @JsonKey(name: 'zzAdvice', defaultValue: '') required String zzAdvice,
    @JsonKey(name: 'adviceExpiry', defaultValue: '')
        required String adviceExpiry,
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
        required String accountingDocExternalReference,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
        required String paymentBatchAdditionalInfo,
  }) = _PaymentSummaryDetailsDto;

  PaymentSummaryDetails toDomain() {
    return PaymentSummaryDetails(
      bankAccountNumber: bankAccountNumber,
      bankCountryKey: bankCountryKey,
      bankIdentification: bankIdentification,
      bankKey: bankKey,
      bankName: bankName,
      customId: customId,
      iban: iban,
      status: StatusType(status),
      paymentAmount: paymentAmount,
      paymentCardHolderName: paymentCardHolderName,
      paymentCardID: paymentCardID,
      paymentCardMaskedNumber: paymentCardMaskedNumber,
      paymentCardNumber: paymentCardNumber,
      paymentCardTypeName: paymentCardTypeName,
      paymentDocument: paymentDocument,
      paymentID: paymentID,
      paymentMethod: paymentMethod,
      transactionCurrency: transactionCurrency,
      valueDate: DateTimeStringValue(valueDate),
      createdDate: DateTimeStringValue(createdDate),
      adviceExpiry: StringValue(adviceExpiry),
      zzAdvice: StringValue(zzAdvice),
      accountingDocExternalReference: accountingDocExternalReference,
      paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
    );
  }

  factory PaymentSummaryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryDetailsDtoFromJson(json);
}

String createdAtDate(Map json, String key) =>
    json[key]?.replaceAll('-', '') ?? '';

String paymentDate(Map json, String key) =>
    json[key]?.replaceAll('-', '') ?? '';
