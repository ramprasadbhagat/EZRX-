part of 'material_filter_bloc.dart';

@freezed
class MaterialFilterEvent with _$MaterialFilterEvent {
  const factory MaterialFilterEvent.initialized() = _Initialized;
  const factory MaterialFilterEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisationConfigs salesOrgConfig,
    required String pickAndPack,
  }) = _fetch;
  const factory MaterialFilterEvent.updateMaterialSelected(
    MaterialFilterType filterType,
  ) = _updateMaterialSelected;
  const factory MaterialFilterEvent.updateTappedMaterialSelected(
    MaterialFilterType filterType,
    String selectedFilter,
  ) = _updateTappedMaterialSelected;
  const factory MaterialFilterEvent.setTappedMaterialToEmpty() =
      _SetTappedMaterialToEmpty;
  const factory MaterialFilterEvent.initiateTappedMaterial({
    required MaterialFilterType filterType,
  }) = _InitiateTappedMaterial;
  const factory MaterialFilterEvent.updateSearchKey(String searchkey) =
      _updateSearchKey;
  const factory MaterialFilterEvent.clearSelected() = _clearSelected;
  const factory MaterialFilterEvent.clearAllSelected(
    MaterialFilterType filterType,
  ) = _clearAllSelected;
  const factory MaterialFilterEvent.resetFilter() = _resetFilter;
}

enum MaterialFilterType {
  principal,
  therapeutic,
  brand,
}
