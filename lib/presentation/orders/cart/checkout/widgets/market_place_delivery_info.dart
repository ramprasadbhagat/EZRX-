part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _MarketPlaceDeliveryInfo extends StatelessWidget {
  final List<PriceAggregate> mpItems;

  const _MarketPlaceDeliveryInfo({required this.mpItems});

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      childrenPadding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 16,
      ),
      threeLineTitle: true,
      initiallyExpanded: true,
      iconColor: ZPColors.neutralsBlack,
      boxBorder:
          const Border(bottom: BorderSide(color: ZPColors.extraLightGrey2)),
      title: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: MarketPlaceIcon(height: 24, width: 24),
              alignment: PlaceholderAlignment.middle,
            ),
            const WidgetSpan(child: SizedBox(width: 4)),
            TextSpan(text: context.tr('Marketplace item(s) delivery')),
          ],
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: ZPColors.neutralsBlack),
        ),
      ),
      children: [
        Text(
          context.tr(
            'The delivery times for Marketplace items are based on sellers\' response times and may exceed the usual delivery times for ZP orders. Sellers will dispatch the items to the ZP warehouse, and we will handle the delivery to you.',
          ),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            context.tr('Delivery by'),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: ZPColors.shadesBlack),
          ),
        ),
        ...mpItems.map((item) => item.materialInfo.getManufactured).toSet().map(
              (sellerName) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: MarketPlaceSellerTitle(sellerName: sellerName),
              ),
            ),
      ],
    );
  }
}
