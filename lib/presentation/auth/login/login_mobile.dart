import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/auth/login/common/announcement.dart';
import 'package:ezrxmobile/presentation/auth/login/common/anouncement_banner.dart';
import 'package:ezrxmobile/presentation/auth/login/common/exrx_apl_logo.dart';
import 'package:ezrxmobile/presentation/auth/login/common/login_button.dart';
import 'package:ezrxmobile/presentation/auth/login/common/market_selector.dart';
import 'package:ezrxmobile/presentation/auth/login/common/password_field.dart';
import 'package:ezrxmobile/presentation/auth/login/common/remember_password.dart';
import 'package:ezrxmobile/presentation/auth/login/common/username_field.dart';
import 'package:ezrxmobile/presentation/core/chatbot/chatbot_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/or_divider.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginMobile extends StatelessWidget {
  final LoginFormState state;
  const LoginMobile({
    Key? key,
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
              const Logo(
                title: 'Log in',
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    const AnnouncementBannerWidget(),
                    const MarketSelector(),
                    const SizedBox(height: 15),
                    const UsernameField(),
                    const SizedBox(height: 25),
                    const PasswordField(),
                    const RememberPassword(),
                    const SizedBox(height: 15),
                    const LoginButton(),
                    const SizedBox(height: 25),
                    if (!state.currentMarket.isSSOLoginRestricted) ...[
                      const OrDivider(),
                      const SizedBox(height: 25),
                      const _SSOLoginButton(),
                    ],
                    if (!state.currentMarket.isRegistrationRestricted) ...[
                      const SizedBox(height: 15),
                      const _CreateAccount(),
                    ],
                    if (state.currentMarket.isID) ...[
                      const SizedBox(height: 15),
                      const EzrxAplLogo(),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        const Announcement(),
        const ChatBotWidget(),
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              key: WidgetKeys.ssoLoginButton,
              onPressed: state.isSubmitting
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      context.read<LoginFormBloc>().add(
                            const LoginFormEvent.loginWithOktaButtonPressed(),
                          );
                    },
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: const MaterialStatePropertyAll(
                      ZPColors.accentColor,
                    ),
                    shape: const MaterialStatePropertyAll(
                      StadiumBorder(),
                    ),
                  ),
              icon: Icon(
                Icons.lock_person_outlined,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
              label: LoadingShimmer.withChild(
                enabled: state.isSubmitting,
                child: Text(
                  context.tr('Log in with SSO'),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.shadesBlack,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
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
          context.tr('Don’t have an account yet?'),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(
          key: WidgetKeys.createAccountButton,
          style: Theme.of(context).textButtonTheme.style?.copyWith(
                minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.only(left: 3),
                ),
              ),
          child: Text(
            context.tr('Sign up'),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          onPressed: () {
            context.router.push(
              WebViewPageRoute(
                url: locator<Config>().createAccountUrl,
                titleText: context.tr('Sign Up'),
              ),
            );
          },
        ),
      ],
    );
  }
}
