import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/proxyLogin/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextEditingController _usernameController = TextEditingController();

class LoginOnBehalfPage extends StatelessWidget {
  const LoginOnBehalfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login On Behalf').tr()),
      body: SafeArea(
        child: BlocConsumer<ProxyLoginFormBloc, ProxyLoginFormState>(
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
                  context.read<UserBloc>().add(const UserEvent.fetch());
                  context.router.pop();
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
                  Spacer(),
                  UsernameField(),
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
        key: const Key('proxyLoginUsernameField'),
        controller: _usernameController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        decoration: InputDecoration(labelText: 'Username'.tr()),
        onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
              ProxyLoginFormEvent.usernameChanged(value),
            ),
        validator: (_) =>
            context.read<ProxyLoginFormBloc>().state.username.value.fold(
                  (f) => f.maybeMap(
                    empty: (_) => 'Username cannot be empty.'.tr(),
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
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
                    context.read<ProxyLoginFormBloc>().add(
                        const ProxyLoginFormEvent.loginWithADButtonPressed());
                  },
            child: const Text('Login').tr(),
          ),
        );
      },
    );
  }
}
