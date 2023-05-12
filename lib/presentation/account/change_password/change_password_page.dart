import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_button.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_validation.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/confirm_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/new_password_field.dart';
import 'package:ezrxmobile/presentation/account/change_password/widgets/old_password_field.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
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
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            _ChangePasswordForm(
              key: const Key('changePasswordFrom'),
              user: userBloc.state.user,
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
              OldPasswordTextField(user: user),
              const SizedBox(height: 15),
              NewPasswordTextField(user: user),
              const SizedBox(height: 15),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            'Note',
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
        ),
        Text(
          'Previous eZRx passwords cannot be reused. For security reasons passwords can only be changed a maximum of three times for every 24 hours.',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.darkGray,
              ),
        ).tr(),
      ],
    );
  }
}
