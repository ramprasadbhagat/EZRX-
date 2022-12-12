part of 'order_history_list_bloc.dart';

@freezed
class OrderHistoryListState with _$OrderHistoryListState {
  const OrderHistoryListState._();
  const factory OrderHistoryListState({
    required OrderHistory orderHistoryList,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _OrderHistoryListState;
  factory OrderHistoryListState.initial() => OrderHistoryListState(
        orderHistoryList: OrderHistory.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
      );

  List<OrderHistoryItem> getFilterItem(List<String> filter) {
    return List.from(orderHistoryList.orderHistoryItems)
      ..retainWhere(
        (orderHistoryItem) =>
            filter.any((e) => orderHistoryItem.status.contains(e)) ||
            filter.isEmpty,
      );
  }
}
