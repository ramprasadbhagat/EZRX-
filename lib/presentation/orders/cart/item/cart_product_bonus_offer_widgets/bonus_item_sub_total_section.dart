part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';

class _ItemSubTotalSection extends StatelessWidget {
  const _ItemSubTotalSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        bottom: 8,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'FREE'.tr(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.textButtonColor,
              ),
        ),
      ),
    );
  }
}
