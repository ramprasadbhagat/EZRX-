part of '../contact_us_page.dart';

class _UsernameTextField extends StatefulWidget {
  const _UsernameTextField();

  @override
  State<_UsernameTextField> createState() => __UsernameTextFieldState();
}

class __UsernameTextFieldState extends State<_UsernameTextField> {
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
    final displayFullName =
        context.read<UserBloc>().state.userFullName.displayFullName;
    _controller = TextEditingController.fromValue(
      TextEditingValue(
        text: displayFullName,
        selection: TextSelection.collapsed(
          offset: _controller.selection.base.offset,
        ),
      ),
    );
    if (displayFullName.isNotEmpty) {
      context.read<ContactUsBloc>().add(
            ContactUsEvent.onUsernameChange(
              newValue: displayFullName,
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
          fieldKey: WidgetKeys.userNameKey,
          labelText: 'Your Name'.tr(),
          mandatory: true,
          controller: _controller,
          validator: (_) =>
              context.read<ContactUsBloc>().state.contactUs.username.value.fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Name is required.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          isEnabled: !state.isSubmitting,
          maxLines: 1,
          keyboardType: TextInputType.text,
          onChanged: (value) => context.read<ContactUsBloc>().add(
                ContactUsEvent.onUsernameChange(
                  newValue: value,
                ),
              ),
          decoration: InputDecoration(
            hintText: 'Enter your full name'.tr(),
          ),
        );
      },
    );
  }
}
