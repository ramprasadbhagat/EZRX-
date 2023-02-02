part of 'return_approver_bloc.dart';

@freezed
class ReturnApproverState with _$ReturnApproverState {
  const factory ReturnApproverState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<ApproverReturnRequest> approverReturnRequests,
    required int page,
  }) = _ReturnApproverState;

  factory ReturnApproverState.initial() => ReturnApproverState(
        failureOrSuccessOption: none(),
        isFetching: false,
        approverReturnRequests: <ApproverReturnRequest>[],
        page: 1,
      );
}
