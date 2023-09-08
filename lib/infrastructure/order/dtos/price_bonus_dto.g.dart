// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBonusDto _$$_PriceBonusDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusDto(
      items: (json['BonusTiers'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBonusItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusDtoToJson(_$_PriceBonusDto instance) =>
    <String, dynamic>{
      'BonusTiers': instance.items.map((e) => e.toJson()).toList(),
    };

_$_PriceBonusItemDto _$$_PriceBonusItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusItemDto(
      calculation: json['Calculation'] as String? ?? '',
      qualifyingQuantity: json['QualifyingQuantity'] as int? ?? 0,
      bonusMaterials: (json['BonusMaterial'] as List<dynamic>?)
              ?.map((e) => BonusMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusItemDtoToJson(
        _$_PriceBonusItemDto instance) =>
    <String, dynamic>{
      'Calculation': instance.calculation,
      'QualifyingQuantity': instance.qualifyingQuantity,
      'BonusMaterial': instance.bonusMaterials.map((e) => e.toJson()).toList(),
    };

_$_BonusMaterialDto _$$_BonusMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_BonusMaterialDto(
      id: json['Id'] as int? ?? 0,
      materialNumber: json['MaterialNumber'] as String? ?? '',
      materialDescription: json['MaterialDescription'] as String? ?? '',
      calculation: json['Calculation'] as String? ?? '',
      bonusRatio: json['BonusRatio'] as int? ?? 0,
      qualifyingQuantity: json['QualifyingQuantity'] as int? ?? 0,
      bonusQuantity: json['BonusQuantity'] as int? ?? 0,
      limitPerTransaction: json['LimitPerTransaction'] as int? ?? 0,
      conditionId: json['ConditionId'] as String? ?? '',
      oldMaterialCode: json['OldMaterialCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_BonusMaterialDtoToJson(_$_BonusMaterialDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'MaterialNumber': instance.materialNumber,
      'MaterialDescription': instance.materialDescription,
      'Calculation': instance.calculation,
      'BonusRatio': instance.bonusRatio,
      'QualifyingQuantity': instance.qualifyingQuantity,
      'BonusQuantity': instance.bonusQuantity,
      'LimitPerTransaction': instance.limitPerTransaction,
      'ConditionId': instance.conditionId,
      'OldMaterialCode': instance.oldMaterialCode,
    };
