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
    User user,
  ) = _PasswordTextOnChange;

  const factory ResetPasswordEvent.resetPasswordPressed({
    required User user,
  }) = _ResetPasswordPressed;

  const factory ResetPasswordEvent.clear() = _Clear;
}

enum PasswordFieldType {
  oldPassword,
  newPassword,
  confirmPassword,
}
