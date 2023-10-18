// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceBonusDto _$$_PriceBonusDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusDto(
      items: (json['bonusTiers'] as List<dynamic>?)
              ?.map(
                  (e) => PriceBonusItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusDtoToJson(_$_PriceBonusDto instance) =>
    <String, dynamic>{
      'bonusTiers': instance.items.map((e) => e.toJson()).toList(),
    };

_$_PriceBonusItemDto _$$_PriceBonusItemDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceBonusItemDto(
      calculation: json['calculation'] as String? ?? '',
      qualifyingQuantity: json['qualifyingQuantity'] as int? ?? 0,
      bonusMaterials: (json['bonusMaterial'] as List<dynamic>?)
              ?.map((e) => BonusMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PriceBonusItemDtoToJson(
        _$_PriceBonusItemDto instance) =>
    <String, dynamic>{
      'calculation': instance.calculation,
      'qualifyingQuantity': instance.qualifyingQuantity,
      'bonusMaterial': instance.bonusMaterials.map((e) => e.toJson()).toList(),
    };

_$_BonusMaterialDto _$$_BonusMaterialDtoFromJson(Map<String, dynamic> json) =>
    _$_BonusMaterialDto(
      id: json['id'] as int? ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      calculation: json['calculation'] as String? ?? '',
      bonusRatio: json['bonusRatio'] as int? ?? 0,
      qualifyingQuantity: json['qualifyingQuantity'] as int? ?? 0,
      bonusQuantity: json['bonusQuantity'] as int? ?? 0,
      limitPerTransaction: json['limitPerTransaction'] as int? ?? 0,
      conditionId: json['conditionId'] as String? ?? '',
      oldMaterialCode: json['oldMaterialCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_BonusMaterialDtoToJson(_$_BonusMaterialDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'calculation': instance.calculation,
      'bonusRatio': instance.bonusRatio,
      'qualifyingQuantity': instance.qualifyingQuantity,
      'bonusQuantity': instance.bonusQuantity,
      'limitPerTransaction': instance.limitPerTransaction,
      'conditionId': instance.conditionId,
      'oldMaterialCode': instance.oldMaterialCode,
    };
