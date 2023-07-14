// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_invoice_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutstandingInvoiceFilterDto _$$_OutstandingInvoiceFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OutstandingInvoiceFilterDto(
      dueDateFrom: json['dueDateFrom'] as String? ?? '',
      dueDateTo: json['dueDateTo'] as String? ?? '',
      documentDateFrom: json['documentDateFrom'] as String? ?? '',
      documentDateTo: json['documentDateTo'] as String? ?? '',
      amountInTransactionCurrencyFrom:
          json['amountInTransactionCurrencyFrom'] as String? ?? '',
      amountInTransactionCurrencyTo:
          json['amountInTransactionCurrencyTo'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_OutstandingInvoiceFilterDtoToJson(
        _$_OutstandingInvoiceFilterDto instance) =>
    <String, dynamic>{
      'dueDateFrom': instance.dueDateFrom,
      'dueDateTo': instance.dueDateTo,
      'documentDateFrom': instance.documentDateFrom,
      'documentDateTo': instance.documentDateTo,
      'amountInTransactionCurrencyFrom':
          instance.amountInTransactionCurrencyFrom,
      'amountInTransactionCurrencyTo': instance.amountInTransactionCurrencyTo,
      'status': instance.status,
    };
