part of 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';

class _ResetPasswordValidation extends StatelessWidget {
  const _ResetPasswordValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword ||
          previous.showErrorMessages != current.showErrorMessages,
      builder: (BuildContext context, ResetPasswordState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                context.tr('Your new password should have :'),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchMinCharacter,
              msgText: 'Minimum length of 10 characters',
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchAtLeastOneUpperCharacter,
              msgText: 'Contain at least 1 Upper case character (A to Z)',
            ),
            _ConditionText(
              enableGreenTick: state.newPassword.matchAtLeastOneLowerCharacter,
              msgText: 'Contain at least 1 Lower case character (a to z)',
            ),
            _ConditionText(
              enableGreenTick:
                  state.newPassword.matchAtLeastOneNumericCharacter,
              msgText: 'Contain at least a numeric character (0 to 9)',
            ),
            _ConditionText(
              enableGreenTick:
                  state.newPassword.matchAtLeastOneSpecialCharacter,
              msgText:
                  'At least one special character from the list (i.e. _ , # , ? , ! , @ , \$ , % , ^ , & , *, - )',
            ),
            _ConditionText(
              enableGreenTick: state
                  .newPasswordMustNotContainTwoConsecutiveCharsOfUserNameOrName(
                user: context.read<EligibilityBloc>().state.user,
              ),
              msgText:
                  'New password cannot contain more than 2 consecutive characters from username and/or name of the user',
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
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 2),
      child: Row(
        children: [
          enableGreenTick
              ? const Icon(
                  Icons.check,
                  color: ZPColors.green,
                  size: 15,
                )
              : Icon(
                  Icons.circle,
                  color: context
                              .read<ResetPasswordBloc>()
                              .state
                              .showErrorMessages &&
                          !enableGreenTick
                      ? ZPColors.red
                      : ZPColors.passwordValidationsColor,
                  size: 5,
                ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              context.tr(msgText),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: context
                                .read<ResetPasswordBloc>()
                                .state
                                .showErrorMessages &&
                            !enableGreenTick
                        ? ZPColors.red
                        : ZPColors.passwordValidationsColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
