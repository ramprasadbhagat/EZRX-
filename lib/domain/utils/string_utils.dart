import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

class StringUtils {
  static final formatter = NumberFormat('###,###,###,###,###.00');

  static String displayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) {
    // Format the price, if price is negative applicable place a '-' sign leading sales org,
    // used where need to display price value on positive manner.
    if (price.isNegative) {
      return '- ${salesOrgConfig.currency.code} ${formatter.format(price * -1)}';
    }

    return '${salesOrgConfig.currency.code} ${formatter.format(price)}';
  }

  static String priceComponentDisplayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
    bool signedPositive,
  ) {
    // Format the price, format the price base on signed parameter,
    // only use for PriceComponent.
    if (signedPositive && price.isNegative) {
      return '${salesOrgConfig.currency.code} ${formatter.format(price * -1)}';
    }

    return '${salesOrgConfig.currency.code} ${formatter.format(price)}';
  }

  static String displayNaIfPriceIsZero(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) {
    return price == 0
        ? 'N.A.'
        : displayPrice(
            salesOrgConfig,
            price,
          );
  }

  static String displayNumber(
    double price,
  ) {
    return formatter.format(price);
  }

  static String changeToCamelCase({required String sentence}) {
    final semiCamel = sentence
        .split(' ')
        .map(
          (e) =>
              '${e.characters.getRange(0, 1).toUpperCase()}${e.characters.getRange(1).toLowerCase()}',
        )
        .toList()
        .join();

    return '${semiCamel.characters.getRange(0, 1).toLowerCase()}${semiCamel.characters.getRange(1)}';
  }

  static String displayPriceByMaterialType(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
    OrderItemType type,
  ) {
    if (type.isMaterialTypeBonus) return 'FREE';
    if (price.isNegative) {
      return '- ${salesOrgConfig.currency.code} ${formatter.format(price * -1)}';
    }

    return '${salesOrgConfig.currency.code} ${formatter.format(price)}';
  }
}
