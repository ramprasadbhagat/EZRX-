part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _ManufacturerName extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _ManufacturerName({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (cartProduct.isMarketPlace)
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: MarketPlaceLogo(),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            cartProduct.principalData.principalName.getValue(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
        ),
      ],
    );
  }
}
