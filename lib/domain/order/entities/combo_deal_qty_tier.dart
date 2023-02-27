import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_qty_tier.freezed.dart';

@freezed
class ComboDealQtyTier with _$ComboDealQtyTier {
  const ComboDealQtyTier._();

  const factory ComboDealQtyTier({
    required String rate,
    required String conditionNumber,
    required String minQty,
    required String type,
  }) = _ComboDealQtyTier;
}
