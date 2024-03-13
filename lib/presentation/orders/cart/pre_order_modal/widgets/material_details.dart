part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const _MaterialDetails({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  cartItem.materialInfo.combinationCode(
                    showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
              ),
              if (eligibilityState.salesOrg.showBonus &&
                  cartItem.materialInfo.type.typeDealOrOverrideBonus)
                const BonusTag(margin: EdgeInsets.only(left: 5)),
              const SizedBox(
                width: 8,
              ),
              if (!eligibilityState.salesOrgConfigs.hideStockDisplay)
                StatusLabel(
                  status: StatusType('OOS-Preorder'),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialInfo.materialDescription,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cartItem.materialInfo.type.typeMaterial) ...[
                Row(
                  children: [
                    ListPriceStrikeThroughComponent(priceAggregate: cartItem),
                    PriceComponent(
                      key: WidgetKeys.preOrderModalItemFinalPrice,
                      salesOrgConfig: eligibilityState.salesOrgConfigs,
                      price: cartItem.display(PriceType.finalPrice),
                      type: PriceStyle.oosPreOrderItemPrice,
                    ),
                  ],
                ),
              ],
              Text(
                '${"Qty: ".tr()}${cartItem.quantity.toString()}',
                key: WidgetKeys.preOrderMaterialQty,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          if (cartItem.materialInfo.type.typeMaterial)
            GovtListPriceComponent(
              price: cartItem.display(PriceType.listPrice),
            ),
        ],
      ),
    );
  }
}
