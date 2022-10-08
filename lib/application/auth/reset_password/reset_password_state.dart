part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required bool isOldPasswordObscure,
    required bool isNewPasswordObscure,
    required bool isConfirmPasswordObscure,
    required Password oldPassword,
    required Password newPassword,
    required Password confirmPassword,
    required bool isSubmitting,
    required Option<Either<ApiFailure, ResetPassword>>
        passwordResetFailureOrSuccessOption,
    required bool showErrorMessages,
  }) = _ResetPassword;

  factory ResetPasswordState.initial() => ResetPasswordState(
        oldPassword: Password.login(''),
        newPassword: Password.resetV2('', '', User.empty()),
        confirmPassword: Password.comfirm('', ''),
        passwordResetFailureOrSuccessOption: none(),
        isOldPasswordObscure: true,
        isNewPasswordObscure: true,
        isConfirmPasswordObscure: true,
        isSubmitting: false,
        showErrorMessages: false,
      );
}
