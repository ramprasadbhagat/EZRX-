import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/auth/login/common/announcement.dart';
import 'package:ezrxmobile/presentation/auth/login/common/login_button.dart';
import 'package:ezrxmobile/presentation/auth/login/common/market_selector.dart';
import 'package:ezrxmobile/presentation/auth/login/common/password_field.dart';
import 'package:ezrxmobile/presentation/auth/login/common/remember_password.dart';
import 'package:ezrxmobile/presentation/auth/login/common/username_field.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginMobile extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final LoginFormState state;
  const LoginMobile({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    const MarketSelector(),
                    const SizedBox(height: 15),
                    UsernameField(
                      controller: usernameController,
                    ),
                    const SizedBox(height: 25),
                    PasswordField(
                      controller: passwordController,
                    ),
                    const RememberPassword(),
                    const SizedBox(height: 15),
                    const LoginButton(),
                    const SizedBox(height: 25),
                    const _OrDivider(),
                    const SizedBox(height: 25),
                    const _SSOLoginButton(),
                    const SizedBox(height: 15),
                    const _CreateAccount(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Announcement(),
      ],
    );
  }
}

class _SSOLoginButton extends StatelessWidget {
  const _SSOLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: WidgetKeys.ssoLoginButton,
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context
                      .read<LoginFormBloc>()
                      .add(const LoginFormEvent.loginWithOktaButtonPressed());
                },
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                  ZPColors.accentColor,
                ),
                shape: const MaterialStatePropertyAll(
                  StadiumBorder(),
                ),
              ),
          child: IntrinsicWidth(
            child: LoadingShimmer.withChild(
              enabled: state.isSubmitting,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lock_person_outlined,
                    size: 20,
                    color: ZPColors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Log in with SSO'.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(
        child: Divider(
          indent: 0,
          thickness: 0.5,
        ),
      ),
      Text(
        'or',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ZPColors.dividerColor,
            ),
      ),
      const Expanded(
        child: Divider(
          endIndent: 0,
          thickness: 0.5,
        ),
      ),
    ]);
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don’t have an account yet?'.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 8.0,
        ),
        TextButton(
          key: WidgetKeys.createAccountButton,
          child: Text(
            'Create an account'.tr(),
          ),
          onPressed: () {
            context.router.push(
              WebViewPageRoute(
                url: locator<Config>().createAccountUrl,
                titleText: 'Create Account',
              ),
            );
          },
        ),
      ],
    );
  }
}
