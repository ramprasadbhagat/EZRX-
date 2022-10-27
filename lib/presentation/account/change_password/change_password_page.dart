import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_button.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_validation.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/confirm_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/new_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/old_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password').tr(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ChangePasswordForm(
                key: const Key('changePasswordFrom'),
                user: userBloc.state.user,
              ),
              const SizedBox(
                height: 20,
              ),
              const ResetPasswordValidation(
                key: Key('resetPasswordValidation'),
              ),
              const _NoteText(
                key: Key('noteText'),
              ),
              const SizedBox(
                height: 20,
              ),
              ResetPasswordButton(
                key: const Key('resetPasswordButton'),
                user: userBloc.state.user,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangePasswordForm extends StatelessWidget {
  final User user;
  const _ChangePasswordForm({
    Key? key,
    required this.user,
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
            children: <Widget>[
              const SizedBox(height: 10),
              OldPasswordTextField(user: user),
              const SizedBox(height: 20),
              NewPasswordTextField(user: user),
              const SizedBox(height: 20),
              ConfirmPasswordTextField(user: user),
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
            children:  [
              const SizedBox(width: 8),
              Expanded(
                child: const Text(
                  'Note',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children:  [
              const SizedBox(width: 16),
              Expanded(
                child: const Text(
                  'Previous eZRx passwords cannot be reused. For security reasons passwords can only be changed a maximum of three times for every 24 hours.',
                  style: TextStyle(fontSize: 12),
                ).tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
