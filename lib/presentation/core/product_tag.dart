import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTag extends StatelessWidget {
  final String labelTag;
  final bool hasIcon;
  final String assetIconSvg;
  final bool isCovidTag;
  final TextStyle? labelStyle;
  final Color backgroundColor;
  final Color textColor;
  const ProductTag._({
    Key? key,
    required this.labelTag,
    this.hasIcon = false,
    this.assetIconSvg = '',
    this.isCovidTag = false,
    this.labelStyle,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  factory ProductTag.bundleOffer({TextStyle? labelStyle}) => ProductTag._(
        labelTag: 'Bundle offer',
        backgroundColor: ZPColors.skyBlueColor,
        assetIconSvg: SvgImage.bonusOffer,
        hasIcon: true,
        textColor: ZPColors.white,
        labelStyle: labelStyle,
      );
  factory ProductTag.preOrderTag({
    TextStyle? labelStyle,
    required String label,
    required Color backgroundColor,
    required Color labelColor,
  }) =>
      ProductTag._(
        labelTag: label,
        backgroundColor: backgroundColor,
        textColor: labelColor,
        labelStyle: labelStyle,
      );
  factory ProductTag.covidTag({TextStyle? labelStyle}) => ProductTag._(
        labelTag: 'Covid-19',
        backgroundColor: ZPColors.invoiceStatusBlue,
        textColor: ZPColors.skyBlueColor,
        assetIconSvg: SvgImage.coronavirus,
        hasIcon: true,
        isCovidTag: true,
        labelStyle: labelStyle,
      );
  factory ProductTag.onOfferTag({TextStyle? labelStyle}) => ProductTag._(
        labelTag: 'On offer',
        backgroundColor: ZPColors.orange,
        textColor: ZPColors.white,
        hasIcon: true,
        labelStyle: labelStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isCovidTag
          ? const EdgeInsets.symmetric(
              vertical: 4.0,
            ).copyWith(
              left: 8.0,
              right: 4.0,
            )
          : const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isCovidTag
            ? const BorderRadius.only(
                topRight: Radius.circular(4.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasIcon) ...[
            assetIconSvg.isNotEmpty
                ? SvgPicture.asset(
                    assetIconSvg,
                    height: 18,
                    fit: BoxFit.fill,
                  )
                : const Icon(
                    Icons.local_offer_outlined,
                    size: 20,
                    color: ZPColors.white,
                  ),
            const SizedBox(
              width: 8,
            ),
          ],
          Text(
            context.tr(labelTag),
            style: labelStyle ??
                Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: textColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
