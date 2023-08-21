import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

class PriceComponent extends StatelessWidget {
  const PriceComponent({
    Key? key,
    required this.salesOrgConfig,
    required this.price,
    this.title = '',
    this.priceLabelStyle,
    this.obscured = false,
    this.type = PriceStyle.commonPrice,
  }) : super(key: key);

  final SalesOrganisationConfigs salesOrgConfig;
  final String price;
  final String title;
  final TextStyle? priceLabelStyle;
  final bool obscured;
  final PriceStyle type;

  List<TextSpan> _getTextSpan(BuildContext context) {
    final textSpans = <TextSpan>[];
    final notPrice = price.contains(RegExp(r'[A-Za-z]'));
    final priceTextStyle = _priceStyle(
      context,
      type,
    );
    final currencyCodeTextStyle = _currencyCodeTextStyle(
      context,
      type,
    );

    final priceValue = notPrice
        ? price.tr()
        : StringUtils.displayPrice(salesOrgConfig, double.parse(price));
    final obscuredValue = price.replaceAll(RegExp(r'[0-9]'), '*');

    if (title.isNotEmpty) {
      textSpans.add(
        TextSpan(
          text: title,
          style: priceLabelStyle ?? priceTextStyle,
        ),
      );
    }
    if (notPrice) {
      textSpans.add(
        TextSpan(
          text: obscured ? obscuredValue : priceValue,
          style: priceTextStyle,
        ),
      );

      return textSpans;
    }
    final amount = priceValue.split(' ').last;
    //currency
    textSpans.add(
      TextSpan(
        text: priceValue.replaceAll(amount, ''),
        style: currencyCodeTextStyle,
      ),
    );
    //amount
    textSpans.add(
      TextSpan(
        text: obscured ? obscuredValue : amount,
        style: priceTextStyle,
      ),
    );

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: WidgetKeys.priceComponent,
      text: TextSpan(
        children: [
          ..._getTextSpan(context),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

enum PriceStyle { commonPrice, bundlePice, counterOfferPrice, bonusPrice }

TextStyle _priceStyle(BuildContext context, PriceStyle type) {
  switch (type) {
    case PriceStyle.commonPrice:
      return Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.counterOfferPrice:
      return Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ZPColors.darkGray,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.bonusPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkGray,
          );

    default:
      return Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: ZPColors.black);
  }
}

TextStyle _currencyCodeTextStyle(BuildContext context, PriceStyle type) {
  switch (type) {
    case PriceStyle.commonPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.counterOfferPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkGray,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.bonusPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkGray,
          );

    default:
      return Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ZPColors.black);
  }
}
