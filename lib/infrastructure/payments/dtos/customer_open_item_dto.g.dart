// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_open_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerOpenItemDto _$$_CustomerOpenItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerOpenItemDto(
      status: json['status'] as String? ?? '',
      accountingDocument: json['accountingDocument'] as String? ?? '',
      netDueDate: json['netDueDate'] as String? ?? '',
      documentReferenceID: json['documentReferenceID'] as String? ?? '',
      postingKeyName: json['postingKeyName'] as String? ?? '',
      amountInTransactionCurrency:
          (json['amountInTransactionCurrency'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_CustomerOpenItemDtoToJson(
        _$_CustomerOpenItemDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'accountingDocument': instance.accountingDocument,
      'netDueDate': instance.netDueDate,
      'documentReferenceID': instance.documentReferenceID,
      'postingKeyName': instance.postingKeyName,
      'amountInTransactionCurrency': instance.amountInTransactionCurrency,
    };
