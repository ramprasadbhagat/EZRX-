part of 'material_list_bloc.dart';

@freezed
class MaterialListEvent with _$MaterialListEvent {
  const factory MaterialListEvent.initialized() = _Initialized;
  const factory MaterialListEvent.fetch({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
  }) = _Fetch;
  const factory MaterialListEvent.updateSearchKey({required String searchKey}) =
      _UpdateSearchKey;
  const factory MaterialListEvent.loadMore({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
  }) = _LoadMore;
}
