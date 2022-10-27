import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: BlocConsumer<LoginFormBloc, LoginFormState>(
            listenWhen: (previous, current) =>
                previous.authFailureOrSuccessOption !=
                current.authFailureOrSuccessOption,
            listener: (context, state) {
              state.authFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    final failureMessage = failure.failureMessage;
                    showSnackBar(
                      context: context,
                      message: failureMessage.tr(),
                    );
                  },
                  (_) {
                    context.read<AuthBloc>().add(const AuthEvent.authCheck());
                  },
                ),
              );
            },
            buildWhen: (previous, current) =>
                previous.showErrorMessages != current.showErrorMessages,
            builder: (context, state) {
              return Stack(
                children: [
                  Form(
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Spacer(),
                        _Logo(),
                        _SSOLoginButton(),
                        Spacer(),
                        _OrDivider(),
                        Spacer(),
                        _UsernameField(),
                        _PasswordField(),
                        _RememberPassword(),
                        Spacer(),
                        _LoginButton(),
                        Spacer(flex: 3),
                        // _VersionString(),
                      ],
                    ),
                  ),
                  const AnnouncementWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.35;

    return Image.asset(
      'assets/images/ezrxlogo.png',
      width: size,
      height: size,
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
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            key: const Key('ssoLoginButton'),
            onPressed: state.isSubmitting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<LoginFormBloc>()
                        .add(const LoginFormEvent.loginWithOktaButtonPressed());
                  },
            child: LoadingShimmer.withChild(
              enabled: state.isSubmitting,
              child: const Text('Login with SSO').tr(),
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
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(children: <Widget>[
        const Expanded(child: Divider()),
        Text('OR', style: Theme.of(context).textTheme.labelLarge),
        const Expanded(child: Divider()),
      ]),
    );
  }
}

class _UsernameField extends StatefulWidget {
  const _UsernameField({Key? key}) : super(key: key);

  @override
  State<_UsernameField> createState() => __UsernameFieldState();
}

class __UsernameFieldState extends State<_UsernameField> {
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true, //_config.appFlavor != Flavor.prod,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listenWhen: (previous, current) =>
              previous.username != current.username &&
              current.username.isValid(),
          listener: (context, state) {
            final username = state.username.getOrCrash();
            _usernameController.value = TextEditingValue(
              text: username,
              selection: TextSelection.collapsed(offset: username.length),
            );
          },
          buildWhen: (previous, current) =>
              previous.passwordVisible != current.passwordVisible ||
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return TextFormField(
              key: const Key('loginUsernameField'),
              enabled: !state.isSubmitting,
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(labelText: 'Username'.tr()),
              onChanged: (value) => context.read<LoginFormBloc>().add(
                    LoginFormEvent.usernameChanged(value),
                  ),
              validator: (_) =>
                  context.read<LoginFormBloc>().state.username.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Username cannot be empty.'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  State<_PasswordField> createState() => __PasswordFieldState();
}

class __PasswordFieldState extends State<_PasswordField> {
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true, //_config.appFlavor != Flavor.prod,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listenWhen: (previous, current) =>
              previous.password != current.password &&
              current.password.isValid(),
          listener: (context, state) {
            final password = state.password.getOrCrash();
            _passwordController.value = TextEditingValue(
              text: password,
              selection: TextSelection.collapsed(offset: password.length),
            );
          },
          buildWhen: (previous, current) =>
              previous.passwordVisible != current.passwordVisible ||
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return TextFormField(
              key: const Key('loginPasswordField'),
              enabled: !state.isSubmitting,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Password'.tr(),
                suffixIcon: IconButton(
                  icon: Icon(
                    state.passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () => context.read<LoginFormBloc>().add(
                        const LoginFormEvent.passwordVisibilityChanged(),
                      ),
                ),
              ),
              obscureText: !state.passwordVisible,
              onChanged: (value) => context.read<LoginFormBloc>().add(
                    LoginFormEvent.passwordChanged(value),
                  ),
              validator: (_) =>
                  context.read<LoginFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Password cannot be empty.'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }
}

class _RememberPassword extends StatelessWidget {
  const _RememberPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true, //_config.appFlavor != Flavor.prod,
      child: BlocBuilder<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) =>
            previous.rememberPassword != current.rememberPassword,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: <Widget>[
                Checkbox(
                  key: const Key('loginRememberPasswordCheckbox'),
                  value: state.rememberPassword,
                  onChanged: (value) {
                    FocusScope.of(context).unfocus();
                    context
                        .read<LoginFormBloc>()
                        .add(const LoginFormEvent.rememberCheckChanged());
                  },
                ),
                const Text('Remember Password').tr(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true, //_config.appFlavor != Flavor.prod,
      child: BlocBuilder<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              key: const Key('loginSubmitButton'),
              onPressed: state.isSubmitting
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      context.read<LoginFormBloc>().add(const LoginFormEvent
                          .loginWithEmailAndPasswordPressed());
                    },
              child: LoadingShimmer.withChild(
                enabled: state.isSubmitting,
                child: const Text('Login').tr(),
              ),
            ),
          );
        },
      ),
    );
  }
}
