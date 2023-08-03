import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: Column(
        children: [
          const Logo(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const _ForgetPasswordTitle(),
                const SizedBox(height: 25),
                const _Error(),
                _UsernameField(
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 25),
                const _ForgotPasswordButton(),
                const SizedBox(height: 15),
                const BackToLogin(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: (previous, current) =>
            previous.resetPasswordFailureOrSuccessOption !=
            current.resetPasswordFailureOrSuccessOption,
        builder: (context, state) {
          return state.resetPasswordFailureOrSuccessOption.fold(
            () => const SizedBox.shrink(),
            (either) => either.fold(
              (failure) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(top: 6, bottom: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ZPColors.lightRedStatusColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(failure.failureMessage),
              ),
              (success) => const SizedBox.shrink(),
            ),
          );
        },
      ),
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
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.resetPasswordFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => {},
            (success) =>
                context.router.pushNamed('forgot_password_confirmation'),
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
          child: TextFieldWithLabel(
            fieldKey: WidgetKeys.forgotUsernameField,
            labelText: 'Username'.tr(),
            mandatory: true,
            decoration: InputDecoration(
              hintText: 'Enter username'.tr(),
            ),
            controller: controller,
            validator: (text) => Username(text ?? '').value.fold(
                  (f) => f.mapOrNull(
                    empty: (_) => 'Username cannot be empty.'.tr(),
                  ),
                  (_) => null,
                ),
            onChanged: (value) => context.read<ForgotPasswordBloc>().add(
                  ForgotPasswordEvent.usernameChanged(value),
                ),
            isEnabled: !state.isSubmitting,
          ),
        );
      },
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ForgotPasswordBloc>().add(
                        ForgotPasswordEvent.requestPasswordReset(
                          context.locale,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Next').tr(),
          ),
        );
      },
    );
  }
}

class _ForgetPasswordTitle extends StatelessWidget {
  const _ForgetPasswordTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.textButtonColor,
              ),
        ).tr(),
        const SizedBox(height: 15),
        const Text(
          'Let us know your Zuellig Pharma username and we`ll send you a verification email.',
        ).tr(),
      ],
    );
  }
}
