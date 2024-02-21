import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  final PasswordFieldType passwordFieldType;
  final String labelText;
  final String hintText;
  final bool isPasswordVisible;
  final String? emptyErrorText;
  const PasswordTextField({
    Key? key,
    required this.passwordFieldType,
    required this.isPasswordVisible,
    required this.labelText,
    required this.hintText,
    this.emptyErrorText,
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
                empty: (_) => context.tr('New password cannot be empty.'),
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
                empty: (_) => context.tr('Confirm password cannot be empty.'),
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
              context.read<EligibilityBloc>().state.user,
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
            key: WidgetKeys.obscureIcon(isPasswordVisible),
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
