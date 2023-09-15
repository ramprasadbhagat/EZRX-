part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferRemarksTextField extends StatefulWidget {
  final String remarks;
  const _CounterOfferRemarksTextField({Key? key, required this.remarks})
      : super(key: key);

  @override
  State<_CounterOfferRemarksTextField> createState() =>
      __CounterOfferRemarksTextFieldState();
}

class __CounterOfferRemarksTextFieldState
    extends State<_CounterOfferRemarksTextField> {
  late TextEditingController _remarksController;

  @override
  void initState() {
    _remarksController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.remarks,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: TextFieldWithLabel(
        fieldKey: WidgetKeys.counterOfferRemarksField,
        labelText: 'Remarks'.tr(),
        decoration: InputDecoration(
          hintText: 'Enter remarks (Optional)'.tr(),
          helperText: 'Maximum: 132 characters'.tr(),
        ),
        controller: _remarksController,
        onChanged: (value) {
          context.read<PriceOverrideBloc>().add(
                PriceOverrideEvent.onRemarksValueChange(
                  newRemarks: value,
                ),
              );
        },
        maxLines: 3,
        maxLength: 132,
      ),
    );
  }
}
