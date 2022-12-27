part of 'approver_bloc.dart';

@freezed
class ApproverState with _$ApproverState {
  const ApproverState._();

  const factory ApproverState({
    required bool isApprover,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _ApproverState;

  factory ApproverState.initial() => ApproverState(
    isApprover: false,
    apiFailureOrSuccessOption: none(),
  );
}
