part of 'return_list_by_request_bloc.dart';

@freezed
class ReturnListByRequestState with _$ReturnListByRequestState {
  const ReturnListByRequestState._();
  const factory ReturnListByRequestState({
    required List<ReturnItem> returnItemList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isFetching,
    required bool canLoadMore,
  }) = _ReturnListByRequestState;

  factory ReturnListByRequestState.initial() => ReturnListByRequestState(
        failureOrSuccessOption: none(),
        isFetching: false,
        canLoadMore: true,
        returnItemList: <ReturnItem>[],
      );
}
