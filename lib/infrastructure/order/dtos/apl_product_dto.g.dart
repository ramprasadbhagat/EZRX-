// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AplProductDto _$$_AplProductDtoFromJson(Map<String, dynamic> json) =>
    _$_AplProductDto(
      materialNumber: json['material'] as String? ?? '',
      finalPriceTotal: (json['netValue'] as num?)?.toDouble() ?? 0,
      finalPrice: (json['productPriceNetValue'] as num?)?.toDouble() ?? 0,
      productQty: json['productQty'] as int? ?? 0,
      taxValue: (json['taxValue'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_AplProductDtoToJson(_$_AplProductDto instance) =>
    <String, dynamic>{
      'material': instance.materialNumber,
      'netValue': instance.finalPriceTotal,
      'productPriceNetValue': instance.finalPrice,
      'productQty': instance.productQty,
      'taxValue': instance.taxValue,
    };
