import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({
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
