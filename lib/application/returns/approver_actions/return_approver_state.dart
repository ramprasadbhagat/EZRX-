part of 'return_approver_bloc.dart';

@freezed
class ReturnApproverState with _$ReturnApproverState {
  const factory ReturnApproverState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<RequestInformation> approverReturnRequestList,
    required int nextPageIndex,
    required bool canLoadMore,
  }) = _ReturnApproverState;

  factory ReturnApproverState.initial() => ReturnApproverState(
        failureOrSuccessOption: none(),
        isFetching: false,
        approverReturnRequestList: <RequestInformation>[],
        nextPageIndex: 0,
        canLoadMore: true,
      );
}
