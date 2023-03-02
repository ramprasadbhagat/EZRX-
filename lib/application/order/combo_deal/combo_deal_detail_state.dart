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
        (key, value) => selectedItems[value] == false,
      );

    return selectedMaterials.values.toList();
  }

  bool get isEnableAddToCart {
    if (isFetchingPrice || isFetchingComboInfo || allSelectedItems.isEmpty) {
      return false;
    }

    if (items.values.any((item) => !item.selfComboDealEligible)) {
      return false;
    }

    return true;
  }
}
