part of 'covid_material_list_bloc.dart';

@freezed
class CovidMaterialListEvent with _$CovidMaterialListEvent {
  const factory CovidMaterialListEvent.initialized() = _Initialized;

  const factory CovidMaterialListEvent.fetch({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String pickAndPack,
    required String searchKey,
  }) = _Fetch;

  const factory CovidMaterialListEvent.searchMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
    required String pickAndPack,
    required String searchKey,
  }) = _SearchMaterialList;
  const factory CovidMaterialListEvent.autoSearchMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
    required String pickAndPack,
    required String searchKey,
  }) = _AutoSearchMaterialList;
  const factory CovidMaterialListEvent.loadMore({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String pickAndPack,
  }) = _LoadMore;
  const factory CovidMaterialListEvent.deletedSearchMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String pickAndPack,
    required String searchKey,
  }) = _DeletedSearchMaterialList;
}
