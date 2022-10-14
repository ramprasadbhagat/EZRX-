// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBonusDto _$$_PriceBonusDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusDto(
      calculation: json['Calculation'] as String? ?? '',
      qualifyingQuantity: json['QualifyingQuantity'] as int? ?? 0,
      items: (json['BonusMaterial'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBonusItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusDtoToJson(_$_PriceBonusDto instance) =>
    <String, dynamic>{
      'Calculation': instance.calculation,
      'QualifyingQuantity': instance.qualifyingQuantity,
      'BonusMaterial': instance.items,
    };

_$_PriceBonusItemDto _$$_PriceBonusItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusItemDto(
      materialNumber: json['MaterialNumber'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      calculation: json['Calculation'] as String? ?? '',
      bonusRatio: json['BonusRatio'] as int? ?? 0,
      qualifyingQuantity: json['QualifyingQuantity'] as int? ?? 0,
      bonusQuantity: json['BonusQuantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PriceBonusItemDtoToJson(
        _$_PriceBonusItemDto instance) =>
    <String, dynamic>{
      'MaterialNumber': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Calculation': instance.calculation,
      'BonusRatio': instance.bonusRatio,
      'QualifyingQuantity': instance.qualifyingQuantity,
      'BonusQuantity': instance.bonusQuantity,
    };
