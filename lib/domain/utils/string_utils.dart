import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:intl/intl.dart';

class StringUtils {
  static final formatter = NumberFormat('###,###,###,###,###.##');

  static String displayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) {
    if (salesOrgConfig.currency.isVN) {
      return '${formatter.format(price)} ${salesOrgConfig.currency.code}';
    }

    if (price.isNegative) {
      return '- ${salesOrgConfig.currency.code} ${formatter.format(price * -1)}';
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
}
