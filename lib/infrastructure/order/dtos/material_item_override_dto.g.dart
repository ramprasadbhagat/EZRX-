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
      percentageOverride: (json['percentageOverride'] as List<dynamic>?)
              ?.map((e) =>
                  PercentageOverrideDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_MaterialItemOverrideDtoToJson(
    _$_MaterialItemOverrideDto instance) {
  final val = <String, dynamic>{
    'reference': instance.reference,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('valueOverride', valueOverrideTojson(instance.valueOverride));
  writeNotNull('percentageOverride',
      percentageOverrideTojson(instance.percentageOverride));
  return val;
}

_$_ValueOverrideDto _$$_ValueOverrideDtoFromJson(Map<String, dynamic> json) =>
    _$_ValueOverrideDto(
      code: json['code'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$_ValueOverrideDtoToJson(_$_ValueOverrideDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'price': instance.price,
      'currency': instance.currency,
    };

_$_PercentageOverrideDto _$$_PercentageOverrideDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PercentageOverrideDto(
      code: json['code'] as String,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PercentageOverrideDtoToJson(
        _$_PercentageOverrideDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'percentage': instance.percentage,
    };
