import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_button.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/confirm_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/new_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/old_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_validation.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(color: ZPColors.primary),
        ).tr(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              _ChangePasswordForm(
                key: Key('changePasswordFrom'),
              ),
              SizedBox(
                height: 20,
              ),
              ResetPasswordValidation(
                key: Key('resetPasswordValidation'),
              ),
              _NoteText(
                key: Key('noteText'),
              ),
              SizedBox(
                height: 20,
              ),
              ResetPasswordButton(
                key:Key('resetPasswordButton'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangePasswordForm extends StatelessWidget {
  const _ChangePasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(height: 40),
              OldPasswordTextField(),
              SizedBox(height: 20),
              NewPasswordTextField(),
              SizedBox(height: 20),
              ConfirmPasswordTextField(),
            ],
          ),
        );
      },
    );
  }
}

class _NoteText extends StatelessWidget {
  const _NoteText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Note:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Previous eZRx passwords cannot be reused. For security reasons, passwords can only be changed a maximum of three times for every 24 hours.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
