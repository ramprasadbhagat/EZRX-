part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  const _MaterialDetails({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                cartItem.materialInfo.materialNumber.displayMatNo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              if (!context
                  .read<EligibilityBloc>()
                  .state
                  .salesOrgConfigs
                  .hideStockDisplay)
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
          if (cartItem.materialInfo.type.typeMaterial)
            Row(
              children: [
                ListPriceStrikeThroughComponent(priceAggregate: cartItem),
                PriceComponent(
                  key: WidgetKeys.preOrderModalItemFinalPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.finalPriceTotalForAllMaterial,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
