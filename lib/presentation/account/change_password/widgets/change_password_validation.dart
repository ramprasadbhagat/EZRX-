import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordValidation extends StatelessWidget {
  const ResetPasswordValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (BuildContext context, ResetPasswordState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(9),
                child: Text(
                  'Password must meet the following requirements:'.tr(),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              _ConditionText(
                enableGreenTick: state.newPassword.matchMinCharacter(10),
                msgText: 'Minimum length of 10 characters'.tr(),
              ),
              _ConditionText(
                enableGreenTick:
                    state.newPassword.matchAtleastOneUpperCharacter(),
                msgText:
                    'Contain at least 1 Upper case character (A to Z)'.tr(),
              ),
              _ConditionText(
                enableGreenTick:
                    state.newPassword.matchAtleastOneLowerCharacter(),
                msgText:
                    'Contain at least 1 Lower case character (a to z)'.tr(),
              ),
              _ConditionText(
                enableGreenTick:
                    state.newPassword.matchAtleastOneNumericCharacter(),
                msgText: 'Contain at least a numeric character (0 to 9)'.tr(),
              ),
              _ConditionText(
                enableGreenTick:
                    state.newPassword.matchAtleastOneSpeacialCharacter(),
                msgText:
                    'Contain at least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )'
                        .tr(),
              ),
              _ConditionText(
                enableGreenTick:
                    state.newPassword.matchMustNotContainUserNameOrName(
                  user: context.read<UserBloc>().state.user,
                ),
                msgText:
                    'Must not contain any part of your username and/or name'
                        .tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ConditionText extends StatelessWidget {
  final bool enableGreenTick;
  final String msgText;
  const _ConditionText({
    Key? key,
    required this.msgText,
    required this.enableGreenTick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        enableGreenTick
            ? const Icon(Icons.check_circle_rounded, color: ZPColors.green)
            : const Padding(
                padding: EdgeInsets.all(9),
                child: CircleAvatar(backgroundColor: ZPColors.black, radius: 3),
              ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            msgText,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
