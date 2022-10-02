part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.togglePasswordVisibility(
    PasswordFieldType fieldType,
    bool toggleValue,
  ) = _PasswordVisibility;

  const factory ResetPasswordEvent.onTextChange(
    PasswordFieldType fieldType,
    String newValue,
  ) = _PasswordTextOnChange;

  const factory ResetPasswordEvent.resetPasswordPressed() =
      _ResetPasswordPressed;

  const factory ResetPasswordEvent.onRestart() = _OnRestart;
}

enum PasswordFieldType {
  oldPassword,
  newPassword,
  confirmPassword,
}
