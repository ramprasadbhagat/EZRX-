import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
final _config = locator<Config>();

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
                    showSnackBar(
                      context: context,
                      message: tr(
                        failure.map(
                          other: (other) => other.message,
                          serverError: (_) => 'Server Error',
                          invalidEmailAndPasswordCombination: (_) =>
                              'Incorrect username and/or password.',
                          accountLocked: (_) => 'Account is Locked',
                          accountExpired: (_) => 'Account is Expired',
                          tokenExpired: (_) => 'Session token is Expired',
                        ),
                      ),
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
              return Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Logo(),
                    Spacer(
                      flex: _config.appFlavor != Flavor.prod ? 1 : 3,
                    ),
                    const SSOLoginButton(),
                    const Spacer(),
                    const Divider(),
                    const Spacer(),
                    const UsernameField(),
                    const PasswordField(),
                    const RememberPassword(),
                    const Spacer(),
                    const LoginButton(),
                    const Spacer(),
                    const Spacer(flex: 3),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

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

class UsernameField extends StatelessWidget {
  const UsernameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _config.appFlavor != Flavor.prod,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listenWhen: (previous, current) =>
              previous.username != current.username,
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
}

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _config.appFlavor != Flavor.prod,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listenWhen: (previous, current) =>
              previous.password != current.password,
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
}

class RememberPassword extends StatelessWidget {
  const RememberPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _config.appFlavor != Flavor.prod,
      child: BlocBuilder<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) =>
            previous.rememberPassword != current.rememberPassword,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
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
                const Text('Remember Password').tr()
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _config.appFlavor != Flavor.prod,
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

class SSOLoginButton extends StatelessWidget {
  const SSOLoginButton({Key? key}) : super(key: key);

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

// class VersionString extends StatelessWidget {
//   const VersionString({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future:
//           locator<PackageInfoService>().getString(), // a Future<String> or null
//       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//             return const Text('Press button to start');
//           case ConnectionState.waiting:
//             return const Text('Awaiting result...');
//           default:
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return Text('Result: ${snapshot.data}');
//             }
//         }
//       },
//     );
//   }
// }
