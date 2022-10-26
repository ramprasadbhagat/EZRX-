part of 'order_history_list_bloc.dart';

@freezed
class OrderHistoryListEvent with _$OrderHistoryListEvent {
  const factory OrderHistoryListEvent.initialized() = _Initialized;
  const factory OrderHistoryListEvent.fetch({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required OrderHistoryFilter orderHistoryFilter,
  }) = _Fetch;
  const factory OrderHistoryListEvent.loadMore({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required OrderHistoryFilter orderHistoryFilter,
    
  }) = _LoadMore;
}
