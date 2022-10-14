import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
            },
            (_) {
              showSnackBar(
                context: context,
                message: 'Change Password Successfull'.tr(),
              );
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
        );
      },
      builder: ((context, state) {
        return Visibility(
          visible: true,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              key: const Key('changePasswordButton'),
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<ResetPasswordBloc>().add(
                      ResetPasswordEvent.resetPasswordPressed(
                          user: user,),
                    );
              },
              child: LoadingShimmer.withChild(
                enabled: state.isSubmitting,
                child: const Text('Change Password').tr(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
