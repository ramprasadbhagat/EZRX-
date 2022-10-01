part of 'order_history_list_bloc.dart';

@freezed
class OrderHistoryListState with _$OrderHistoryListState {
  const factory OrderHistoryListState({
    required List<OrderHistory> orderHistoryList,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _OrderHistoryListState;
  factory OrderHistoryListState.initial() => OrderHistoryListState(
        orderHistoryList: <OrderHistory>[],
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
      );
}
