import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordTile extends StatelessWidget {
  const ChangePasswordTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('changePasswordTile'),
      leading: const Icon(
        Icons.vpn_key_outlined,
      ),
      title: const Text('Change Password').tr(),
      onTap: () {
        context
            .read<ResetPasswordBloc>()
            .add(const ResetPasswordEvent.onRestart());
        context.router.pushNamed('change_password_page');
      },
    );
  }
}
