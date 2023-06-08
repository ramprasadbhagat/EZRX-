import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                        const _Logo(),
                        const SizedBox(height: 24),
                        Expanded(
                          child: SingleChildScrollView(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                _UsernameField(
                                  controller: _usernameController,
                                ),
                                const SizedBox(height: 15),
                                _PasswordField(
                                  controller: _passwordController,
                                ),
                                const SizedBox(height: 15),
                                const _RememberPassword(),
                                const SizedBox(height: 30),
                                const _LoginButton(),
                                const SizedBox(height: 24),
                                const _OrDivider(),
                                const SizedBox(height: 24),
                                const _SSOLoginButton(),
                                const SizedBox(height: 32),
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
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ZPColors.dDPrimary10,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/ezrx+logo.svg',
              height: 40,
              width: 120,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 8,
            ),
            const VerticalDivider(
              width: 0,
              color: ZPColors.dDNeutrals40,
              indent: 8,
              thickness: 1,
              endIndent: 8,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Log in'.tr(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ZPColors.neutralsBlack,
                height: 1.5,
              ),
            ),
          ],
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
          key: const Key('ssoLoginButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  // context
                  //     .read<LoginFormBloc>()
                  //     .add(const LoginFormEvent.loginWithOktaButtonPressed());
                },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ZPColors.white,
              height: 1.5,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            backgroundColor: ZPColors.dDPrimary10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            minimumSize: const Size(169, 40),
          ),
          child: IntrinsicWidth(
            child: LoadingShimmer.withChild(
              enabled: state.isSubmitting,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.login_outlined,
                    size: 24,
                    color: ZPColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Log in with SSO'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ZPColors.shadesBlack,
                      height: 21.79 / 16,
                    ),
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
    return Row(children: const <Widget>[
      Expanded(
        child: Divider(indent: 0),
      ),
      Text(
        'or',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ZPColors.dDNeutrals40,
          height: 21 / 14,
        ),
      ),
      Expanded(
        child: Divider(
          endIndent: 0,
        ),
      ),
    ]);
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        'Don’t have an account yet?'.tr(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ZPColors.neutralsBlack,
          height: 21 / 14,
        ),
      ),
      const SizedBox(
        width: 4.0,
      ),
      Text(
        'Create an account'.tr(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ZPColors.casal,
          height: 19.6 / 14,
        ),
      ),
    ]);
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
          fieldKey: 'loginUsernameField',
          labelText: 'Username'.tr(),
          textStyleLabel: const TextStyle(
            fontSize: 14,
            color: ZPColors.neutralsBlack,
            fontWeight: FontWeight.w700,
            height: 20 / 14,
          ),
          textInputStyle: const TextStyle(
            fontSize: 16,
            color: ZPColors.neutralsBlack,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Enter username'.tr(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          fieldKey: 'loginPasswordField',
          labelText: 'Password'.tr(),
          textStyleLabel: const TextStyle(
            fontSize: 14,
            color: ZPColors.neutralsBlack,
            fontWeight: FontWeight.w700,
            height: 20 / 14,
          ),
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
          textInputStyle: const TextStyle(
            fontSize: 16,
            color: ZPColors.neutralsBlack,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          isEnabled: !state.isSubmitting,
          keyboardType: TextInputType.visiblePassword,
          autocorrect: false,
          decoration: InputDecoration(
            isDense: true,
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 24, minHeight: 24),
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              key: const Key('loginPasswordFieldSuffixIcon'),
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    key: const Key('loginRememberPasswordCheckbox'),
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
                ),
                const SizedBox(width: 8),
                Text(
                  'Remember me'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ZPColors.neutralsBlack,
                  ),
                ),
              ],
            ),
            Text(
              'Forgot password?'.tr(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ZPColors.casal,
              ),
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
        return SizedBox(
          child: ElevatedButton(
            key: const Key('loginSubmitButton'),
            onPressed: state.isSubmitting
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    context.read<LoginFormBloc>().add(
                          const LoginFormEvent
                              .loginWithEmailAndPasswordPressed(),
                        );
                  },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ZPColors.white,
                height: 1.5,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: ZPColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: LoadingShimmer.withChild(
              enabled: state.isSubmitting,
              child: const Text('Log in').tr(),
            ),
          ),
        );
      },
    );
  }
}
