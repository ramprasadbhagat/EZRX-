// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_shipping_information_invoices_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsInvoicesDto _$$_OrderHistoryDetailsInvoicesDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryDetailsInvoicesDto(
      invoiceNumber: json['InvoiceNumber'] as String? ?? '',
      invoiceDate: json['InvoiceDate'] as String? ?? '',
      invoicePrice: json['InvoicePrice'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderHistoryDetailsInvoicesDtoToJson(
        _$_OrderHistoryDetailsInvoicesDto instance) =>
    <String, dynamic>{
      'InvoiceNumber': instance.invoiceNumber,
      'InvoiceDate': instance.invoiceDate,
      'InvoicePrice': instance.invoicePrice,
    };
