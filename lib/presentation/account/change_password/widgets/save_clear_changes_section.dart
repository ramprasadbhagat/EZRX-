part of '../change_password_page.dart';

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
                context.read<UserBloc>().state.user,
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
                          'Clear Changes'.tr(),
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
                                  user: context.read<UserBloc>().state.user,
                                ),
                              );
                        },
                        child: LoadingShimmer.withChild(
                          enabled: state.isSubmitting,
                          child: const Text('Save').tr(),
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
        'Please ensure all requirements are met for your new password.'.tr(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
