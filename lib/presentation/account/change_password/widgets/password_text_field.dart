part of '../change_password_page.dart';

class _PasswordTextField extends StatelessWidget {
  final PasswordFieldType passwordFieldType;
  final String labelText;
  final String hintText;
  final bool isPasswordVisible;
  const _PasswordTextField({
    Key? key,
    required this.passwordFieldType,
    required this.isPasswordVisible,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  String _getInitialValue(BuildContext context) {
    switch (passwordFieldType) {
      case PasswordFieldType.oldPassword:
        return context
            .read<ResetPasswordBloc>()
            .state
            .oldPassword
            .getOrDefaultValue('');

      case PasswordFieldType.newPassword:
        return context
            .read<ResetPasswordBloc>()
            .state
            .newPassword
            .getOrDefaultValue('');

      case PasswordFieldType.confirmPassword:
        return context
            .read<ResetPasswordBloc>()
            .state
            .confirmPassword
            .getOrDefaultValue('');

      default:
        return '';
    }
  }

  String? _validateForm(BuildContext context) {
    switch (passwordFieldType) {
      case PasswordFieldType.oldPassword:
        return context.read<ResetPasswordBloc>().state.oldPassword.value.fold(
              (f) => f.mapOrNull(
                empty: (_) => 'Current password cannot be empty'.tr(),
              ),
              (_) => null,
            );
      case PasswordFieldType.newPassword:
        return context.read<ResetPasswordBloc>().state.newPassword.value.fold(
              (f) => f.mapOrNull(
                empty: (_) => 'New Password Cannot be Empty.'.tr(),
                mustNotMatchOldPassword: (_) =>
                    'New password cannot be same as old password'.tr(),
              ),
              (_) => null,
            );
      case PasswordFieldType.confirmPassword:
        return context
            .read<ResetPasswordBloc>()
            .state
            .confirmPassword
            .value
            .fold(
              (f) => f.mapOrNull(
                empty: (_) => 'Confirm Password Cannot be Empty.'.tr(),
                mustMatchNewPassword: (_) => 'Password mismatch'.tr(),
              ),
              (_) => null,
            );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWithLabel(
      fieldKey: WidgetKeys.genericKey(key: _getInitialValue(context)),
      labelText: labelText.tr(),
      mandatory: true,
      initValue: _getInitialValue(context),
      obscuringCharacter: '*',
      onChanged: (text) => context.read<ResetPasswordBloc>().add(
            ResetPasswordEvent.onTextChange(
              passwordFieldType,
              text,
              context.read<UserBloc>().state.user,
            ),
          ),
      obscureText: isPasswordVisible,
      validator: (_) => _validateForm(context),
      decoration: InputDecoration(
        hintText: hintText.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: ZPColors.primary,
          ),
          onPressed: () => context.read<ResetPasswordBloc>().add(
                ResetPasswordEvent.togglePasswordVisibility(
                  passwordFieldType,
                  !isPasswordVisible,
                ),
              ),
        ),
      ),
    );
  }
}
