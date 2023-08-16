part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderEvent with _$ViewByOrderEvent {
  const factory ViewByOrderEvent.initialized() = _Initialized;
  const factory ViewByOrderEvent.fetch({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
    required ViewByOrderHistoryFilter filter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory ViewByOrderEvent.autoSearchProduct({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
    required ViewByOrderHistoryFilter filter,
    required SearchKey searchKey,
  }) = _AutoSearchProduct;
  const factory ViewByOrderEvent.loadMore({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
  }) = _LoadMore;

}
