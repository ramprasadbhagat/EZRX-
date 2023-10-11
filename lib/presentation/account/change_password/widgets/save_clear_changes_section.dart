part of 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';

class _SaveClearChangesSection extends StatelessWidget {
  const _SaveClearChangesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showNewPasswordPatternMismatchError !=
              current.showNewPasswordPatternMismatchError,
      builder: ((context, state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                color: ZPColors.lightGray2,
                indent: 0,
                endIndent: 0,
                height: 40,
              ),
              if (state.showNewPasswordPatternMismatchError(
                context.read<EligibilityBloc>().state.user,
              ))
                const _ValidationsFailedWarning(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        key: WidgetKeys.cancelButton,
                        onPressed: () {
                          _formKey.currentState?.reset();
                          context
                              .read<ResetPasswordBloc>()
                              .add(const ResetPasswordEvent.clear());
                        },
                        child: Text(
                          context.tr('Clear Changes'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        key: WidgetKeys.changePasswordButton,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<ResetPasswordBloc>().add(
                                ResetPasswordEvent.resetPasswordPressed(
                                  user: context
                                      .read<EligibilityBloc>()
                                      .state
                                      .user,
                                ),
                              );
                        },
                        child: LoadingShimmer.withChild(
                          enabled: state.isSubmitting,
                          child: Text(context.tr('Save')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
