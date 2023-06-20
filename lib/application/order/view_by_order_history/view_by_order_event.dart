part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderHistoryEvent with _$ViewByOrderHistoryEvent {
  const factory ViewByOrderHistoryEvent.initialized() = _Initialized;
  const factory ViewByOrderHistoryEvent.fetch({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
    required ViewByOrderHistoryFilter viewByOrderHistoryFilter,
  }) = _Fetch;
  const factory ViewByOrderHistoryEvent.loadMore({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
    required ViewByOrderHistoryFilter viewByOrderHistoryFilter,
  }) = _LoadMore;
}
