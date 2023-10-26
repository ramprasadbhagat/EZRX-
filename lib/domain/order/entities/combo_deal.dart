import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_amount_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  String getSetNo({
    required MaterialNumber materialNumber,
  }) =>
      materialComboDeals
          .firstWhere(
            (comboSetDeal) => comboSetDeal.materialNumbers
                .any((element) => element == materialNumber),
            orElse: () => ComboDealMaterialSet.empty(),
          )
          .setNo;

  bool get _allMaterialWithSuffix =>
      materialComboDeals.isNotEmpty &&
      allMaterials.every((item) => item.suffix.isValid());

  bool get _allFlexiQtyTierWithSuffix =>
      flexiQtyTier.isNotEmpty &&
      flexiQtyTier.every((tier) => tier.suffix.isValid());

  ComboDealScheme get scheme {
    if (_allMaterialWithSuffix && _allFlexiQtyTierWithSuffix) {
      return ComboDealScheme.kWithSuffix;
    }
    if (materialComboDeals.isNotEmpty &&
        allMaterials.every((item) => item.mandatory)) {
      return ComboDealScheme.k1;
    }

    if (flexiAmountTier.isEmpty && flexiSKUTier.isEmpty) {
      if (groupDeal != ComboDealGroupDeal.empty()) {
        return ComboDealScheme.k21;
      }
      if (flexiQtyTier.length == 1) {
        return ComboDealScheme.k22;
      }
    }

    if (flexiSKUTier.isNotEmpty && flexiQtyTier.isEmpty) {
      return ComboDealScheme.k3;
    }
    if (flexiSKUTier.isEmpty && flexiQtyTier.isNotEmpty) {
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

  ComboDealMaterial selectedSuffix({
    required PriceAggregate material,
    required ComboDealQtyTier eligibleComboDealQtyTier,
  }) =>
      allMaterials.firstWhere(
        (element) =>
            element.materialNumber == material.getMaterialNumber &&
            eligibleComboDealQtyTier.suffix == element.suffix,
        orElse: () => ComboDealMaterial.empty(),
      );

  double getMaterialComboRate({required MaterialNumber materialNumber}) {
    final materialSingleDeal = singleDeal(materialNumber: materialNumber);
    switch (scheme) {
      case ComboDealScheme.k1:
        return materialSingleDeal.rateToAbs;
      case ComboDealScheme.k21:
        return groupDeal.rateToAbs;
      case ComboDealScheme.k22:
        return descendingSortedQtyTiers.firstOrNull?.rateToAbs ?? 0;
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k5:
      case ComboDealScheme.kWithSuffix:
        //TODO: Implement later for K3, K4, K5
        return groupDeal.rateToAbs;
    }
  }

  int get minPurchaseQty {
    switch (scheme) {
      case ComboDealScheme.k22:
        return descendingSortedQtyTiers.firstOrNull?.minQty ?? 0;
      case ComboDealScheme.k3:
        return descendingSortedSKUTier.last.minQty;
      case ComboDealScheme.k4:
        return descendingSortedQtyTiers.last.minQty;
      case ComboDealScheme.k5:
      case ComboDealScheme.kWithSuffix:
        //TODO: Implement later for K3, K4, K5
        return groupDeal.minTotalQuantity;
      default:
        return 0;
    }
  }

  String materialComboRateDisplay({
    required MaterialNumber materialNumber,
  }) {
    final comboRate = getMaterialComboRate(materialNumber: materialNumber);

    if (comboRate == comboRate.toInt()) {
      return comboRate.toInt().toString();
    }

    return comboRate.toString();
  }
}

enum ComboDealScheme { k1, k21, k22, k3, k4, k5, kWithSuffix }

extension ComboDealSchemeExt on ComboDealScheme {
  String getTotalUnitMessage(
    BuildContext context, {
    required int totalUnit,
  }) {
    switch (this) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
      case ComboDealScheme.k3:
      case ComboDealScheme.k5:
        return '$totalUnit ${context.tr('items')}';
      case ComboDealScheme.k22:
      case ComboDealScheme.k4:
        return '${context.tr('Total qty:')} $totalUnit';
      case ComboDealScheme.kWithSuffix:
        return '';
    }
  }

  String getDiscountOnMessage(BuildContext context) {
    switch (this) {
      case ComboDealScheme.k1:
      case ComboDealScheme.k21:
        return context.tr('Per item');
      case ComboDealScheme.k22:
      case ComboDealScheme.k4:
        return context.tr('Total Quantity');
      case ComboDealScheme.k3:
        return context.tr('Total SKUs');
      case ComboDealScheme.k5:
        return context.tr('Total Order Amount');
      case ComboDealScheme.kWithSuffix:
        return '';
    }
  }

  String getRequirementMessage(BuildContext context) {
    switch (this) {
      case ComboDealScheme.k1:
        return context.tr('Purchase all items with min. of its quantity.');
      case ComboDealScheme.k21:
        return context.tr(
          'Purchase FIXED product with min. of its quantity and any product in the list.',
        );
      case ComboDealScheme.k22:
        return context.tr(
          'Purchase any products with min. <n> of total quantity.',
        );
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k5:
      case ComboDealScheme.kWithSuffix:
        //TODO: Implement later for K3, K4, K5
        return '';
    }
  }

  String get comboDealTitleAppbar {
    var title = '';
    switch (this) {
      case ComboDealScheme.k1:
        title = 'Combo K1';
        break;
      case ComboDealScheme.k21:
        title = 'Combo K2.1';
        break;
      case ComboDealScheme.k22:
        title = 'Combo K2.2';
        break;
      case ComboDealScheme.k3:
        title = 'Combo K3';
        break;
      case ComboDealScheme.k4:
        title = 'Combo K4';
        break;
      case ComboDealScheme.k5:
        title = 'Combo K5';
        break;
      case ComboDealScheme.kWithSuffix:
        title = '';
        break;
    }

    return title;
  }

  String get comboDealType {
    switch (this) {
      case ComboDealScheme.k1:
        return 'K1';
      case ComboDealScheme.k21:
      case ComboDealScheme.k22:
        return 'K2';
      case ComboDealScheme.k3:
        return 'K3';

      case ComboDealScheme.k4:
        return 'K4';

      case ComboDealScheme.k5:
        return 'K5';
      case ComboDealScheme.kWithSuffix:
        return '';
    }
  }

  bool get displayDiscountedPrice => this == ComboDealScheme.k1;

  bool get displayDiscountedSubTotal => this == ComboDealScheme.k21;

  bool get displayOriginalPrice =>
      this != ComboDealScheme.k1 && this != ComboDealScheme.k21;

  bool isComboDealEligible(List<PriceAggregate> materials) {
    final comboDeal = materials.firstComboDeal;

    if (materials.any((item) => !item.selfComboDealEligible)) return false;

    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return true;
      case ComboDealScheme.k21:
        final mandatoryComboDeal = comboDeal.materialComboDeals
            .where(
              (materialComboDeal) => materialComboDeal.materials
                  .every((material) => material.mandatory),
            )
            .toList();
        return mandatoryComboDeal.every(
          (setItem) {
            final totalSetQty = materials
                .where(
                  (material) => setItem.materialNumbers
                      .contains(material.getMaterialNumber),
                )
                .fold<int>(0, (sum, item) => sum + item.quantity);

            return totalSetQty != 0;
          },
        );
      case ComboDealScheme.k22:
        return getEligibleComboDealQtyTier(materials) !=
            ComboDealQtyTier.empty();

      case ComboDealScheme.k3:
        return getEligibleComboDealSKUTier(materials) !=
            ComboDealSKUTier.empty();
      case ComboDealScheme.k4:
      case ComboDealScheme.kWithSuffix:
        return getEligibleComboDealQtyTier(materials) !=
            ComboDealQtyTier.empty();
      case ComboDealScheme.k5:
        return getEligibleComboDealTierRule(materials) !=
            ComboDealTierRule.empty();
    }
  }

  ComboDealQtyTier getEligibleComboDealQtyTier(List<PriceAggregate> materials) {
    final totalQty = materials.fold<int>(0, (sum, item) => sum + item.quantity);
    if (materials.isEmpty) return ComboDealQtyTier.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedQtyTiers.firstWhere(
      (tier) => totalQty >= tier.minQty,
      orElse: () => ComboDealQtyTier.empty(),
    );
  }

  ComboDealTierRule getEligibleComboDealTierRule(
    List<PriceAggregate> materials,
  ) {
    if (materials.isEmpty) return ComboDealTierRule.empty();
    final comboDeal = materials.first.comboDeal;

    final comboDealTotal = materials.fold<double>(
      0,
      (sum, item) => sum + item.comboDealTotalListPrice,
    );

    return comboDeal.descendingSortedMinAmountTiers.firstWhere(
      (tier) => tier.minTotalAmount <= comboDealTotal,
      orElse: () => ComboDealTierRule.empty(),
    );
  }

  ComboDealSKUTier getEligibleComboDealSKUTier(
    List<PriceAggregate> materials,
  ) {
    if (materials.isEmpty) return ComboDealSKUTier.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedSKUTier.firstWhere(
      (tier) => materials.length >= tier.minQty,
      orElse: () => ComboDealSKUTier.empty(),
    );
  }
}
