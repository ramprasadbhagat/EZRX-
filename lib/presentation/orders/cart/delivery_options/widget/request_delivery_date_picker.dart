part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _RequestDeliveryDatePicker extends StatefulWidget {
  const _RequestDeliveryDatePicker();

  @override
  State<_RequestDeliveryDatePicker> createState() =>
      _RequestDeliveryDatePickerState();
}

class _RequestDeliveryDatePickerState
    extends State<_RequestDeliveryDatePicker> {
  final _deliveryDateText = TextEditingController();

  @override
  void dispose() {
    _deliveryDateText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: WidgetKeys.deliveryDate,
      readOnly: true,
      controller: _deliveryDateText,
      onTap: () async {
        final dateTime = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime.now().add(const Duration(days: 1000)),
          initialDate: DateTime.now(),
        );
        if (dateTime == null || !context.mounted) return;
        _deliveryDateText.text = DateTimeUtils.getDeliveryDateString(dateTime);
      },
      decoration: InputDecoration(
        hintText: context.tr('Select delivery date'),
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 22, minHeight: 22),
        focusedBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.date_range_outlined, size: 22),
        ),
      ),
    );
  }
}
