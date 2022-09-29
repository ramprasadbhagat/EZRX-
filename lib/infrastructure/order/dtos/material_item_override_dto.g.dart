// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_override_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialItemOverrideDto _$$_MaterialItemOverrideDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MaterialItemOverrideDto(
      reference: json['reference'] as String? ?? '',
      valueOverride: (json['valueOverride'] as List<dynamic>?)
              ?.map((e) => ValueOverrideDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      percentageOverride: json['percentageOverride'],
    );

Map<String, dynamic> _$$_MaterialItemOverrideDtoToJson(
        _$_MaterialItemOverrideDto instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'valueOverride': instance.valueOverride,
      'percentageOverride': instance.percentageOverride,
    };

_$_ValueOverrideDto _$$_ValueOverrideDtoFromJson(Map<String, dynamic> json) =>
    _$_ValueOverrideDto(
      code: json['code'] as String? ?? '',
      price: json['price'],
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$_ValueOverrideDtoToJson(_$_ValueOverrideDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'price': instance.price,
      'currency': instance.currency,
    };
