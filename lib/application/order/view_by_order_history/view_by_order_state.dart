part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderHistoryState with _$ViewByOrderHistoryState {
  const ViewByOrderHistoryState._();
  const factory ViewByOrderHistoryState({
    required ViewByOrderHistory viewByOrderHistoryList,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ViewByOrderHistoryState;
  factory ViewByOrderHistoryState.initial() => ViewByOrderHistoryState(
        viewByOrderHistoryList: ViewByOrderHistory.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
      );
}
