part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';

class _InvalidMaterialMessage extends StatelessWidget {
  final PriceAggregate cartItem;
  const _InvalidMaterialMessage({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (cartItem.isSuspendedMaterial)
          ErrorTextWithIcon(
            valueText: context.tr('Material Suspended'),
          ),
        if (!cartItem.inStock &&
            context
                .read<OrderEligibilityBloc>()
                .state
                .displayInvalidOOSOnCartItem)
          ErrorTextWithIcon(
            valueText: context.tr('Material out of stock'),
          ),
        if (cartItem.materialInfo.isPrincipalSuspended)
          ErrorTextWithIcon(
            valueText: context.tr('Temporarily suspended by principle'),
          ),
      ],
    );
  }
}
