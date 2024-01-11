part of 'material_list_bloc.dart';

@freezed
class MaterialListEvent with _$MaterialListEvent {
  const factory MaterialListEvent.initialized() = _Initialized;
  const factory MaterialListEvent.watchFavoriteStatus() =
      _WatchFavoriteStatus;
  const factory MaterialListEvent.updateFavoriteStatus({
    required MaterialInfo updatedMaterial,
  }) = _UpdateFavoriteStatus;
  factory MaterialListEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required MaterialFilter selectedMaterialFilter,
    required User user,
  }) = _Fetch;

  const factory MaterialListEvent.updateSearchKey({required String searchKey}) =
      _UpdateSearchKey;

  const factory MaterialListEvent.loadMore({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
  }) = _LoadMore;

  factory MaterialListEvent.addFavourite({
    required MaterialInfo item,
  }) = _AddFavourite;

  factory MaterialListEvent.deleteFavourite({
    required MaterialInfo item,
  }) = _DeleteFavourite;
}
