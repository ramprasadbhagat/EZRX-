import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    context.read<LoginFormBloc>().add(
          const LoginFormEvent.loadLastSavedCred(),
        );
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listenWhen: (previous, current) =>
              previous.authFailureOrSuccessOption !=
              current.authFailureOrSuccessOption,
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) {
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
                    children: [
                      const Logo(),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              _UsernameField(
                                controller: _usernameController,
                              ),
                              const SizedBox(height: 25),
                              _PasswordField(
                                controller: _passwordController,
                              ),
                              const _RememberPassword(),
                              const SizedBox(height: 15),
                              const _LoginButton(),
                              const SizedBox(height: 25),
                              const _OrDivider(),
                              const SizedBox(height: 25),
                              const _SSOLoginButton(),
                              const SizedBox(height: 15),
                              const _CreateAccount(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AnnouncementWidget(
                        currentPath: context.router.currentPath,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
          child: Text(
            'Create an account'.tr(),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const _UsernameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      listenWhen: (previous, current) =>
          previous.username != current.username && current.username.isValid(),
      listener: (context, state) {
        final username = state.username.getOrCrash();
        controller.value = TextEditingValue(
          text: username,
          selection: TextSelection.collapsed(
            offset: controller.selection.base.offset,
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.passwordVisible != current.passwordVisible ||
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.loginUsernameField,
          labelText: 'Username'.tr(),
          decoration: InputDecoration(
            hintText: 'Enter username'.tr(),
          ),
          controller: controller,
          validator: (text) => Username(text ?? '').value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Username cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onChanged: (value) => context.read<LoginFormBloc>().add(
                LoginFormEvent.usernameChanged(value),
              ),
          isEnabled: !state.isSubmitting,
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const _PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
      listenWhen: (previous, current) =>
          previous.password != current.password && current.password.isValid(),
      listener: (context, state) {
        final password = state.password.getOrCrash();
        controller.value = TextEditingValue(
          text: password,
          selection: TextSelection.collapsed(
            offset: controller.selection.base.offset,
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.passwordVisible != current.passwordVisible ||
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.loginPasswordField,
          labelText: 'Password'.tr(),
          controller: controller,
          validator: (text) => Password.login(text ?? '').value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Password cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onChanged: (value) => context.read<LoginFormBloc>().add(
                LoginFormEvent.passwordChanged(value),
              ),
          isEnabled: !state.isSubmitting,
          keyboardType: TextInputType.visiblePassword,
          autoCorrect: false,
          decoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 24, minHeight: 24),
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              key: WidgetKeys.loginPasswordFieldSuffixIcon,
              icon: Icon(
                state.passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 24,
              ),
              onPressed: () => context.read<LoginFormBloc>().add(
                    const LoginFormEvent.passwordVisibilityChanged(),
                  ),
            ),
            hintText: 'Enter password'.tr(),
          ),
          obscureText: !state.passwordVisible,
          onDone: (value) {
            if (!state.isSubmitting) {
              FocusScope.of(context).unfocus();
              context.read<LoginFormBloc>().add(
                    const LoginFormEvent.loginWithEmailAndPasswordPressed(),
                  );
            }
          },
        );
      },
    );
  }
}

class _RememberPassword extends StatelessWidget {
  const _RememberPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.rememberPassword != current.rememberPassword,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  key: WidgetKeys.loginRememberPasswordCheckbox,
                  value: state.rememberPassword,
                  onChanged: (value) {
                    FocusScope.of(context).unfocus();
                    context.read<LoginFormBloc>().add(
                          const LoginFormEvent.rememberCheckChanged(),
                        );
                  },
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 2.0,
                      color: ZPColors.lightGray2,
                    ),
                  ),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                ),
                const SizedBox(width: 5),
                Text(
                  'Remember me'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            TextButton(
              child: Text(
                'Forgot password?'.tr(),
              ),
              onPressed: () {
                context.read<ForgotPasswordBloc>().add(
                      const ForgotPasswordEvent.initialized(),
                    );
                context.router.pushNamed('forgot_password');
              },
            ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: WidgetKeys.loginSubmitButton,
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<LoginFormBloc>().add(
                        const LoginFormEvent.loginWithEmailAndPasswordPressed(),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Log in').tr(),
          ),
        );
      },
    );
  }
}
