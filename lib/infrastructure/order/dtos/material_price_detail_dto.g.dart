// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_price_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialDetailDto _$$_MaterialDetailDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialDetailDto(
      price: PriceDto.fromJson(json['Price'] as Map<String, dynamic>),
      info: CustomerMaterialDto.fromJson(
          json['MaterialInformation'] as Map<String, dynamic>),
      isValidMaterial: json['ValidMaterial'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MaterialDetailDtoToJson(
        _$_MaterialDetailDto instance) =>
    <String, dynamic>{
      'Price': instance.price,
      'MaterialInformation': instance.info,
      'ValidMaterial': instance.isValidMaterial,
    };
