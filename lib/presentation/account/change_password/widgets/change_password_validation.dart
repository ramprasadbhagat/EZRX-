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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Password must meet the following requirements:'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchMinCharacter,
              msgText: 'Minimum length of 10 characters'.tr(),
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchAtLeastOneUpperCharacter,
              msgText: 'Contain at least 1 Upper case character (A to Z)'.tr(),
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchAtLeastOneLowerCharacter,
              msgText: 'Contain at least 1 Lower case character (a to z)'.tr(),
            ),
            _ConditionText(
              enableGreenTick:
                  state.newPassword.matchAtLeastOneNumericCharacter,
              msgText: 'Contain at least a numeric character (0 to 9)'.tr(),
            ),
            _ConditionText(
              enableGreenTick:
                  state.newPassword.matchAtLeastOneSpecialCharacter,
              msgText:
                  'Contain at least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )'
                      .tr(),
            ),
            _ConditionText(
              enableGreenTick: state.newPasswordMustNotContainUserNameOrName(
                user: context.read<UserBloc>().state.user,
              ),
              msgText:
                  'Must not contain any part of your username and/or name'.tr(),
            ),
          ],
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
            ? const Icon(
                Icons.check_circle_rounded,
                color: ZPColors.green,
                size: 15,
              )
            : const Icon(
                Icons.circle_outlined,
                color: ZPColors.black,
                size: 15,
              ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            msgText,
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.darkGray,
                ),
          ),
        ),
      ],
    );
  }
}
