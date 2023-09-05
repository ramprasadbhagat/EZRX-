part of 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_offer_bonus_item.dart';

class _ProductDetails extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _ProductDetails({required this.bonusItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bonusItem.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              const BonusTag(),
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
          Text(
            'FREE'.tr(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ],
      ),
    );
  }
}
