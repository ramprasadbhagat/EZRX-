part of 'saved_order_bloc.dart';

@freezed
class SavedOrderListState with _$SavedOrderListState {
  const SavedOrderListState._();
  const factory SavedOrderListState({
    required List<SavedOrder> savedOrders,
    required bool canLoadMore,
    required bool isFetching,
    required int nextPageIndex,
    required bool isDraftOrderCreated,
    required bool isCreating,
    required SavedOrder newlyCreatedDraftOrder,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _SavedOrderListState;

  factory SavedOrderListState.initial() => SavedOrderListState(
        savedOrders: <SavedOrder>[],
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        isDraftOrderCreated: false,
        isCreating: false,
        newlyCreatedDraftOrder: SavedOrder.empty(),
        apiFailureOrSuccessOption: none(),
      );
}
