// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceDetailDtoImpl _$$InvoiceDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceDetailDtoImpl(
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      invoiceDate: json['invoiceDate'] as String? ?? '',
      invoiceProcessingStatus: json['invoiceProcessingStatus'] as String? ?? '',
      invoiceTotalPrice: json['invoiceTotalPrice'] as num? ?? 0,
      invoiceTotalQty: json['invoiceTotalQty'] as num? ?? 0,
      invoiceItems: (json['invoiceItems'] as List<dynamic>)
          .map((e) => OrderHistoryDetailsOrderItemDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InvoiceDetailDtoImplToJson(
        _$InvoiceDetailDtoImpl instance) =>
    <String, dynamic>{
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDate': instance.invoiceDate,
      'invoiceProcessingStatus': instance.invoiceProcessingStatus,
      'invoiceTotalPrice': instance.invoiceTotalPrice,
      'invoiceTotalQty': instance.invoiceTotalQty,
      'invoiceItems': instance.invoiceItems.map((e) => e.toJson()).toList(),
    };
