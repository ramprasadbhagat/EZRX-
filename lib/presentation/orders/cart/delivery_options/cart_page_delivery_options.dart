part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageDeliveryOptions extends StatelessWidget {
  const _CartPageDeliveryOptions();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.cartDeliveryOptionsSection,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
        buildWhen: (prev, current) =>
            prev.deliveryOption != current.deliveryOption,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('Delivery Options'),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              InfoLabel(
                margin: const EdgeInsets.symmetric(vertical: 12),
                mainColor: ZPColors.blueAccent,
                textColor: ZPColors.neutralsBlack,
                textValue: context.tr(
                  'We are unable to guarantee delivery TOMORROW if your order is placed between 04:00 and 06:00 PM',
                ),
              ),
              _DeliveryOptionCard(
                deliveryOption: DeliveryOption.standardDelivery(),
                selectedDeliveryOption: state.deliveryOption,
                price: 'FREE',
              ),
              _DeliveryOptionCard(
                deliveryOption: DeliveryOption.requestDeliveryDate(),
                selectedDeliveryOption: state.deliveryOption,
                price: 'FREE',
              ),
              _DeliveryOptionCard(
                deliveryOption: DeliveryOption.urgentDelivery(),
                selectedDeliveryOption: state.deliveryOption,
                price: '-',
              ),
            ],
          );
        },
      ),
    );
  }
}
