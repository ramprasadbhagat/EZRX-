// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceTierDto _$$_PriceTierDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceTierDto(
      tier: json['Tier'] as String? ?? '',
      items: (json['PriceTier'] as List<dynamic>?)
              ?.map((e) => PriceTierItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceTierDtoToJson(_$_PriceTierDto instance) =>
    <String, dynamic>{
      'Tier': instance.tier,
      'PriceTier': instance.items,
    };

_$_PriceTierItemDto _$$_PriceTierItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceTierItemDto(
      type: json['Type'] as String? ?? '',
      applyBonus: json['ApplyBonus'] as bool? ?? false,
      sequence: json['Sequence'] as int? ?? 0,
      quantity: json['Quantity'] as int? ?? 0,
      rate: (json['Rate'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PriceTierItemDtoToJson(_$_PriceTierItemDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'ApplyBonus': instance.applyBonus,
      'Sequence': instance.sequence,
      'Quantity': instance.quantity,
      'Rate': instance.rate,
    };
