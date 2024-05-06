import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class MarketPlaceDeliveryInfo extends StatelessWidget {
  final List<String> sellers;
  final bool initiallyExpanded;
  final bool showMPIcon;
  final TextStyle titleTextStyle;
  final EdgeInsets contentPadding;
  final EdgeInsets childrenPadding;

  const MarketPlaceDeliveryInfo._({
    required this.sellers,
    required this.initiallyExpanded,
    required this.showMPIcon,
    required this.titleTextStyle,
    required this.contentPadding,
    required this.childrenPadding,
  });

  factory MarketPlaceDeliveryInfo.cart(
    BuildContext context, {
    required List<String> sellers,
  }) =>
      MarketPlaceDeliveryInfo._(
        sellers: sellers,
        showMPIcon: false,
        titleTextStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: ZPColors.neutralsBlack),
        initiallyExpanded: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
      );

  factory MarketPlaceDeliveryInfo.checkout(
    BuildContext context, {
    required List<String> sellers,
  }) =>
      MarketPlaceDeliveryInfo._(
        sellers: sellers,
        showMPIcon: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: ZPColors.neutralsBlack),
        initiallyExpanded: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        childrenPadding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 15,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      contentPadding: contentPadding,
      childrenPadding: childrenPadding,
      threeLineTitle: true,
      initiallyExpanded: initiallyExpanded,
      iconColor: ZPColors.neutralsBlack,
      boxBorder:
          const Border(bottom: BorderSide(color: ZPColors.extraLightGrey2)),
      title: Text.rich(
        TextSpan(
          children: [
            if (showMPIcon) ...[
              const WidgetSpan(
                child: MarketPlaceIcon(height: 24, width: 24),
                alignment: PlaceholderAlignment.middle,
              ),
              const WidgetSpan(child: SizedBox(width: 4)),
            ],
            TextSpan(text: context.tr('Marketplace item(s) delivery')),
          ],
          style: titleTextStyle,
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
        ...sellers.map(
          (sellerName) => Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: MarketPlaceSellerTitle(
              sellerName: sellerName,
              textColor: ZPColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
