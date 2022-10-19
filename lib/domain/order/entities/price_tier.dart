import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_tier.freezed.dart';

@freezed
class PriceTier with _$PriceTier {
  const PriceTier._();
  const factory PriceTier({
    required String tier,
    required List<PriceTierItem> items,
  }) = _PriceTier;

  factory PriceTier.empty() => const PriceTier(
        tier: '',
        items: [],
      );
}

@freezed
class PriceTierItem with _$PriceTierItem {
  const PriceTierItem._();
  const factory PriceTierItem({
    required String type,
    required bool applyBonus,
    required int sequence,
    required int quantity,
    required double rate,
  }) = _PriceTierItem;

  factory PriceTierItem.empty() => const PriceTierItem(
        type: '',
        applyBonus: false,
        sequence: 0,
        quantity: 0,
        rate: 0,
      );
}
