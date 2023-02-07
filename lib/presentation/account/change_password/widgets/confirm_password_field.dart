import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  final User user;
  const ConfirmPasswordTextField({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isConfirmPasswordObscure !=
              current.isConfirmPasswordObscure ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return TextFormField(
          key: const Key('confirmPasswordTextField'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) {
            context.read<ResetPasswordBloc>().add(
                  ResetPasswordEvent.onTextChange(
                    PasswordFieldType.confirmPassword,
                    text,
                    user,
                  ),
                );
          },
          obscureText: state.isConfirmPasswordObscure,
          validator: (_) {
            return state.confirmPassword.value.fold(
              (f) => f.maybeMap(
                empty: (_) => 'Confirm Password.'.tr(),
                mustMatchNewPassword: (_) => 'Password mismatch'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
          },
          decoration: InputDecoration(
            labelText: 'Confirm Password'.tr(),
            suffixIcon: IconButton(
              key: const Key('confirmPasswordToggle'),
              icon: Icon(
                state.isConfirmPasswordObscure
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: ZPColors.primary,
              ),
              onPressed: () => context.read<ResetPasswordBloc>().add(
                    ResetPasswordEvent.togglePasswordVisibility(
                      PasswordFieldType.confirmPassword,
                      !state.isConfirmPasswordObscure,
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
