import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bonus_dto.freezed.dart';
part 'price_bonus_dto.g.dart';

@freezed
class PriceBonusDto with _$PriceBonusDto {
  const PriceBonusDto._();

  const factory PriceBonusDto({
    @JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
        required List<PriceBonusItemDto> items,
  }) = _PriceBonusDto;

  factory PriceBonusDto.fromDomain(PriceBonus priceBonus) {
    return PriceBonusDto(
      items:
          priceBonus.items.map((e) => PriceBonusItemDto.fromDomain(e)).toList(),
    );
  }

  PriceBonus toDomain() => PriceBonus(
        items: items.map((e) => e.toDomain()).toList(),
      );

  factory PriceBonusDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBonusDtoFromJson(json);
}

@freezed
class PriceBonusItemDto with _$PriceBonusItemDto {
  const PriceBonusItemDto._();

  const factory PriceBonusItemDto({
    @JsonKey(name: 'Calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
        required List<BonusMaterialDto> bonusMaterials,
  }) = _PriceBonusItemDto;

  factory PriceBonusItemDto.fromDomain(PriceBonusItem priceBonusItem) {
    return PriceBonusItemDto(
      calculation: priceBonusItem.calculation.getOrDefaultValue(''),
      qualifyingQuantity: priceBonusItem.qualifyingQuantity,
      bonusMaterials: priceBonusItem.bonusMaterials
          .map((e) => BonusMaterialDto.fromDomain(e))
          .toList(),
    );
  }

  PriceBonusItem toDomain() => PriceBonusItem(
        calculation: BonusMaterialCalculation(calculation),
        qualifyingQuantity: qualifyingQuantity,
        bonusMaterials: bonusMaterials.map((e) => e.toDomain()).toList(),
      );

  factory PriceBonusItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBonusItemDtoFromJson(json);
}

@freezed
class BonusMaterialDto with _$BonusMaterialDto {
  const BonusMaterialDto._();

  const factory BonusMaterialDto({
    @JsonKey(name: 'Id', defaultValue: 0) required int id,
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'BonusRatio', defaultValue: 0) required int bonusRatio,
    @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'BonusQuantity', defaultValue: 0) required int bonusQuantity,
    @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
        required int limitPerTransaction,
    @JsonKey(name: 'ConditionId', defaultValue: '') required String conditionId,
    @JsonKey(name: 'OldMaterialCode', defaultValue: '')
        required String oldMaterialCode,
  }) = _BonusMaterialDto;

  factory BonusMaterialDto.fromDomain(BonusMaterial bonusMaterial) {
    return BonusMaterialDto(
      id: bonusMaterial.id,
      materialNumber: bonusMaterial.materialNumber.getOrDefaultValue(''),
      materialDescription: bonusMaterial.materialDescription,
      calculation: bonusMaterial.calculation.getOrDefaultValue(''),
      bonusRatio: bonusMaterial.bonusRatio,
      qualifyingQuantity: bonusMaterial.qualifyingQuantity,
      bonusQuantity: bonusMaterial.bonusQuantity,
      limitPerTransaction: bonusMaterial.limitPerTransaction,
      conditionId: bonusMaterial.conditionId,
      oldMaterialCode: bonusMaterial.oldMaterialCode.getOrDefaultValue(''),
    );
  }

  BonusMaterial toDomain() => BonusMaterial(
        id: id,
        materialNumber: MaterialNumber(materialNumber),
        materialDescription: materialDescription,
        calculation: BonusMaterialCalculation(calculation),
        bonusRatio: bonusRatio,
        qualifyingQuantity: qualifyingQuantity,
        bonusQuantity: bonusQuantity,
        limitPerTransaction: limitPerTransaction,
        conditionId: conditionId,
        oldMaterialCode: MaterialCode(oldMaterialCode),
      );

  factory BonusMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$BonusMaterialDtoFromJson(json);
}
