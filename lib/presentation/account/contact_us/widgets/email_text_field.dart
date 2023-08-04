part of '../contact_us_page.dart';

class _EmailTextField extends StatefulWidget {
  const _EmailTextField({Key? key}) : super(key: key);

  @override
  State<_EmailTextField> createState() => __EmailTextFieldState();
}

class __EmailTextFieldState extends State<_EmailTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initialValue();
  }

  void _initialValue() {
    final email =
        context.read<UserBloc>().state.user.email.getOrDefaultValue('');
    _controller = TextEditingController.fromValue(
      TextEditingValue(
        text: email,
        selection: TextSelection.collapsed(
          offset: _controller.selection.base.offset,
        ),
      ),
    );
    if (email.isNotEmpty) {
      context.read<ContactUsBloc>().add(
            ContactUsEvent.onEmailChange(
              newValue: email,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.emailKey,
          labelText: 'E-mail'.tr(),
          mandatory: true,
          controller: _controller,
          validator: (_) =>
              context.read<ContactUsBloc>().state.contactUs.email.value.fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Enter a valid email address.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          isEnabled: !state.isSubmitting,
          maxLines: 1,
          keyboardType: TextInputType.text,
          onChanged: (value) => context.read<ContactUsBloc>().add(
                ContactUsEvent.onEmailChange(
                  newValue: value,
                ),
              ),
          decoration: InputDecoration(
            hintText: 'Enter your E-mail'.tr(),
          ),
        );
      },
    );
  }
}
