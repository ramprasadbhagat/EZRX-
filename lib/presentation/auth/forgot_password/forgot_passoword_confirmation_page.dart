import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordConfirmationPage extends StatelessWidget {
  const ForgetPasswordConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: Column(
        children: <Widget>[
          const Logo(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                _EmailSendToYou(),
                SizedBox(height: 15),
                BackToLogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailSendToYou extends StatelessWidget {
  const _EmailSendToYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email sent to you!',
          style: Theme.of(context)
              .textTheme
              .labelSmall?.copyWith(
            color: ZPColors.textButtonColor,
          ),
        ).tr(),
        const SizedBox(height: 15),
        const Text(
          'An email with instructions for resetting your password has been sent to the email address you registered with.',
        ).tr(),
      ],
    );
  }
}
