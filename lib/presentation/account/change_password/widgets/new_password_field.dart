import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordTextField extends StatelessWidget {
  final User user;
  const NewPasswordTextField({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isNewPasswordObscure != current.isNewPasswordObscure ||
          previous.newPassword != current.newPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            key: const Key('newPasswordTextField'),
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(
              color: ZPColors.primary,
            ),
            onChanged: (text) {
              context.read<ResetPasswordBloc>().add(
                    ResetPasswordEvent.onTextChange(
                      PasswordFieldType.newPassword,
                      text,
                      user,
                    ),
                  );
            },
            obscureText: state.isNewPasswordObscure,
            validator: (text) {
              return context
                  .read<ResetPasswordBloc>()
                  .state
                  .newPassword
                  .value
                  .fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'New Password.'.tr(),
                      subceedLength: (_) =>
                          'Minimum length of 10 characters'.tr(),
                      mustOneUpperCaseCharacter: (_) =>
                          'Contain at least 1 Upper case character (A to Z)'
                              .tr(),
                      mustOneLowerCaseCharacter: (_) =>
                          'Contain at least 1 Lower case character (a to z)'
                              .tr(),
                      mustOneNumericCharacter: (_) =>
                          'Contain at least a numeric character (0 to 9)'.tr(),
                      mustOneSpecialCharacter: (_) =>
                          'Contain at least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )'
                              .tr(),
                      mustNotContainUserName: (_) =>
                          'Must not contain any part of your username and/or name'
                              .tr(),
                      mustNotMatchOldPassword: (_) =>
                          'New password cannot be same as old one',
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
            },
            decoration: InputDecoration(
              labelText: 'New Password'.tr(),
              suffixIcon: IconButton(
                key: const Key('newPasswordToggle'),
                icon: Icon(
                  state.isNewPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: ZPColors.primary,
                ),
                onPressed: () => context.read<ResetPasswordBloc>().add(
                      ResetPasswordEvent.togglePasswordVisibility(
                        PasswordFieldType.newPassword,
                        !state.isNewPasswordObscure,
                      ),
                    ),
              ),
              isDense: true,
              errorMaxLines: 3,
              border: const UnderlineInputBorder(),
              hintStyle: const TextStyle(
                color: ZPColors.lightGray,
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        );
      },
    );
  }
}
