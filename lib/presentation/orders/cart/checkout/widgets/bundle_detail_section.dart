part of 'checkout_bundle_item.dart';

class _BundleDetailsSection extends StatelessWidget {
  final PriceAggregate cartItem;
  const _BundleDetailsSection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentBundleOffer = context
        .read<CartBloc>()
        .state
        .currentBundleOffer(bundleCode: cartItem.bundle.bundleCode);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.bundle.bundleCode,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Text(
            cartItem.bundle.bundleName.getValue(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          RichText(
            text: TextSpan(
              text:
                  '${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} per item ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                    decoration: TextDecoration.none,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      '${currentBundleOffer.type.getValue()} ${cartItem.bundle.bundleInformation.firstOrNull?.rate} per item',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
              ],
            ),
          ),
          Text(
            'Purchase ${currentBundleOffer.quantity} or more for ${currentBundleOffer.type.getValue()} ${currentBundleOffer.rate} per item',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.darkGray,
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }
}
