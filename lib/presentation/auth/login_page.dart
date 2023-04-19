import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    trackMixpanelEvent(MixpanelEvents.loginPageView);

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
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      autovalidateMode: state.showErrorMessages
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          const _Logo(),
                          // const Spacer(),
                          // const _SSOLoginButton(),
                          // const Spacer(),
                          // const _OrDivider(),
                          const Spacer(),
                          _UsernameField(
                            controller: _usernameController,
                          ),
                          const SizedBox(height: 15),
                          _PasswordField(
                            controller: _passwordController,
                          ),
                          const _RememberPassword(),
                          const SizedBox(height: 15),
                          const _LoginButton(),
                          const Spacer(flex: 3),
                        ],
                      ),
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
    return SvgPicture.asset(
      'assets/svg/ezrxlogo.svg',
      height: 80,
      fit: BoxFit.scaleDown,
    );
  }
}

// class _SSOLoginButton extends StatelessWidget {
//   const _SSOLoginButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginFormBloc, LoginFormState>(
//       buildWhen: (previous, current) =>
//           previous.isSubmitting != current.isSubmitting,
//       builder: (context, state) {
//         return ElevatedButton(
//           key: const Key('ssoLoginButton'),
//           onPressed: state.isSubmitting
//               ? null
//               : () {
//                   FocusScope.of(context).unfocus();
//                   context
//                       .read<LoginFormBloc>()
//                       .add(const LoginFormEvent.loginWithOktaButtonPressed());
//                 },
//           child: LoadingShimmer.withChild(
//             enabled: state.isSubmitting,
//             child: const Text('Login with SSO').tr(),
//           ),
//         );
//       },
//     );
//   }
// }

// class _OrDivider extends StatelessWidget {
//   const _OrDivider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: <Widget>[
//       const Expanded(child: Divider()),
//       Text('OR', style: Theme.of(context).textTheme.labelLarge),
//       const Expanded(child: Divider()),
//     ]);
//   }
// }

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
        return TextFormField(
          key: const Key('loginUsernameField'),
          enabled: !state.isSubmitting,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Username'.tr()),
          onChanged: (value) => context.read<LoginFormBloc>().add(
                LoginFormEvent.usernameChanged(value),
              ),
          validator: (text) => Username(text ?? '').value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Username cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
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
        return TextFormField(
          key: const Key('loginPasswordField'),
          enabled: !state.isSubmitting,
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: 'Password'.tr(),
            suffixIcon: IconButton(
              key: const Key('loginPasswordFieldSuffixIcon'),
              icon: Icon(
                state.passwordVisible ? Icons.visibility : Icons.visibility_off,
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
          validator: (text) => Password.login(text ?? '').value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Password cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onFieldSubmitted: (value) {
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
        return CheckboxListTile(
          contentPadding: const EdgeInsets.only(top: 5),
          title: const Text('Remember Password').tr(),
          controlAffinity: ListTileControlAffinity.leading,
          key: const Key('loginRememberPasswordCheckbox'),
          value: state.rememberPassword,
          onChanged: (value) {
            FocusScope.of(context).unfocus();
            context
                .read<LoginFormBloc>()
                .add(const LoginFormEvent.rememberCheckChanged());
          },
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
          key: const Key('loginSubmitButton'),
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
            child: const Text('Login').tr(),
          ),
        );
      },
    );
  }
}
