import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bonus_dto.freezed.dart';
part 'price_bonus_dto.g.dart';

@freezed
class PriceBonusDto with _$PriceBonusDto {
  const PriceBonusDto._();
  const factory PriceBonusDto({
    @JsonKey(name: 'Calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
        required List<PriceBonusItemDto> items,
  }) = _PriceBonusDto;

  PriceBonus toDomain() => PriceBonus(
        calculation: calculation,
        qualifyingQuantity: qualifyingQuantity,
        items: items.map((e) => e.toDomain()).toList(),
      );

  factory PriceBonusDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBonusDtoFromJson(json);
}

@freezed
class PriceBonusItemDto with _$PriceBonusItemDto {
  const PriceBonusItemDto._();
  const factory PriceBonusItemDto({
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Calculation', defaultValue: '') required String calculation,
    @JsonKey(name: 'BonusRatio', defaultValue: 0) required int bonusRatio,
    @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
        required int qualifyingQuantity,
    @JsonKey(name: 'BonusQuantity', defaultValue: 0) required int bonusQuantity,
  }) = _PriceBonusItemDto;

  PriceBonusItem toDomain() => PriceBonusItem(
        materialNumber: materialNumber,
        materialDescription: materialDescription,
        calculation: calculation,
        bonusRatio: bonusRatio,
        qualifyingQuantity: qualifyingQuantity,
        bonusQuantity: bonusQuantity,
      );

  factory PriceBonusItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBonusItemDtoFromJson(json);
}
