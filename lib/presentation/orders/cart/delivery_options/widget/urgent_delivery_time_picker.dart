part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _UrgentDeliveryTimePicker extends StatelessWidget {
  const _UrgentDeliveryTimePicker();

  @override
  Widget build(BuildContext context) {
    final options = [
      'Today, 1PM - 6PM (order before 10:30 AM)',
      'Tomorrow, 9AM - 12AM (order before 4PM)',
      'Saturday, 9AM - 1PM (order before 4PM)',
    ];
    const borderSide = BorderSide(color: ZPColors.inputBorderColor);
    const borderRadius = Radius.circular(8);

    return DropdownButtonFormField2(
      key: WidgetKeys.cartUrgentDeliveryTimePicker,
      onChanged: (value) {},
      value: options.elementAt(1),
      selectedItemBuilder: (_) => options
          .map(
            (option) => Text(
              context.tr(option),
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      items: options.map(
        (option) {
          final enabled = option != options.first;

          return DropdownMenuItem(
            value: option,
            enabled: enabled,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                context.tr(option),
                style: TextStyle(
                  color: enabled ? null : ZPColors.disableTextColor,
                ),
              ),
            ),
          );
        },
      ).toList(),
      isExpanded: true,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 8, 12, 8),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: BorderRadius.only(
            topLeft: borderRadius,
            topRight: borderRadius,
          ),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(height: 64),
      dropdownStyleData: const DropdownStyleData(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: borderRadius,
            bottomRight: borderRadius,
          ),
          border: Border(
            bottom: borderSide,
            right: borderSide,
            left: borderSide,
          ),
          boxShadow: [],
        ),
      ),
    );
  }
}
