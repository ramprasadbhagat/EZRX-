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
      // We need this Column as we will be adding more [ErrorTextWithIcon]
      // for out of stock and material without price
      children: [
        if (cartItem.materialInfo.isSuspended)
          ErrorTextWithIcon(
            valueText: 'Material Suspended'.tr(),
          ),
      ],
    );
  }
}
