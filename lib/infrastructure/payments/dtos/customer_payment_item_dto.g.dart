// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payment_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerPaymentItemDto _$$_CustomerPaymentItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerPaymentItemDto(
      paymentID: json['paymentID'] as String? ?? '',
      valueDate: json['valueDate'] as String? ?? '',
      paymentAmount: json['paymentAmount'] as num? ?? 0,
      transactionCurrency: json['transactionCurrency'] as String? ?? '',
      invoiceProcessingStatus: json['invoiceProcessingStatus'] as String? ?? '',
      accountingDocExternalReference:
          json['accountingDocExternalReference'] as String? ?? '',
      paymentMethod: json['paymentMethod'] as String? ?? '',
      zCcpPaymentQrCode: json['zCcpPaymentQrCode'] as String? ?? '',
      paymentBatchAdditionalInfo:
          json['paymentBatchAdditionalInfo'] as String? ?? '',
      zzAdvice: json['zzAdvice'] as String? ?? '',
      zzHtmcs: json['zzHtmcs'] as String? ?? '',
      adviceExpiry: json['adviceExpiry'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_CustomerPaymentItemDtoToJson(
        _$_CustomerPaymentItemDto instance) =>
    <String, dynamic>{
      'paymentID': instance.paymentID,
      'valueDate': instance.valueDate,
      'paymentAmount': instance.paymentAmount,
      'transactionCurrency': instance.transactionCurrency,
      'invoiceProcessingStatus': instance.invoiceProcessingStatus,
      'accountingDocExternalReference': instance.accountingDocExternalReference,
      'paymentMethod': instance.paymentMethod,
      'zCcpPaymentQrCode': instance.zCcpPaymentQrCode,
      'paymentBatchAdditionalInfo': instance.paymentBatchAdditionalInfo,
      'zzAdvice': instance.zzAdvice,
      'zzHtmcs': instance.zzHtmcs,
      'adviceExpiry': instance.adviceExpiry,
      'createdDate': instance.createdDate,
      'status': instance.status,
    };
