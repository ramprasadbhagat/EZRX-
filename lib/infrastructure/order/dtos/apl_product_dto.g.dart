// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AplProductDto _$$_AplProductDtoFromJson(Map<String, dynamic> json) =>
    _$_AplProductDto(
      type: json['type'] as String? ?? '',
      itemNumber: json['itemNumber'] as String? ?? '',
      parentItemNumber: json['parentItemNumber'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      finalPriceTotal: (json['netValue'] as num?)?.toDouble() ?? 0,
      finalPrice: (json['productPriceNetValue'] as num?)?.toDouble() ?? 0,
      productQty: json['productQty'] as int? ?? 0,
      taxValue: (json['taxValue'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_AplProductDtoToJson(_$_AplProductDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'itemNumber': instance.itemNumber,
      'parentItemNumber': instance.parentItemNumber,
      'material': instance.materialNumber,
      'netValue': instance.finalPriceTotal,
      'productPriceNetValue': instance.finalPrice,
      'productQty': instance.productQty,
      'taxValue': instance.taxValue,
    };
