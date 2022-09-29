part of 'saved_order_bloc.dart';

@freezed
class SavedOrderListState with _$SavedOrderListState {
  const SavedOrderListState._();
  const factory SavedOrderListState({
    required List<SavedOrder> savedOrders,
    required bool canLoadingMore,
    required bool isFetching,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _SavedOrderListState;

  factory SavedOrderListState.initial() => SavedOrderListState(
        savedOrders: <SavedOrder>[],
        canLoadingMore: true,
        isFetching: false,
        nextPageIndex: 0,
        apiFailureOrSuccessOption: none(),
      );
}
