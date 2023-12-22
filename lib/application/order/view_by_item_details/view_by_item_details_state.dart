part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsState with _$ViewByItemDetailsState {
  const ViewByItemDetailsState._();

  const factory ViewByItemDetailsState({
    required OrderHistory orderHistory,
    required OrderHistoryItem orderHistoryItem,
    required List<OrderStatusTracker> orderHistoryStatuses,
    required bool isLoading,
    required bool isExpanded,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ViewByItemDetailsState;

  factory ViewByItemDetailsState.initial() => ViewByItemDetailsState(
        orderHistory: OrderHistory.empty(),
        orderHistoryItem: OrderHistoryItem.empty(),
        orderHistoryStatuses: <OrderStatusTracker>[],
        failureOrSuccessOption: none(),
        isLoading: false,
        isExpanded: false,
      );

  List<PoDocuments> get poDocumentsList => isExpanded
      ? orderHistoryItem.orderHistoryItemPoAttachments
      : [orderHistoryItem.orderHistoryItemPoAttachments.first];

  bool get displayShowMoreOrLess =>
      orderHistoryItem.orderHistoryItemPoAttachments.length > 1;

  List<OrderHistoryItem> get unSelectedItems => orderHistory.orderHistoryItems
      .where(
        (element) => element.hashCode != orderHistoryItem.hashCode,
      )
      .toList();
}
