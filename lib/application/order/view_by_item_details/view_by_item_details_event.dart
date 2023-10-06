part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsEvent with _$ViewByItemDetailsEvent {
  const factory ViewByItemDetailsEvent.initialized() = _Initialized;
  const factory ViewByItemDetailsEvent.fetch({
    required User user,
    required CustomerCodeInfo soldTo,
    required SalesOrganisation salesOrganisation,
    required OrderNumber orderNumber,
    required MaterialNumber materialNumber,
    required bool disableDeliveryDateForZyllemStatus,
  }) = _Fetch;
  const factory ViewByItemDetailsEvent.fetchZyllemStatus() = _FetchZyllemStatus;
  const factory ViewByItemDetailsEvent.updateIsExpanded({
    required bool isExpanded,
  }) = _updateIsExpanded;
  const factory ViewByItemDetailsEvent.setItemOrderDetails({
    required OrderHistory viewByItems,
    required OrderHistoryItem orderHistoryItem,
    required bool disableDeliveryDateForZyllemStatus,
  }) = _SetItemOrderDetails;
}
