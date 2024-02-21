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

  const factory ResetPasswordEvent.changePassword({
    required User user,
  }) = _ChangePassword;

const factory ResetPasswordEvent.clear() = _Clear;

const factory ResetPasswordEvent.addResetPasswordCred({
    required ResetPasswordCred resetPasswordCred,
}) = _AddResetPasswordCred;

const factory ResetPasswordEvent.resetPassword() = _ResetPasswords;

}

enum PasswordFieldType {
  oldPassword,
  newPassword,
  confirmPassword,
}
