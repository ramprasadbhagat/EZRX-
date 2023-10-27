part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';

class _MaterialDetails extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const _MaterialDetails({
    Key? key,
    required this.bonusItem,
  }) : super(key: key);

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
              if (!context.read<EligibilityBloc>().state.isIDMarket)
                const BonusTag(),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            bonusItem.materialDescription,
            key: WidgetKeys.cartItemBonusMaterialDescription,
            maxLines: 2,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          _MaterialQuantitySection(
            bonusItem: bonusItem,
          ),
        ],
      ),
    );
  }
}
