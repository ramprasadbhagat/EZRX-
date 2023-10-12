part of 'checkout_bundle_item.dart';

class _TotalQtySection extends StatelessWidget {
  final PriceAggregate cartProduct;
  const _TotalQtySection({
    required this.cartProduct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total qty: '.tr() +
                context
                    .read<CartBloc>()
                    .state
                    .getTotalQuantityOfProductBundle(
                      bundleCode: cartProduct.bundle.bundleCode,
                    )
                    .toString(),
            key: WidgetKeys.cartItemBundleQty,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          PriceComponent(
            key: WidgetKeys.cartItemBundleTotalPrice,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: context
                .read<CartBloc>()
                .state
                .itemBundlePrice(bundleCode: cartProduct.bundle.bundleCode)
                .toString(),
          ),
        ],
      ),
    );
  }
}
