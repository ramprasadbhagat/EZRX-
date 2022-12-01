import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bonus.freezed.dart';

@freezed
class PriceBonus with _$PriceBonus {
  const PriceBonus._();
  const factory PriceBonus({
    required List<PriceBonusItem> items,
  }) = _PriceBonus;

  factory PriceBonus.empty() => const PriceBonus(
        items: [],
      );
}

@freezed
class PriceBonusItem with _$PriceBonusItem {
  const PriceBonusItem._();
  const factory PriceBonusItem({
    required String calculation,
    required int qualifyingQuantity,
    required List<BonusMaterial> bonusMaterials,
  }) = _PriceBonusItem;

  factory PriceBonusItem.empty() => const PriceBonusItem(
        calculation: '',
        qualifyingQuantity: 0,
        bonusMaterials: [],
      );
}

@freezed
class BonusMaterial with _$BonusMaterial {
  const BonusMaterial._();
  const factory BonusMaterial({
    required String materialNumber,
    required String materialDescription,
    required String calculation,
    required int bonusRatio,
    required int qualifyingQuantity,
    required int bonusQuantity,
  }) = _BonusMaterial;
}
