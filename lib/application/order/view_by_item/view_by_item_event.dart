part of 'view_by_item_bloc.dart';

@freezed
class ViewByItemsEvent with _$ViewByItemsEvent {
  const factory ViewByItemsEvent.initialized() = _Initialized;
  const factory ViewByItemsEvent.fetch({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required ViewByItemHistoryFilter viewByItemHistoryFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory ViewByItemsEvent.loadMore({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
  }) = _LoadMore;
  const factory ViewByItemsEvent.fetchProductImage() = _FetchProductImage;
}
