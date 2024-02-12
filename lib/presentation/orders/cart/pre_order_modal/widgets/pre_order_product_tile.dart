part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PreOrderProductTile extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _PreOrderProductTile({required this.cartProduct, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.preOrderMaterial(
        cartProduct.getMaterialNumber.displayMatNo,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageSection(cartProduct: cartProduct),
              const SizedBox(
                width: 8,
              ),
              _MaterialDetails(cartItem: cartProduct),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${"Qty: ".tr()}${cartProduct.quantity.toString()}',
                key: WidgetKeys.preOrderMaterialQty,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              if (cartProduct.materialInfo.type.typeMaterial)
                _PriceSection(cartProduct: cartProduct),
              if (cartProduct.materialInfo.type.typeDealOrOverrideBonus)
                Align(
                  alignment: Alignment.centerRight,
                  child: context.read<EligibilityBloc>().state.isIDMarket
                      ? PriceComponent(
                          salesOrgConfig: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          price: '0',
                        )
                      : Text(
                          context.tr('FREE'),
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: ZPColors.textButtonColor,
                                  ),
                        ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
