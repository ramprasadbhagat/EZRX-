part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderState with _$ViewByOrderState {
  const ViewByOrderState._();
  const factory ViewByOrderState({
    required ViewByOrder viewByOrderList,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ViewByOrderState;
  factory ViewByOrderState.initial() => ViewByOrderState(
        viewByOrderList: ViewByOrder.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        failureOrSuccessOption: none(),
      );
}
