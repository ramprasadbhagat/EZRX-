import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
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
                    showSnackBar(
                      context: context,
                      message: failure.map(
                        other: (other) => other.message,
                        serverError: (_) => 'Server Error',
                        invalidEmailAndPasswordCombination: (_) =>
                            'Wrong Username and/or Password!',
                        accountLocked: (_) => 'Account is Locked',
                        accountExpired: (_) => 'Account is Expired',
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
                  children: const [
                    Spacer(),
                    Logo(),
                    OktaLoginButton(),
                    Spacer(),
                    Divider(),
                    Spacer(),
                    UsernameField(),
                    PasswordField(),
                    RememberPassword(),
                    Spacer(),
                    LoginButton(),
                    Spacer(),
                    Spacer(flex: 3),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: const InputDecoration(labelText: 'Username'),
        onChanged: (value) => context.read<LoginFormBloc>().add(
              LoginFormEvent.usernameChanged(value),
            ),
        validator: (_) =>
            context.read<LoginFormBloc>().state.username.value.fold(
                  (f) => f.maybeMap(
                    empty: (_) => 'Username cannot be empty',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: BlocBuilder<LoginFormBloc, LoginFormState>(
        buildWhen: (previous, current) =>
            previous.passwordVisible != current.passwordVisible ||
            previous.isSubmitting != current.isSubmitting,
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: 'Password',
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
                        empty: (_) => 'Password cannot be empty',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
          );
        },
      ),
    );
  }
}

class RememberPassword extends StatelessWidget {
  const RememberPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.rememberPassword != current.rememberPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: state.rememberPassword,
                onChanged: (value) {
                  FocusScope.of(context).unfocus();
                  context
                      .read<LoginFormBloc>()
                      .add(const LoginFormEvent.rememberCheckChanged());
                },
              ),
              const Text('Remember Password')
            ],
          ),
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: state.isSubmitting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    context.read<LoginFormBloc>().add(const LoginFormEvent
                        .loginWithEmailAndPasswordPressed());
                  },
            child: const Text('Login'),
          ),
        );
      },
    );
  }
}

class OktaLoginButton extends StatelessWidget {
  const OktaLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: state.isSubmitting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<LoginFormBloc>()
                        .add(const LoginFormEvent.loginWithOktaButtonPressed());
                  },
            child: const Text('Login with SSO'),
          ),
        );
      },
    );
  }
}
