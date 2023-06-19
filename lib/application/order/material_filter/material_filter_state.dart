part of 'material_filter_bloc.dart';

@freezed
class MaterialFilterState with _$MaterialFilterState {
  const MaterialFilterState._();
  const factory MaterialFilterState({
    required MaterialFilter materialFilter,
    required MaterialFilter selectedMaterialFilter,
    required String searchKey,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required List<String> selectedItem,
    required bool isFavourite,
    required bool isFilterApplied,
    required bool isUpdated,
  }) = _MaterialFilterState;

  factory MaterialFilterState.initial() => MaterialFilterState(
        materialFilter: const MaterialFilter(
          uniqueItemBrand: <String>[],
          uniquePrincipalName: <String>[],
          uniqueTherapeuticClass: <String>[],
        ),
        isFetching: false,
        selectedMaterialFilter: const MaterialFilter(
          uniqueItemBrand: <String>[],
          uniquePrincipalName: <String>[],
          uniqueTherapeuticClass: <String>[],
        ),
        searchKey: '',
        apiFailureOrSuccessOption: none(),
        selectedItem: [],
        isFavourite: false,
        isFilterApplied: false,
        isUpdated: true,
      );

  List<String> getFilterList(MaterialFilterType filterType) {
    switch (filterType) {
      case MaterialFilterType.principal:
        return materialFilter.uniquePrincipalName;
      case MaterialFilterType.therapeutic:
        return materialFilter.uniqueTherapeuticClass;
      case MaterialFilterType.brand:
      default:
        return materialFilter.uniqueItemBrand;
    }
  }

  String getFilterLabel(MaterialFilterType filterType) {
    List<String> filterList;
    switch (filterType) {
      case MaterialFilterType.principal:
        filterList = selectedMaterialFilter.uniquePrincipalName;
        break;
      case MaterialFilterType.therapeutic:
        filterList = selectedMaterialFilter.uniqueTherapeuticClass;
        break;
      case MaterialFilterType.brand:
      default:
        filterList = selectedMaterialFilter.uniqueItemBrand;
        break;
    }

    if (filterList.length > 1) {
      return '+ ${filterList.length}';
    }

    return filterList.isNotEmpty ? filterList.first : 'All';
  }

  List<String> getSearchedFilterList(MaterialFilterType filterType) {
    final filterList = List<String>.from(getFilterList(filterType))
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    if (searchKey.isEmpty) {
      return filterList;
    }

    final filteredList = filterList
        .where((element) =>
            element.toLowerCase().contains(searchKey.toLowerCase()))
        .toList();

    return filteredList;
  }

  bool isSelected(String name) {
    return selectedItem.contains(name);
  }

  MaterialFilter getEmptyMaterialFilter() {
    return const MaterialFilter(
      uniqueItemBrand: <String>[],
      uniquePrincipalName: <String>[],
      uniqueTherapeuticClass: <String>[],
    );
  }

  bool showClearButton({required MaterialFilterType filterType}) {
    switch (filterType) {
      case MaterialFilterType.principal:
        return selectedMaterialFilter.uniquePrincipalName.isNotEmpty;
      case MaterialFilterType.therapeutic:
        return selectedMaterialFilter.uniqueTherapeuticClass.isNotEmpty;
      case MaterialFilterType.brand:
      default:
        return selectedMaterialFilter.uniqueItemBrand.isNotEmpty;
    }
  }
}
