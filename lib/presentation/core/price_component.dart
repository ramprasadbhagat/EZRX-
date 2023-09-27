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
    this.trailingText = '',
    this.priceLabelStyle,
    this.obscured = false,
    this.type = PriceStyle.commonPrice,
  }) : super(key: key);

  final SalesOrganisationConfigs salesOrgConfig;
  final String price;
  final String title;
  final String trailingText;
  final TextStyle? priceLabelStyle;
  final bool obscured;
  final PriceStyle type;

  List<TextSpan> _getTextSpan(BuildContext context) {
    final textSpans = <TextSpan>[];
    final notPrice = price.contains(RegExp(r'[A-Za-z]'));
    final priceTextStyle = _priceStyle(context, type);
    final currencyCodeTextStyle = _currencyCodeTextStyle(context, type);

    final priceValue = notPrice
        ? price.tr()
        : StringUtils.priceComponentDisplayPrice(
            salesOrgConfig,
            double.parse(price),
            obscured,
          );

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
          text: priceValue,
          style: priceTextStyle,
        ),
      );

      return textSpans;
    }
    if (type == PriceStyle.credits) {
      textSpans.add(TextSpan(text: '(', style: currencyCodeTextStyle));
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
    final obscuredValue = amount.replaceAll(RegExp(r'[0-9]'), '*');
    textSpans.add(
      TextSpan(
        text: obscured ? obscuredValue : amount,
        style: priceTextStyle,
      ),
    );
    if (type == PriceStyle.credits) {
      textSpans.add(TextSpan(text: ')', style: currencyCodeTextStyle));
    }

    if (type == PriceStyle.bundlePrice) {
      textSpans
          .add(TextSpan(text: ' $trailingText', style: currencyCodeTextStyle));
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      key: WidgetKeys.priceComponent,
      text: TextSpan(
        children: _getTextSpan(context),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

enum PriceStyle {
  commonPrice,
  bundlePrice,
  counterOfferPrice,
  bonusPrice,
  taxPrice,
  totalPrice,
  summaryPrice,
  grandTotalPrice,
  credits,
}

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
    case PriceStyle.taxPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ZPColors.darkGray,
          );
    case PriceStyle.summaryPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 14,
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.totalPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.credits:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.grandTotalPrice:
      return Theme.of(context).textTheme.labelMedium!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.bundlePrice:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    default:
      return Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ZPColors.black,
          );
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
    case PriceStyle.taxPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ZPColors.darkGray,
          );
    case PriceStyle.totalPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.black,
          );
    case PriceStyle.credits:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.black,
          );
    case PriceStyle.grandTotalPrice:
      return Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.bundlePrice:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    default:
      return Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ZPColors.black);
  }
}
