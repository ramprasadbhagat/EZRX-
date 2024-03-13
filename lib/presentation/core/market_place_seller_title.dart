import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketPlaceSellerTitle extends StatelessWidget {
  final String sellerName;
  final Color? iconColor;
  final Color? textColor;

  const MarketPlaceSellerTitle({
    Key? key,
    required this.sellerName,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          key: WidgetKeys.marketplaceSellerIcon,
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            SvgImage.marketplaceSellerIcon,
            fit: BoxFit.fill,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            sellerName,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: textColor ?? ZPColors.neutralsBlack,
                ),
          ),
        ),
      ],
    );
  }
}
