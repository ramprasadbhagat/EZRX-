import 'package:easy_localization/easy_localization.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
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
  }) : super(key: key);

  final SalesOrganisationConfigs salesOrgConfig;
  final String price;
  final String title;
  final TextStyle? priceTextStyle;
  final TextStyle? currencyCodeTextStyle;

  @override
  Widget build(BuildContext context) {
    final notPriceString = price.contains(RegExp(r'[A-Za-z]'));

    final priceValue = notPriceString
        ? price.tr()
        : StringUtils.displayPrice(salesOrgConfig, double.parse(price));

    final defaultStyle = Theme.of(context).textTheme.labelSmall;

    return EasyRichText(
      '$title$priceValue',
      defaultStyle: priceTextStyle ?? defaultStyle,
      overflow: TextOverflow.ellipsis,
      patternList: [
        EasyRichTextPattern(
          targetString: salesOrgConfig.currency.code,
          style: currencyCodeTextStyle ?? defaultStyle,
        ),
        EasyRichTextPattern(
          targetString: '',
          style: priceTextStyle ?? defaultStyle,
        ),
      ],
    );
  }
}
