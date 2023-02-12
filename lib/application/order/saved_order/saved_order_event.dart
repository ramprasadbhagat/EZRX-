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
  const factory SavedOrderListEvent.delete({
    required SavedOrder order,
    required User user,
  }) = _Delete;
  const factory SavedOrderListEvent.createDraft({
    required ShipToInfo shipToInfo,
    required User user,
    required List<CartItem> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required AdditionalDetailsData data,
  }) = _CreateDraft;
  const factory SavedOrderListEvent.updateDraft({
    required ShipToInfo shipToInfo,
    required User user,
    required List<CartItem> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required AdditionalDetailsData data,
    required String orderId,
  }) = _UpdateDraft;
}
