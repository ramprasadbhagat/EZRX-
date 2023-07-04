part of 'material_list_bloc.dart';

@freezed
class MaterialListEvent with _$MaterialListEvent {
  const factory MaterialListEvent.initialized() = _Initialized;
  factory MaterialListEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
  }) = _Fetch;
 
  const factory MaterialListEvent.updateSearchKey({required String searchKey}) =
      _UpdateSearchKey;
 
  const factory MaterialListEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
  }) = _LoadMore;

  factory MaterialListEvent.addFavourite({
    required MaterialInfo item,
  }) = _AddFavourite;

  factory MaterialListEvent.deleteFavourite({
    required MaterialInfo item,
  }) = _DeleteFavourite;

  factory MaterialListEvent.updateSelectedMaterialFilter({
    required MaterialFilter selectedMaterialFilter,
}) = _updateSelectedMaterialFilter;

}
