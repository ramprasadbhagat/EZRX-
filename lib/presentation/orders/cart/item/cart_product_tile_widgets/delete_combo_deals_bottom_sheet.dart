part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';

class _DeleteComboDealBottomSheet extends StatelessWidget {
  final PriceAggregate cartItem;
  const _DeleteComboDealBottomSheet({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.tr('Delete combo')}?',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            context.tr('This action cannot be undone.'),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          _DeleteComboButtons(
            cartItem: cartItem,
          ),
        ],
      ),
    );
  }
}

class _DeleteComboButtons extends StatelessWidget {
  final PriceAggregate cartItem;
  const _DeleteComboButtons({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.router.pop();
            },
            child: Text(context.tr('Cancel')),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(
                    ZPColors.red,
                  ),
                ),
            onPressed: () {
              context.read<CartBloc>().add(
                    CartEvent.upsertCartItemsWithComboOffers(
                      priceAggregates:
                          cartItem.convertComboItemToPriceAggregateList
                              .map(
                                (e) => e.copyWith(
                                  quantity: 0,
                                  price: e.price.copyWith(
                                    comboDeal: e.price.comboDeal.copyWith(
                                      isEligible: false,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  );
              context.router.pop();
            },
            child: Text(context.tr('Delete')),
          ),
        ),
      ],
    );
  }
}
