part of 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';

class _QuantityAndPrice extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _QuantityAndPrice({required this.bonusItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Padding(
      key: WidgetKeys.quantityAndPrice,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'Qty:'.tr()} ${bonusItem.qty.toString()}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
          ),
          eligibilityState.isIDMarket
              ? PriceComponent(
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price: '0',
                )
              : Text(
                  'FREE'.tr(),
                  key: WidgetKeys.cartItemBonusFreeLabel,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.textButtonColor,
                      ),
                ),
        ],
      ),
    );
  }
}
