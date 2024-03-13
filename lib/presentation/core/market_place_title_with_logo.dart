import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketPlaceTitleWithLogo extends StatelessWidget {
  const MarketPlaceTitleWithLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.cartMPProductSectionLabel,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            SvgImage.marketplaceIcon,
            fit: BoxFit.fill,
          ),
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
