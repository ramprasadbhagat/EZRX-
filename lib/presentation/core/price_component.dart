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

  bool get _isNegativePrice => type == PriceStyle.negativePrice;

  List<TextSpan> _getTextSpan(BuildContext context) {
    final textSpans = <TextSpan>[];
    final notPrice = price.contains(RegExp(r'[A-Za-z]'));
    final priceTextStyle = _priceStyle(context, type);
    final currencyCodeTextStyle = _currencyCodeTextStyle(context, type);
    final singleCommaTextStyle = _currencyCodeTextStyle(context, type).copyWith(
      color: _isNegativePrice ? ZPColors.priceNegative : null,
    );

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
      textSpans.add(TextSpan(text: '(', style: singleCommaTextStyle));
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
      textSpans.add(TextSpan(text: ')', style: singleCommaTextStyle));
    }

    if (type == PriceStyle.bundlePrice ||
        type == PriceStyle.bundleListPriceStrikeThrough ||
        type == PriceStyle.bundleActiveOfferPrice ||
        type == PriceStyle.materialListPriceStrikeThrough ||
        type == PriceStyle.bundleFinalPrice) {
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
  bundleActiveOfferPrice,
  bundleFinalPrice,
  bundleListPriceStrikeThrough,
  counterOfferPrice,
  bonusPrice,
  taxPrice,
  totalPrice,
  summaryPrice,
  grandTotalPrice,
  credits,
  paymentInProgressPrice,
  comboOfferPrice,
  comboOfferPriceDiscounted,
  comboSubTotalItemWithTax,
  comboSubTotalExclTax,
  negativePrice,
  returnBonusPrice,
  materialListPriceStrikeThrough,
}

Color _priceTextColor(PriceStyle type) {
  switch (type) {
    case PriceStyle.paymentInProgressPrice:
    case PriceStyle.commonPrice:
    case PriceStyle.bundleActiveOfferPrice:
    case PriceStyle.comboSubTotalExclTax:
      return ZPColors.primary;

    case PriceStyle.summaryPrice:
    case PriceStyle.totalPrice:
    case PriceStyle.credits:
    case PriceStyle.grandTotalPrice:
    case PriceStyle.bundlePrice:
      return ZPColors.neutralsBlack;

    case PriceStyle.comboOfferPrice:
    case PriceStyle.comboOfferPriceDiscounted:
      return ZPColors.darkerGrey;

    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
    case PriceStyle.bonusPrice:
    case PriceStyle.taxPrice:
    case PriceStyle.comboSubTotalItemWithTax:
    case PriceStyle.bundleFinalPrice:
    case PriceStyle.materialListPriceStrikeThrough:
      return ZPColors.darkGray;

    case PriceStyle.negativePrice:
      return ZPColors.priceNegative;
    default:
      return ZPColors.black;
  }
}

TextDecoration? _priceTextDecoration(PriceStyle type) {
  switch (type) {
    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
    case PriceStyle.comboOfferPrice:
    case PriceStyle.materialListPriceStrikeThrough:
      return TextDecoration.lineThrough;
    default:
      return null;
  }
}

TextStyle _priceStyle(BuildContext context, PriceStyle type) {
  var priceTextStyle = Theme.of(context).textTheme.labelSmall;
  switch (type) {
    case PriceStyle.comboSubTotalItemWithTax:
      priceTextStyle = Theme.of(context).textTheme.labelSmall!.copyWith(
            fontSize: 12,
          );
      break;
    case PriceStyle.bundleFinalPrice:
    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
    case PriceStyle.materialListPriceStrikeThrough:
      priceTextStyle = Theme.of(context).textTheme.bodySmall!;
      break;
    case PriceStyle.bonusPrice:
    case PriceStyle.summaryPrice:
    case PriceStyle.returnBonusPrice:
    case PriceStyle.comboOfferPriceDiscounted:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!;
      break;
    case PriceStyle.taxPrice:
    case PriceStyle.comboOfferPrice:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 12,
          );
      break;
    case PriceStyle.totalPrice:
    case PriceStyle.credits:
      priceTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w900,
          );
      break;
    case PriceStyle.grandTotalPrice:
      priceTextStyle = Theme.of(context).textTheme.labelMedium;
      break;
    case PriceStyle.comboSubTotalExclTax:
      priceTextStyle = Theme.of(context).textTheme.labelMedium;
      break;
    case PriceStyle.bundlePrice:
      priceTextStyle = Theme.of(context).textTheme.labelLarge;
      break;
    default:
      break;
  }

  return priceTextStyle!.copyWith(
    color: _priceTextColor(type),
    decoration: _priceTextDecoration(type),
  );
}

TextStyle _currencyCodeTextStyle(BuildContext context, PriceStyle type) {
  switch (type) {
    case PriceStyle.commonPrice:
    case PriceStyle.bundleActiveOfferPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.bundleListPriceStrikeThrough:
    case PriceStyle.materialListPriceStrikeThrough:
    case PriceStyle.counterOfferPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkGray,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.bonusPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkGray,
          );
    case PriceStyle.taxPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 12,
            color: ZPColors.darkGray,
          );
    case PriceStyle.grandTotalPrice:
      return Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.bundlePrice:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
            color: ZPColors.neutralsBlack,
          );
    case PriceStyle.paymentInProgressPrice:
      return Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: ZPColors.primary);
    case PriceStyle.comboOfferPrice:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkerGrey,
            fontSize: 12,
            decoration: TextDecoration.lineThrough,
          );
    case PriceStyle.comboOfferPriceDiscounted:
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            color: ZPColors.darkerGrey,
          );
    case PriceStyle.comboSubTotalItemWithTax:
      return Theme.of(context).textTheme.labelSmall!.copyWith(
            color: ZPColors.darkGray,
            fontSize: 12,
          );
    case PriceStyle.comboSubTotalExclTax:
      return Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ZPColors.primary,
          );
    case PriceStyle.bundleFinalPrice:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.darkGray,
          );
    case PriceStyle.returnBonusPrice:
    default:
      return Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ZPColors.black);
  }
}
