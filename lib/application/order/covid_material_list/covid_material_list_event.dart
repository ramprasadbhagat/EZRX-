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
  }) = _Fetch;

  const factory CovidMaterialListEvent.updateSearchKey(String searchKey) =
      _UpdateSearchKey;

  const factory CovidMaterialListEvent.loadMore({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _LoadMore;
}
