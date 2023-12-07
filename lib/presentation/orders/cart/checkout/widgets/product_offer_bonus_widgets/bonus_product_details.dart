part of 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';

class _ProductDetails extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _ProductDetails({required this.bonusItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      key: WidgetKeys.bonusProductDetail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  bonusItem.materialInfo.combinationCode(
                    showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (!eligibilityState.isIDMarket) const BonusTag(),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            bonusItem.materialDescription,
            maxLines: 2,
            style: Theme.of(context).textTheme.labelSmall,
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
