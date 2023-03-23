import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_amount_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
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
    required List<ComboDealTierRule> flexiTierRule,
  }) = _ComboDeal;

  factory ComboDeal.empty() => ComboDeal(
        groupDeal: ComboDealGroupDeal.empty(),
        flexiSKUTier: [],
        flexiQtyTier: [],
        flexiAmountTier: [],
        materialComboDeals: [],
        flexiTierRule: [],
      );

  List<ComboDealQtyTier> get descendingSortedQtyTiers =>
      List<ComboDealQtyTier>.from(flexiQtyTier)
        ..sort(
          (first, second) => second.minQty.compareTo(first.minQty),
        );

  List<ComboDealTierRule> get descendingSortedMinAmountTiers =>
      List<ComboDealTierRule>.from(flexiTierRule)
        ..sort(
          (first, second) =>
              second.minTotalAmount.compareTo(first.minTotalAmount),
        );

  List<ComboDealSKUTier> get descendingSortedSKUTier =>
      List<ComboDealSKUTier>.from(flexiSKUTier)
        ..sort(
          (first, second) => second.minQty.compareTo(first.minQty),
        );

  List<ComboDealSKUTier> get sortedSKUTier =>
      List<ComboDealSKUTier>.from(flexiSKUTier)
        ..sort(
          (first, second) => first.minQty.compareTo(second.minQty),
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

    if (flexiSKUTier.isNotEmpty && flexiQtyTier.isEmpty) {
      return ComboDealScheme.k3;
    }
    if (flexiSKUTier.isEmpty && flexiQtyTier.isNotEmpty) {
      if (materialComboDeals.isNotEmpty &&
          allMaterials.every((item) => item.suffix.isNotEmpty) &&
          flexiQtyTier.every((tier) => tier.suffix.isNotEmpty)) {
        return ComboDealScheme.k4_2;
      }

      return ComboDealScheme.k4;
    }

    if (!isMaterialDeal && flexiTierRule.isNotEmpty) {
      return ComboDealScheme.k5;
    }

    return ComboDealScheme.k1;
  }

  bool get isMaterialDeal =>
      groupDeal != ComboDealGroupDeal.empty() ||
      flexiAmountTier.isNotEmpty ||
      flexiQtyTier.isNotEmpty ||
      flexiSKUTier.isNotEmpty ||
      materialComboDeals.isNotEmpty;

  ComboDealMaterial selectedSuffixForK4_2({
    required PriceAggregate material,
    required ComboDealQtyTier eligibleComboDealQtyTier,
  }) =>
      allMaterials.firstWhere(
        (element) =>
            element.materialNumber == material.getMaterialNumber &&
            eligibleComboDealQtyTier.suffix == element.suffix,
        orElse: () => ComboDealMaterial.empty(),
      );
}

enum ComboDealScheme { k1, k2, k3, k4, k4_2, k5 }
