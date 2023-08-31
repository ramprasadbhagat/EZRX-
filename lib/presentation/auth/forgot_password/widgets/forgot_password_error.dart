part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';

class _ForgotPasswordError extends StatelessWidget {
  const _ForgotPasswordError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: (previous, current) =>
            previous.resetPasswordFailureOrSuccessOption !=
            current.resetPasswordFailureOrSuccessOption,
        builder: (context, state) {
          return state.resetPasswordFailureOrSuccessOption.fold(
            () => const SizedBox.shrink(),
            (either) => either.fold(
              (failure) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(top: 6, bottom: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ZPColors.lightRedStatusColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(failure.failureMessage),
              ),
              (success) => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
