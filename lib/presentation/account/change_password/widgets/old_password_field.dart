import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OldPasswordTextField extends StatelessWidget {
  final User user;
  const OldPasswordTextField({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) => 
        previous.isOldPasswordObscure != current.isOldPasswordObscure ||
        previous.oldPassword != current.oldPassword ,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: TextFormField(
            key: const Key('oldPasswordTextField'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(
              color: ZPColors.primary,
            ),
            onChanged: (text) {
              context.read<ResetPasswordBloc>().add(
                    ResetPasswordEvent.onTextChange(
                      PasswordFieldType.oldPassword,
                      text,
                      user,
                    ),
                  );
            },
            obscureText: state.isOldPasswordObscure,
            validator: (text) {
              return context
                  .read<ResetPasswordBloc>()
                  .state
                  .oldPassword
                  .value
                  .fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Enter Old Password.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
            },
            decoration: InputDecoration(
              labelText: 'Old Password'.tr(),
              suffixIcon: IconButton(
                key: const Key('oldPasswordToggle'),
                icon: Icon(
                  state.isOldPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: ZPColors.primary,
                ),
                onPressed: () {
                  context.read<ResetPasswordBloc>().add(
                        ResetPasswordEvent.togglePasswordVisibility(
                          PasswordFieldType.oldPassword,
                          !state.isOldPasswordObscure,
                        ),
                      );
                },
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
