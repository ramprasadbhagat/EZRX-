// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_document_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerDocumentHeaderDto _$$_CustomerDocumentHeaderDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerDocumentHeaderDto(
      invoices: (json['documentHeaderList'] as List<dynamic>?)
              ?.map((e) => InvoiceItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalCount: json['totalCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CustomerDocumentHeaderDtoToJson(
        _$_CustomerDocumentHeaderDto instance) =>
    <String, dynamic>{
      'documentHeaderList': instance.invoices.map((e) => e.toJson()).toList(),
      'totalCount': instance.totalCount,
    };
