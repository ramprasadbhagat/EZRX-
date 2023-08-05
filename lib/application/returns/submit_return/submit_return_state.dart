part of 'submit_return_bloc.dart';

@freezed
class SubmitReturnState with _$SubmitReturnState {
  const factory SubmitReturnState({
    required String requestID,
    required String messages,
    required bool isSubmitting,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _SubmitReturnState;

  factory SubmitReturnState.initial() => SubmitReturnState(
        messages: '',
        requestID: '',
        isSubmitting: false,
        failureOrSuccessOption: none(),
      );
}
