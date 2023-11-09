// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionInvoiceDto _$$_TransactionInvoiceDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionInvoiceDto(
      documentDate: json['documentDate'] as String? ?? '',
      documentNo: json['documentNo'] as String? ?? '',
      documentType: json['documentType'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_TransactionInvoiceDtoToJson(
        _$_TransactionInvoiceDto instance) =>
    <String, dynamic>{
      'documentDate': instance.documentDate,
      'documentNo': instance.documentNo,
      'documentType': instance.documentType,
      'amount': instance.amount,
    };
