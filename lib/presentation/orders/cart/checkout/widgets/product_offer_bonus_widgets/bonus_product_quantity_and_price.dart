part of 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';

class _QuantityAndPrice extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _QuantityAndPrice({required this.bonusItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'Qty:'.tr()} ${bonusItem.qty.toString()}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
          ),
          Text(
            'FREE'.tr(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}
