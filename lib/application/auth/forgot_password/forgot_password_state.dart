part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required Username username,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>>
        resetPasswordFailureOrSuccessOption,
    required ForgotPassword resetPasswordResponse,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() => ForgotPasswordState(
        username: Username(''),
        isSubmitting: false,
        showErrorMessages: false,
        resetPasswordFailureOrSuccessOption: none(),
        resetPasswordResponse: ForgotPassword.empty(),
      );
}
