part of 'combo_deal_material_detail_bloc.dart';

@freezed
class ComboDealMaterialDetailState with _$ComboDealMaterialDetailState {
  const ComboDealMaterialDetailState._();
  const factory ComboDealMaterialDetailState({
    required Map<MaterialNumber, PriceAggregate> items,
    required Map<MaterialNumber, bool> selectedItems,
    required bool isFetchingPrice,
    required bool isFetchingComboInfo,
    required bool isUpdateCart,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required SearchKey searchKey,
  }) = _ComboDealDetailState;

  factory ComboDealMaterialDetailState.initial() =>
      ComboDealMaterialDetailState(
        items: {},
        selectedItems: {},
        isFetchingPrice: false,
        isUpdateCart: false,
        isFetchingComboInfo: false,
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        apiFailureOrSuccessOption: none(),
        searchKey: SearchKey.search(''),
      );

  Map<MaterialNumber, PriceAggregate> get itemsWithSearch {
    if (searchKey.searchValueOrEmpty.isEmpty) return items;

    return Map<MaterialNumber, PriceAggregate>.fromEntries(
      items.entries.where(
        (entry) =>
            entry.value.getMaterialNumber.displayMatNo
                .contains(searchKey.searchValueOrEmpty) ||
            entry.value.materialInfo.materialDescription
                .toLowerCase()
                .contains(searchKey.searchValueOrEmpty),
      ),
    );
  }

  List<PriceAggregate> get allSelectedItems {
    final selectedMaterials = Map<MaterialNumber, PriceAggregate>.from(items)
      ..removeWhere(
        (key, value) => selectedItems[key] == false,
      );

    return selectedMaterials.values.toList();
  }

  double get totalPriceSelectedItems => allSelectedItems.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + element.comboOfferPriceTotal,
      );

  List<MaterialNumber> get allMaterialsNumber =>
      itemsWithSearch.entries.map((e) => e.key).toList();

  List<MaterialInfo> get allMaterialsInfo =>
      itemsWithSearch.entries.map((e) => e.value.materialInfo).toList();

  int get totalSelectedQuantity => allSelectedItems.fold<int>(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  ComboDeal get currentDeal => itemsWithSearch.values.toList().firstComboDeal;

  List<List<PriceAggregate>> get itemBySets {
    return currentDeal.materialComboDeals.map((itemSet) {
      final materials = <PriceAggregate>[];
      for (final materialNumber in itemSet.materialNumbers) {
        final material = itemsWithSearch[materialNumber];
        if (material != null) materials.add(material);
      }

      return materials;
    }).toList();
  }
}
