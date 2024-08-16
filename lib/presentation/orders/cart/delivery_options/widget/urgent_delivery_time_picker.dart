part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _UrgentDeliveryTimePicker extends StatelessWidget {
  const _UrgentDeliveryTimePicker();

  @override
  Widget build(BuildContext context) {
    final salesOrganisationConfigs =
        context.read<OrderEligibilityBloc>().state.configs;
    final urgentDeliveryOptionTitlesList =
        salesOrganisationConfigs.urgentDeliveryOptionTitlesList;

    final enabledDeliveryOptionsList =
        salesOrganisationConfigs.enabledDeliveryOptionsList;

    final optionFeesList = salesOrganisationConfigs.deliveryFeesList;

    const borderSide = BorderSide(color: ZPColors.inputBorderColor);
    const borderRadius = Radius.circular(8);

    return DropdownButtonFormField2(
      key: WidgetKeys.cartUrgentDeliveryTimePicker,
      onChanged: (value) {
        if (value != null) {
          final valueIndex = urgentDeliveryOptionTitlesList.indexOf(value);
          context.read<OrderEligibilityBloc>().add(
                OrderEligibilityEvent.updateUrgentDeliveryFee(
                  optionFeesList[valueIndex],
                ),
              );
        }
      },
      value: urgentDeliveryOptionTitlesList.elementAt(
        optionFeesList.indexOf(
          salesOrganisationConfigs.getDeliveryFee,
        ),
      ),
      selectedItemBuilder: (_) => urgentDeliveryOptionTitlesList
          .map(
            (option) => Text(
              context.tr(option),
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      items: urgentDeliveryOptionTitlesList.mapIndexed(
        (index, option) {
          final enabled = enabledDeliveryOptionsList[index];

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
