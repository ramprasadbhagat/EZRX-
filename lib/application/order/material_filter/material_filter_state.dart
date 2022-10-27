part of 'material_filter_bloc.dart';

@freezed
class MaterialFilterState with _$MaterialFilterState {
  const MaterialFilterState._();
  const factory MaterialFilterState({
    required MaterialFilter materialFilter,
    required MaterialFilter selectedMaterialFilter,
    required String searchKey,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _MaterialFilterState;

  factory MaterialFilterState.initial() => MaterialFilterState(
        materialFilter: const MaterialFilter(
          uniqueItemBrand: <String>[],
          uniquePrincipalName: <String>[],
          uniqueTherapeuticClass: <String>[],
        ),
        selectedMaterialFilter: const MaterialFilter(
          uniqueItemBrand: <String>[],
          uniquePrincipalName: <String>[],
          uniqueTherapeuticClass: <String>[],
        ),
        searchKey: '',
        apiFailureOrSuccessOption: none(),
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

  List<String> getSelectedFilterList(MaterialFilterType filterType) {
    switch (filterType) {
      case MaterialFilterType.principal:
        return selectedMaterialFilter.uniquePrincipalName;
      case MaterialFilterType.therapeutic:
        return selectedMaterialFilter.uniqueTherapeuticClass;
      case MaterialFilterType.brand:
      default:
        return selectedMaterialFilter.uniqueItemBrand;
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
    final filterList = getFilterList(filterType);
    if (searchKey.isEmpty) {
      return filterList;
    }

    final filteredList = filterList
        .where((element) =>
            element.toLowerCase().contains(searchKey.toLowerCase()))
        .toList();

    return filteredList;
  }

  bool isSelected(MaterialFilterType filterType, String name) {
    return getSelectedFilterList(filterType).contains(name);
  }
}
