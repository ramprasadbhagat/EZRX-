part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ForgotPasswordBloc>().add(
                        ForgotPasswordEvent.requestPasswordReset(
                          context.locale,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Next').tr(),
          ),
        );
      },
    );
  }
}
