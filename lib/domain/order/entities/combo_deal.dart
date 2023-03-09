import 'package:ezrxmobile/domain/order/entities/combo_deal_amount_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'combo_deal.freezed.dart';

@freezed
class ComboDeal with _$ComboDeal {
  const ComboDeal._();

  const factory ComboDeal({
    required ComboDealGroupDeal groupDeal,
    required List<ComboDealSKUTier> flexiSKUTier,
    required List<ComboDealQtyTier> flexiQtyTier,
    required List<ComboDealAmountTier> flexiAmountTier,
    required List<ComboDealMaterialSet> materialComboDeals,
  }) = _ComboDeal;

  factory ComboDeal.empty() => ComboDeal(
        groupDeal: ComboDealGroupDeal.empty(),
        flexiSKUTier: [],
        flexiQtyTier: [],
        flexiAmountTier: [],
        materialComboDeals: [],
      );

  List<ComboDealQtyTier> get sortedQtyTier =>
      List<ComboDealQtyTier>.from(flexiQtyTier)
        ..sort(
          (first, second) => second.minQty.compareTo(first.minQty),
        );

  List<ComboDealMaterial> get allMaterials => materialComboDeals
      .map(
        (e) => e.materials,
      )
      .flattened
      .toList();

  List<MaterialNumber> get allMaterialNumbers => allMaterials
      .map(
        (e) => e.materialNumber,
      )
      .toList();

  ComboDealMaterial singleDeal({
    required MaterialNumber materialNumber,
  }) =>
      allMaterials.firstWhere(
        (deal) => deal.materialNumber == materialNumber,
        orElse: () => ComboDealMaterial.empty(),
      );

  ComboDealScheme get scheme {
    if (materialComboDeals.isNotEmpty &&
        allMaterials.every((item) => item.mandatory)) {
      return ComboDealScheme.k1;
    }

    if (flexiAmountTier.isEmpty &&
        flexiSKUTier.isEmpty &&
        (groupDeal != ComboDealGroupDeal.empty() || flexiQtyTier.length == 1)) {
      return ComboDealScheme.k2;
    }

    return ComboDealScheme.k1;
  }
}

enum ComboDealScheme { k1, k2, k3, k4, k5 }
