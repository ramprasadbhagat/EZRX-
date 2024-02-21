part of 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart';

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showNewPasswordPatternMismatchError !=
              current.showNewPasswordPatternMismatchError,
      builder: ((context, state) {
        return Column(
          children: [
            if (state.showNewPasswordPatternMismatchError(
              context.read<EligibilityBloc>().state.user,
            ))
              const _ValidationsFailedWarning(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  ElevatedButton(
                    key: WidgetKeys.resetPasswordButton,
                    onPressed: state.isSubmitting
                        ? null
                        : () => context.read<ResetPasswordBloc>().add(
                              const ResetPasswordEvent.resetPassword(),
                            ),
                    child: LoadingShimmer.withChild(
                      enabled: state.isSubmitting,
                      child: Text(context.tr('Reset Password')),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const BackToLogin(),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ValidationsFailedWarning extends StatelessWidget {
  const _ValidationsFailedWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: ZPColors.lightRedStatusColor,
      ),
      child: Text(
        context.tr(
          'Please ensure all requirements are met for your new password.',
        ),
        style: Theme.of(context).textTheme.titleSmall,
        key: WidgetKeys.errorRequirementsFillAllField,
      ),
    );
  }
}
