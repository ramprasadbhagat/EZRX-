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
    @Default('') String searchKey,
  }) = _Fetch;
  const factory ViewByOrderEvent.loadMore({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
  }) = _LoadMore;

  const factory ViewByOrderEvent.searchByOrder({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
    required ViewByOrderHistoryFilter filter,
    required String searchKey,
  }) = _SearchByOrder;
}
