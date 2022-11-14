part of 'material_list_bloc.dart';

@freezed
class MaterialListEvent with _$MaterialListEvent {
  const factory MaterialListEvent.initialized() = _Initialized;
  factory MaterialListEvent.fetch({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
    required OrderDocumentType orderDocumentType,
    required String pickAndPack,
  }) = _Fetch;

  const factory MaterialListEvent.searchMaterialList({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
    required String pickAndPack,
  }) = _SearchMagerialList;
  const factory MaterialListEvent.updateSearchKey({required String searchKey}) =
      _UpdateSearchKey;
  const factory MaterialListEvent.loadMore({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
    required OrderDocumentType orderDocumentType,
    required String pickAndPack,
  }) = _LoadMore;
}
