// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceOrderItemDto _$$_InvoiceOrderItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_InvoiceOrderItemDto(
      invoiceId: json['invoice'] as String? ?? '',
      orderId: json['orderId'] as String? ?? '',
    );

Map<String, dynamic> _$$_InvoiceOrderItemDtoToJson(
        _$_InvoiceOrderItemDto instance) =>
    <String, dynamic>{
      'invoice': instance.invoiceId,
      'orderId': instance.orderId,
    };
