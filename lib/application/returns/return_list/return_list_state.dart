part of 'return_list_bloc.dart';

@freezed
class ReturnListState with _$ReturnListState {
  const ReturnListState._();
  const factory ReturnListState({
    required List<ReturnItemGroup> returnItemGroupList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isFetching,
    required bool canLoadMore,
    required bool isSmallFab,
  }) = _ReturnListState;

  factory ReturnListState.initial() => ReturnListState(
        failureOrSuccessOption: none(),
        isFetching: false,
        canLoadMore: true,
        isSmallFab: false,
        returnItemGroupList: <ReturnItemGroup>[],
      );
}
