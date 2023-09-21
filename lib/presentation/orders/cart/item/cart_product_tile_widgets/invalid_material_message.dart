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
        if (cartItem.materialInfo.isSuspended)
          ErrorTextWithIcon(
            valueText: 'Material Suspended'.tr(),
          ),
        if (!cartItem.inStock &&
            !context
                .read<OrderEligibilityBloc>()
                .state
                .isOOSOrderAllowedToSubmit)
          ErrorTextWithIcon(
            valueText: 'Material out of stock'.tr(),
          ),
      ],
    );
  }
}
