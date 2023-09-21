// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentInfoDto _$$_PaymentInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentInfoDto(
      zzHtmcs: json['zzHtmcs'] as String? ?? '',
      accountingDocExternalReference:
          json['accountingDocExternalReference'] as String? ?? '',
      paymentID: json['paymentID'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      transactionCurrency: json['transactionCurrency'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentInfoDtoToJson(_$_PaymentInfoDto instance) =>
    <String, dynamic>{
      'zzHtmcs': instance.zzHtmcs,
      'accountingDocExternalReference': instance.accountingDocExternalReference,
      'paymentID': instance.paymentID,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'transactionCurrency': instance.transactionCurrency,
    };
