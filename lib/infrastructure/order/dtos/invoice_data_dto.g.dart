// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceDataDto _$$_InvoiceDataDtoFromJson(Map<String, dynamic> json) =>
    _$_InvoiceDataDto(
      orderNumber: json['orderId'] as String? ?? '',
      invoiceNumber: json['invoice'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_InvoiceDataDtoToJson(_$_InvoiceDataDto instance) =>
    <String, dynamic>{
      'orderId': instance.orderNumber,
      'invoice': instance.invoiceNumber,
      'lineNumber': instance.lineNumber,
    };
