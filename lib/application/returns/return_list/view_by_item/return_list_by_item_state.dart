part of 'return_list_by_item_bloc.dart';

@freezed
class ReturnListByItemState with _$ReturnListByItemState {
  const ReturnListByItemState._();
  const factory ReturnListByItemState({
    required List<ReturnItem> returnItemList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isFetching,
    required bool canLoadMore,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) = _ReturnListByItemState;

  factory ReturnListByItemState.initial() => ReturnListByItemState(
        failureOrSuccessOption: none(),
        isFetching: false,
        canLoadMore: true,
        returnItemList: <ReturnItem>[],
        appliedFilter: ReturnFilter.empty(),
        searchKey: SearchKey.searchFilter(''),
      );
}
