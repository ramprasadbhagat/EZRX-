part of 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';

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
                empty: (_) => context.tr('Current password cannot be empty'),
              ),
              (_) => null,
            );
      case PasswordFieldType.newPassword:
        return context.read<ResetPasswordBloc>().state.newPassword.value.fold(
              (f) => f.mapOrNull(
                empty: (_) => context.tr('New Password Cannot be Empty.'),
                mustNotMatchOldPassword: (_) =>
                    context.tr('New password cannot be same as old password'),
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
                empty: (_) => context.tr('Confirm Password Cannot be Empty.'),
                mustMatchNewPassword: (_) => context.tr('Password mismatch'),
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
      labelText: context.tr(labelText),
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
        hintText: tr(hintText),
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
