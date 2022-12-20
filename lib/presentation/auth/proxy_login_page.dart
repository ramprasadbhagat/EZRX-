import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginOnBehalfPage extends StatelessWidget {
  const LoginOnBehalfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login on behalf').tr()),
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
                  final failureMessage = failure.failureMessage;
                  showSnackBar(context: context, message: failureMessage.tr());
                },
                (_) {
                  context
                      .read<SalesOrgBloc>()
                      .add(const SalesOrgEvent.initialized());
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

class UsernameField extends StatefulWidget {
  const UsernameField({Key? key}) : super(key: key);

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: TextFormField(
            key: const Key('proxyLoginUsernameField'),
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(labelText: 'Username'.tr()),
            onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
                  ProxyLoginFormEvent.usernameChanged(value),
                ),
            validator: (_) => state.username.value.fold(
              (f) => f.maybeMap(
                empty: (_) => 'Username cannot be empty.'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            ),
            onFieldSubmitted: (value) {
              if (!state.isSubmitting) {
                FocusScope.of(context).unfocus();
                context.read<ProxyLoginFormBloc>().add(
                      const ProxyLoginFormEvent.loginWithADButtonPressed(),
                    );
              }
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
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
            key: const Key('proxyLoginSubmitButton'),
            onPressed: state.isSubmitting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    context.read<ProxyLoginFormBloc>().add(
                          const ProxyLoginFormEvent.loginWithADButtonPressed(),
                        );
                  },
            child: const Text('Login').tr(),
          ),
        );
      },
    );
  }
}
