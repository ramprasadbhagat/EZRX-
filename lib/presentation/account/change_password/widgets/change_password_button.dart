import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class ResetPasswordButton extends StatelessWidget {
  final User user;
  const ResetPasswordButton({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      listener: (BuildContext context, ResetPasswordState state) {
        state.passwordResetFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              CustomSnackBar(
                messageText: 'Change Password Successfull'.tr(),
              ).show(context);

              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
        );
      },
      builder: ((context, state) {
        return ElevatedButton(
          key: const Key('changePasswordButton'),
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.read<ResetPasswordBloc>().add(
                  ResetPasswordEvent.resetPasswordPressed(
                    user: user,
                  ),
                );
          },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Change Password').tr(),
          ),
        );
      }),
    );
  }
}
