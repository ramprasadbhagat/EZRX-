part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';

class _ForgetPasswordTitle extends StatelessWidget {
  const _ForgetPasswordTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.textButtonColor,
              ),
        ).tr(),
        const SizedBox(height: 15),
        const Text(
          'Let us know your Zuellig Pharma username and we`ll send you a verification email.',
        ).tr(),
      ],
    );
  }
}
