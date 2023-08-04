part of '../contact_us_page.dart';

class _MessageTextField extends StatefulWidget {
  const _MessageTextField({Key? key}) : super(key: key);

  @override
  State<_MessageTextField> createState() => __MessageTextFieldState();
}

class __MessageTextFieldState extends State<_MessageTextField> {
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
    _controller = TextEditingController.fromValue(
      TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(
          offset: _controller.selection.base.offset,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.contactMessageKey,
          labelText: 'Message'.tr(),
          mandatory: true,
          controller: _controller,
          validator: (_) =>
              context.read<ContactUsBloc>().state.contactUs.message.value.fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Message is required.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          isEnabled: !state.isSubmitting,
          maxLines: 6,
          keyboardType: TextInputType.multiline,
          onChanged: (value) => context.read<ContactUsBloc>().add(
                ContactUsEvent.onMessageChange(
                  newValue: value,
                ),
              ),
          decoration: InputDecoration(
            hintText: 'How can we help?'.tr(),
          ),
        );
      },
    );
  }
}
