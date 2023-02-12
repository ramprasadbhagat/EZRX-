part of 'saved_order_bloc.dart';

@freezed
class SavedOrderListState with _$SavedOrderListState {
  const SavedOrderListState._();
  const factory SavedOrderListState({
    required List<SavedOrder> savedOrders,
    required bool canLoadMore,
    required bool isFetching,
    required bool isDeleting,
    required int nextPageIndex,
    required bool isCreating,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _SavedOrderListState;

  factory SavedOrderListState.initial() => SavedOrderListState(
        savedOrders: <SavedOrder>[],
        canLoadMore: true,
        isFetching: false,
        isDeleting: false,
        nextPageIndex: 0,
        isCreating: false,
        apiFailureOrSuccessOption: none(),
      );
}
