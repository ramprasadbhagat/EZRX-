// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceTierDto _$$_PriceTierDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceTierDto(
      tier: json['tier'] as String? ?? '',
      items: (json['priceTier'] as List<dynamic>?)
              ?.map((e) => PriceTierItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceTierDtoToJson(_$_PriceTierDto instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'priceTier': instance.items.map((e) => e.toJson()).toList(),
    };

_$_PriceTierItemDto _$$_PriceTierItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceTierItemDto(
      type: json['type'] as String? ?? '',
      applyBonus: json['applyBonus'] as bool? ?? false,
      sequence: json['sequence'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      percentage: json['percentage'] as int? ?? 0,
      minAmount: json['minAmount'] as int? ?? 0,
      scaleBasis: json['scaleBasis'] as String? ?? '',
    );

Map<String, dynamic> _$$_PriceTierItemDtoToJson(_$_PriceTierItemDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'applyBonus': instance.applyBonus,
      'sequence': instance.sequence,
      'quantity': instance.quantity,
      'rate': instance.rate,
      'percentage': instance.percentage,
      'minAmount': instance.minAmount,
      'scaleBasis': instance.scaleBasis,
    };
