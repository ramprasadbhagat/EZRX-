// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_document_type_aggregate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDocumentTypeDto _$$_OrderDocumentTypeDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderDocumentTypeDto(
      salesOrg: json['salesOrg'] as String,
      documentType: json['documentType'] as String,
      description: json['description'] as String,
      shippingCondition: json['shippingCondition'] as String,
      orderReason: json['orderReason'] as String,
    );

Map<String, dynamic> _$$_OrderDocumentTypeDtoToJson(
        _$_OrderDocumentTypeDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'documentType': instance.documentType,
      'description': instance.description,
      'shippingCondition': instance.shippingCondition,
      'orderReason': instance.orderReason,
    };
