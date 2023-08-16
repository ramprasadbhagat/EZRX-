part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderState with _$ViewByOrderState {
  const ViewByOrderState._();
  const factory ViewByOrderState({
    required ViewByOrder viewByOrderList,
    required bool canLoadMore,
    required bool isFetching,
    required SearchKey searchKey,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ViewByOrderHistoryFilter appliedFilter,
  }) = _ViewByOrderState;
  factory ViewByOrderState.initial() => ViewByOrderState(
        viewByOrderList: ViewByOrder.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        searchKey: SearchKey.searchFilter(''),
        failureOrSuccessOption: none(),
        appliedFilter: ViewByOrderHistoryFilter.empty(),
      );
}
