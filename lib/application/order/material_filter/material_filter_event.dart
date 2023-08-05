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
  const factory MaterialFilterEvent.updateSelectedMaterialFilter(
    MaterialFilterType filterType,
    Object key,
  ) = _updateSelectedMaterialFilter;
  const factory MaterialFilterEvent.initSelectedMaterialFilter(
    MaterialFilter selectedMaterialFilter,
  ) = _initSelectedMaterialFilter;
  const factory MaterialFilterEvent.updateSearchKey(String searchkey) =
      _updateSearchKey;
  const factory MaterialFilterEvent.search() = _search;
  const factory MaterialFilterEvent.resetFilter() = _resetFilter;
}

enum MaterialFilterType {
  isFavourite,
  productOffers,
  bundleOffers,
  sortBy,
  countryList,
  manufactured,
  brand,
}
