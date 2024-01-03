part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsEvent with _$ViewByItemDetailsEvent {
  const factory ViewByItemDetailsEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
  }) = _Initialized;

  const factory ViewByItemDetailsEvent.fetchZyllemStatus({
    required StringValue invoiceNumber,
  }) = _FetchZyllemStatus;

  const factory ViewByItemDetailsEvent.updateIsExpanded({
    required bool isExpanded,
  }) = _updateIsExpanded;

  const factory ViewByItemDetailsEvent.setItemOrderDetails({
    required OrderHistory orderHistory,
    required OrderHistoryItem orderHistoryItem,
    required bool disableDeliveryDateForZyllemStatus,
  }) = _SetItemOrderDetails;

  const factory ViewByItemDetailsEvent.searchOrderHistory({
    required SearchKey searchKey,
  }) = _SearchOrderHistory;

  const factory ViewByItemDetailsEvent.fetchOrdersInvoiceData({
    required List<OrderHistoryItem> orderHistoryItems,
  }) = _FetchOrdersInvoiceData;
  const factory ViewByItemDetailsEvent.fetchOrderHistoryDetails({
    required SearchKey searchKey,
  }) = _FetchOrderHistoryDetails;
}
