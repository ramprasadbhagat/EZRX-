part of 'view_by_item_bloc.dart';

@freezed
class ViewByItemsState with _$ViewByItemsState {
  const ViewByItemsState._();
  const factory ViewByItemsState({
    required OrderHistory orderHistoryList,
    required bool canLoadMore,
    required bool isFetching,
    required bool isImageLoading,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ViewByItemsState;
  factory ViewByItemsState.initial() => ViewByItemsState(
        orderHistoryList: OrderHistory.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
        isImageLoading: false,
      );

  List<OrderHistoryItem> getFilterItem(List<StatusType> filter) {
    return List.from(orderHistoryList.orderHistoryItems)
      ..retainWhere(
        (orderHistoryItem) =>
            filter.any((e) => orderHistoryItem.status.statusContains(e)) ||
            filter.isEmpty,
      );
  }
}
