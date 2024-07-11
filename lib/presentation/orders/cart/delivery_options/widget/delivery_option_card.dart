part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _DeliveryOptionCard extends StatelessWidget {
  final DeliveryOption deliveryOption;
  final DeliveryOption selectedDeliveryOption;
  final String price;

  const _DeliveryOptionCard({
    required this.deliveryOption,
    required this.selectedDeliveryOption,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = deliveryOption == selectedDeliveryOption;

    return CustomCard(
      child: EdgeCheckbox(
        key:
            WidgetKeys.cartDeliveryOptionCard(deliveryOption.title, isSelected),
        value: isSelected,
        onChanged: (_) => context
            .read<OrderEligibilityBloc>()
            .add(OrderEligibilityEvent.selectDeliveryOption(deliveryOption)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    deliveryOption.icon,
                    height: 32,
                    width: 32,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr(deliveryOption.title),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: ZPColors.primary),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            context.tr(deliveryOption.description),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: ZPColors.neutralsGrey1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              if (isSelected)
                if (deliveryOption == DeliveryOption.requestDeliveryDate()) ...[
                  const SizedBox(height: 16),
                  const _RequestDeliveryDatePicker(),
                ] else if (deliveryOption ==
                    DeliveryOption.urgentDelivery()) ...[
                  const SizedBox(height: 16),
                  const _UrgentDeliveryTimePicker(),
                ],
            ],
          ),
        ),
      ),
    );
  }
}
