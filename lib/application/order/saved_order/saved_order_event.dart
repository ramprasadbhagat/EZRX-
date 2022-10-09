part of 'saved_order_bloc.dart';

@freezed
class SavedOrderListEvent with _$SavedOrderListEvent {
  const factory SavedOrderListEvent.initialized() = _Initialized;
  const factory SavedOrderListEvent.fetch({
    required User userInfo,
    required SalesOrganisation selectedSalesOrganisation,
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
  }) = _Fetch;
  const factory SavedOrderListEvent.loadMore({
    required User userInfo,
    required SalesOrganisation selectedSalesOrganisation,
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
  }) = _LoadMore;
}
