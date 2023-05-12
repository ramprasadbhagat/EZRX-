// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnPriceDto _$$_ReturnPriceDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnPriceDto(
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      materialNumber: json['materialNumber'] as String? ?? '',
      itemNumber: json['itemNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnPriceDtoToJson(_$_ReturnPriceDto instance) =>
    <String, dynamic>{
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'materialNumber': instance.materialNumber,
      'itemNumber': instance.itemNumber,
    };
