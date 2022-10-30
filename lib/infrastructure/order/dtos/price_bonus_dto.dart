import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
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
    @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
        required List<BonusMaterialDto> bonusMaterials,
  }) = _PriceBonusItemDto;

  factory PriceBonusItemDto.fromDomain(PriceBonusItem priceBonusItem) {
    return PriceBonusItemDto(
      calculation: priceBonusItem.calculation,
      qualifyingQuantity: priceBonusItem.qualifyingQuantity,
      bonusMaterials: priceBonusItem.bonusMaterials
          .map((e) => BonusMaterialDto.fromDomain(e))
          .toList(),
    );
  }

  PriceBonusItem toDomain() => PriceBonusItem(
        calculation: calculation,
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
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'BonusRatio', defaultValue: 0) required int bonusRatio,
    @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'BonusQuantity', defaultValue: 0) required int bonusQuantity,
  }) = _BonusMaterialDto;

  factory BonusMaterialDto.fromDomain(BonusMaterial bonusMaterial) {
    return BonusMaterialDto(
      materialNumber: bonusMaterial.materialNumber,
      materialDescription: bonusMaterial.materialDescription,
      calculation: bonusMaterial.calculation,
      bonusRatio: bonusMaterial.bonusRatio,
      qualifyingQuantity: bonusMaterial.qualifyingQuantity,
      bonusQuantity: bonusMaterial.bonusQuantity,
    );
  }

  BonusMaterial toDomain() => BonusMaterial(
        materialNumber: materialNumber,
        materialDescription: materialDescription,
        calculation: calculation,
        bonusRatio: bonusRatio,
        qualifyingQuantity: qualifyingQuantity,
        bonusQuantity: bonusQuantity,
      );

  factory BonusMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$BonusMaterialDtoFromJson(json);
}
