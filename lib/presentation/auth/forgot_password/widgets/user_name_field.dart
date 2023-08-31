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
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.resetPasswordFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => {},
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
            labelText: 'Username'.tr(),
            mandatory: true,
            decoration: InputDecoration(
              hintText: 'Enter username'.tr(),
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
                    empty: (_) => 'Username cannot be empty.'.tr(),
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
