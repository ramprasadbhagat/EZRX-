import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameField({
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
