part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';

class _UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const _UsernameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          context.router.current.name == ForgetPasswordPageRoute.name &&
          previous.resetPasswordFailureOrSuccessOption !=
              current.resetPasswordFailureOrSuccessOption,
      listener: (context, state) {
        state.resetPasswordFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => CustomSnackBar(
              icon: const Icon(
                Icons.cancel,
                color: ZPColors.error,
              ),
              backgroundColor: ZPColors.errorSnackBarColor,
              messageText: failure.failureMessage,
            ).show(context),
            (success) =>
                context.router.pushNamed('forgot_password_confirmation'),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: TextFieldWithLabel(
            fieldKey: WidgetKeys.forgotUsernameField,
            labelText: context.tr('Username'),
            mandatory: true,
            decoration: InputDecoration(
              hintText: context.tr('Enter username'),
            ),
            inputFormatters: [
              TextInputFormatter.withFunction(
                (oldValue, newValue) => TextEditingValue(
                  text: newValue.text.toLowerCase(),
                  selection: newValue.selection,
                ),
              ),
            ],
            controller: controller,
            validator: (text) => Username(text ?? '').value.fold(
                  (f) => f.mapOrNull(
                    empty: (_) => context.tr('Username cannot be empty.'),
                  ),
                  (_) => null,
                ),
            onChanged: (value) => context.read<ForgotPasswordBloc>().add(
                  ForgotPasswordEvent.usernameChanged(value),
                ),
            isEnabled: !state.isSubmitting,
          ),
        );
      },
    );
  }
}
