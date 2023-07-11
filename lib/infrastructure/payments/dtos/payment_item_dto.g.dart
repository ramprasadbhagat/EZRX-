// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentItemDto _$$_PaymentItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PaymentItemDto(
      accountingDocument: json['accountingDocument'] as String? ?? '',
      accountingDocumentItem: json['accountingDocumentItem'] as String? ?? '',
      netDueDate: json['netDueDate'] as String? ?? '',
      postingDate: json['postingDate'] as String? ?? '',
      documentDate: json['documentDate'] as String? ?? '',
      paymentAmountInDisplayCrcy:
          (json['paymentAmountInDisplayCrcy'] as num?)?.toDouble() ?? 0,
      postingKeyName: json['postingKeyName'] as String? ?? '',
      accountingDocumentType: json['accountingDocumentType'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentItemDtoToJson(_$_PaymentItemDto instance) =>
    <String, dynamic>{
      'accountingDocument': instance.accountingDocument,
      'accountingDocumentItem': instance.accountingDocumentItem,
      'netDueDate': instance.netDueDate,
      'postingDate': instance.postingDate,
      'documentDate': instance.documentDate,
      'paymentAmountInDisplayCrcy': instance.paymentAmountInDisplayCrcy,
      'postingKeyName': instance.postingKeyName,
      'accountingDocumentType': instance.accountingDocumentType,
    };
