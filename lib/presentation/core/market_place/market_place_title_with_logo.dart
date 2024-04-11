import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class MarketPlaceTitleWithLogo extends StatelessWidget {
  const MarketPlaceTitleWithLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.cartMPProductSectionLabel,
      children: [
        const MarketPlaceIcon(
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 2),
        Text(
          context.tr('Marketplace'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
