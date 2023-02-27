import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_sku_tier.freezed.dart';

@freezed
class ComboDealSKUTier with _$ComboDealSKUTier {
  const ComboDealSKUTier._();

  const factory ComboDealSKUTier({
    required String rate,
    required String conditionNumber,
    required String minQty,
    required String type,
  }) = _ComboDealSKUTier;
}
