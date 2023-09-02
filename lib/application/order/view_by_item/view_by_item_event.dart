part of 'view_by_item_bloc.dart';

@freezed
class ViewByItemsEvent with _$ViewByItemsEvent {
  const factory ViewByItemsEvent.initialized() = _Initialized;
  const factory ViewByItemsEvent.fetch({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;
  const factory ViewByItemsEvent.autoSearchProduct({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) = _AutoSearchProduct;
  const factory ViewByItemsEvent.loadMore({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
  }) = _LoadMore;
  const factory ViewByItemsEvent.fetchProductImage() = _FetchProductImage;
}
