import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

class PriceComponent extends StatelessWidget {
  const PriceComponent({
    Key? key,
    required this.salesOrgConfig,
    required this.price,
    this.title = '',
    this.priceTextStyle,
    this.currencyCodeTextStyle,
    this.priceLabelStyle,
    this.obscured = false,
  }) : super(key: key);

  final SalesOrganisationConfigs salesOrgConfig;
  final String price;
  final String title;
  final TextStyle? priceTextStyle;
  final TextStyle? currencyCodeTextStyle;
  final TextStyle? priceLabelStyle;
  final bool obscured;

  List<TextSpan> _getTextSpan(BuildContext context) {
    final textSpans = <TextSpan>[];
    final notPrice = price.contains(RegExp(r'[A-Za-z]'));
    final defaultStyle = Theme.of(context).textTheme.labelSmall;

    final priceValue = notPrice
        ? price.tr()
        : StringUtils.displayPrice(salesOrgConfig, double.parse(price));
    final obscuredValue = priceValue.replaceAll(RegExp(r'[0-9]'), '*');

    if (title.isNotEmpty) {
      textSpans.add(
        TextSpan(
          text: title,
          style: priceLabelStyle ?? priceTextStyle ?? defaultStyle,
        ),
      );
    }
    if (notPrice) {
      textSpans.add(
        TextSpan(
          text: obscured ? obscuredValue : priceValue,
          style: priceTextStyle ?? defaultStyle,
        ),
      );

      return textSpans;
    }
    final amount = priceValue.split(' ').last;
    //currency
    textSpans.add(
      TextSpan(
        text: priceValue.replaceAll(amount, ''),
        style: currencyCodeTextStyle ?? defaultStyle,
      ),
    );
    //amount
    textSpans.add(
      TextSpan(
        text: obscured ? obscuredValue : amount,
        style: priceTextStyle ?? defaultStyle,
      ),
    );

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          ..._getTextSpan(context),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
