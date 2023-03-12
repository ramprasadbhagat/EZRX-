part of 'combo_deal_detail_bloc.dart';

@freezed
class ComboDealDetailState with _$ComboDealDetailState {
  const ComboDealDetailState._();
  const factory ComboDealDetailState({
    required Map<MaterialNumber, PriceAggregate> items,
    required Map<MaterialNumber, bool> selectedItems,
    required bool isFetchingPrice,
    required bool isFetchingComboInfo,
  }) = _ComboDealDetailState;

  factory ComboDealDetailState.initial() => const ComboDealDetailState(
        items: {},
        selectedItems: {},
        isFetchingPrice: false,
        isFetchingComboInfo: false,
      );

  List<PriceAggregate> get allSelectedItems {
    final selectedMaterials = Map<MaterialNumber, PriceAggregate>.from(items)
      ..removeWhere(
        (key, value) => selectedItems[key] == false,
      );

    return selectedMaterials.values.toList();
  }

  ComboDeal get currentDeal => items.values.toList().firstComboDeal;

  List<List<PriceAggregate>> get itemBySets {
    return currentDeal.materialComboDeals.map((itemSet) {
      final materials = <PriceAggregate>[];
      for (final materialNumber in itemSet.materialNumbers) {
        final material = items[materialNumber];
        if (material != null) materials.add(material);
      }

      return materials;
    }).toList();
  }

  bool get isEnableAddToCart {
    if (isFetchingPrice || isFetchingComboInfo || allSelectedItems.isEmpty) {
      return false;
    }

    return CartItem.comboDeal(allSelectedItems).isComboDealEligible;
  }
}
