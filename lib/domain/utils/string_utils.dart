import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

class StringUtils {
  static String displayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) {
    if (salesOrgConfig.currency.isVN) {
      return '${price.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
    }

    if (price.isNegative) {
      return '- ${salesOrgConfig.currency.code} ${(price * -1).toStringAsFixed(2)}';
    }

    return '${salesOrgConfig.currency.code} ${price.toStringAsFixed(2)}';
  }
}
