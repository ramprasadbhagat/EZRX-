part of 'combo_deal_principle_detail_bloc.dart';

@freezed
class ComboDealPrincipleDetailState with _$ComboDealPrincipleDetailState {
  const ComboDealPrincipleDetailState._();
  const factory ComboDealPrincipleDetailState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required Map<MaterialNumber, PriceAggregate> items,
    required Map<MaterialNumber, bool> selectedItems,
    required int itemPageNumber,
    required bool isFetchingPrice,
    required bool isFetchingComboInfo,
    required bool isFetchingMaterials,
    required bool canLoadMore,
  }) = _ComboDealPrincipleDetailState;

  factory ComboDealPrincipleDetailState.initial() =>
      ComboDealPrincipleDetailState(
        itemPageNumber: 0,
        items: {},
        selectedItems: {},
        isFetchingPrice: false,
        isFetchingComboInfo: false,
        isFetchingMaterials: false,
        canLoadMore: false,
        apiFailureOrSuccessOption: none(),
      );

  List<PriceAggregate> get allSelectedItems {
    final selectedMaterials = Map<MaterialNumber, PriceAggregate>.from(items)
      ..removeWhere(
        (key, value) => !(selectedItems[key] ?? false),
      );

    return selectedMaterials.values.toList();
  }

  ComboDeal get currentDeal => items.values.toList().firstComboDeal;

  bool get isFetching =>
      isFetchingMaterials || isFetchingComboInfo || isFetchingPrice;
}
