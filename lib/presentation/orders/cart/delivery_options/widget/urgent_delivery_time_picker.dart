part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _UrgentDeliveryTimePicker extends StatelessWidget {
  const _UrgentDeliveryTimePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.selectedUrgentDeliveryTime !=
          current.selectedUrgentDeliveryTime,
      builder: (context, state) => InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (_) => _UrgentDeliveryBottomSheet(
            selectedDeliveryTime: state.selectedUrgentDeliveryTime,
          ),
        ).then((value) {
          if (value is String) {
            context
                .read<OrderEligibilityBloc>()
                .add(OrderEligibilityEvent.updateUrgentDeliveryFee(value));
          }
        }),
        child: Container(
          key: WidgetKeys.cartUrgentDeliveryTimePicker,
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: ZPColors.inputBorderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  state.selectedUrgentDeliveryTime,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.keyboard_arrow_down, size: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UrgentDeliveryBottomSheet extends StatefulWidget {
  final String selectedDeliveryTime;

  const _UrgentDeliveryBottomSheet({required this.selectedDeliveryTime});

  @override
  State<_UrgentDeliveryBottomSheet> createState() =>
      _UrgentDeliveryBottomSheetState();
}

class _UrgentDeliveryBottomSheetState
    extends State<_UrgentDeliveryBottomSheet> {
  late var _selectedDeliveryTime = widget.selectedDeliveryTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(padding12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding12),
              child: Text(
                context.tr('Urgent delivery'),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: padding12),
                child: _UrgentDeliveryTimeList(
                  onSelectDeliveryTime: (value) => setState(() {
                    _selectedDeliveryTime = value;
                  }),
                  selectedDeliveryTime: _selectedDeliveryTime,
                ),
              ),
            ),
            const SizedBox(height: padding24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    key: WidgetKeys.cancelButton,
                    onPressed: () => context.router.maybePop(),
                    child: Text(context.tr('Cancel')),
                  ),
                ),
                const SizedBox(width: padding12),
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.confirmButton,
                    onPressed: () =>
                        context.router.maybePop(_selectedDeliveryTime),
                    child: Text(context.tr('Confirm')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UrgentDeliveryTimeList extends StatelessWidget {
  final String selectedDeliveryTime;
  final Function(String deliveryTime) onSelectDeliveryTime;

  const _UrgentDeliveryTimeList({
    required this.selectedDeliveryTime,
    required this.onSelectDeliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrganisationConfigs =
        context.read<OrderEligibilityBloc>().state.configs;
    final urgentDeliveryOptionTitlesList =
        salesOrganisationConfigs.urgentDeliveryOptionTitlesList;

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final option = urgentDeliveryOptionTitlesList[index];

        return ListTileTheme(
          horizontalTitleGap: 4,
          child: RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: Text(
              option,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              if (value != null) onSelectDeliveryTime.call(value);
            },
            groupValue: selectedDeliveryTime,
            value: option,
          ),
        );
      },
      itemCount: urgentDeliveryOptionTitlesList.length,
    );
  }
}
