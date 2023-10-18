part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class SpecialInstructionsField extends StatelessWidget {
  const SpecialInstructionsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.specialInstructions != current.specialInstructions,
      builder: (context, state) {
        return TextFieldWithLabel(
          initValue: state.specialInstructions,
          fieldKey: WidgetKeys.specialInstructionsField,
          labelText: 'Special instructions (optional)'.tr(),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.specialInstructionsChanged(value),
              ),
          decoration: InputDecoration(hintText: 'Max. 150 characters'.tr()),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(ZPRegexes.hyperlinkRegExp),
          ],
          isEnabled: true,
          maxLength: 150,
        );
      },
    );
  }
}
