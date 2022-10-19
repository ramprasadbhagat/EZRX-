import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bonus.freezed.dart';

@freezed
class PriceBonus with _$PriceBonus {
  const PriceBonus._();
  const factory PriceBonus({
    required String calculation,
    required int qualifyingQuantity,
    required List<PriceBonusItem> items,
  }) = _PriceBonus;

  factory PriceBonus.empty() => const PriceBonus(
        calculation: '',
        qualifyingQuantity: 0,
        items: [],
      );
}

@freezed
class PriceBonusItem with _$PriceBonusItem {
  const PriceBonusItem._();
  const factory PriceBonusItem({
    required String materialNumber,
    required String materialDescription,
    required String calculation,
    required int bonusRatio,
    required int qualifyingQuantity,
    required int bonusQuantity,
  }) = _PriceBonusItem;

  factory PriceBonusItem.empty() => const PriceBonusItem(
        materialNumber: '',
        materialDescription: '',
        calculation: '',
        bonusRatio: 0,
        qualifyingQuantity: 0,
        bonusQuantity: 0,
      );
}
