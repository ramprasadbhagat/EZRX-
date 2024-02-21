part of 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart';

final _formKey = GlobalKey<FormState>();

class _ResetPasswordForm extends StatelessWidget {
  const _ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.passwordResetFailureOrSuccessOption !=
          current.passwordResetFailureOrSuccessOption,
      listener: (context, state) => {
        state.passwordResetFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) => context.router.push(const ResetPasswordSuccessRoute()),
          ),
        ),
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  buildWhen: (previous, current) =>
                      previous.isNewPasswordObscure !=
                      current.isNewPasswordObscure,
                  builder: (context, state) {
                    return PasswordTextField(
                      key: WidgetKeys.newPasswordTextField,
                      isPasswordVisible: state.isNewPasswordObscure,
                      labelText: 'New Password',
                      hintText: 'Follow instruction below',
                      passwordFieldType: PasswordFieldType.newPassword,
                      emptyErrorText: 'New password is a required field',
                    );
                  },
                ),
                const SizedBox(height: 15),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  buildWhen: (previous, current) =>
                      previous.isConfirmPasswordObscure !=
                      current.isConfirmPasswordObscure,
                  builder: (context, state) {
                    return PasswordTextField(
                      key: WidgetKeys.confirmPasswordField,
                      isPasswordVisible: state.isConfirmPasswordObscure,
                      labelText: 'Enter new password again',
                      hintText: 'Enter new password again',
                      passwordFieldType: PasswordFieldType.confirmPassword,
                      emptyErrorText:
                          'Confirm new password is a required field',
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
