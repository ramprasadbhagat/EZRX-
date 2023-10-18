// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_price_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialPriceDetailDto _$$_MaterialPriceDetailDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialPriceDetailDto(
      price: PriceDto.fromJson(json['price'] as Map<String, dynamic>),
      isValidMaterial: json['validMaterial'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MaterialPriceDetailDtoToJson(
        _$_MaterialPriceDetailDto instance) =>
    <String, dynamic>{
      'price': instance.price.toJson(),
      'validMaterial': instance.isValidMaterial,
    };
