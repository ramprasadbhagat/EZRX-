import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

class StringUtils {
  static String displayPrice(
    SalesOrganisationConfigs salesOrgConfig,
    double price,
  ) {
    if (salesOrgConfig.currency.isVN) {
      return '${price.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
    }

    return '${salesOrgConfig.currency.code} ${price.toStringAsFixed(2)}';
  }
}
