part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _ReturnReferenceField extends StatelessWidget {
  const _ReturnReferenceField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.returnReference != current.returnReference,
      builder: (context, state) {
        return TextFieldWithLabel(
          initValue: state.returnReference,
          fieldKey: WidgetKeys.returnReferenceField,
          labelText: 'Return reference (optional)'.tr(),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.returnReferenceChanged(value),
              ),
          decoration: InputDecoration(hintText: 'Enter return reference'.tr()),
          isEnabled: true,
        );
      },
    );
  }
}
