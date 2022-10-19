import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';

double totalPriceStringAsFixed(String value) {
  return double.parse(value);
}

bool materialIsFOC(String materialGroup) {
  return materialGroup == '6A1';
}

String currencyAlign(Currency currency, double value) {
  if (value == 0) return 'NA';
  final formattedPrice = formatAsFixed(value, 2);
  if (currency.isVN) {
    return '$formattedPrice${currency.symbol}';
  }

  return '${currency.symbol}$formattedPrice';
}

String formatAsFixed(double value, int numberAfterDecimal) {
  final numberFormatter = NumberFormat.decimalPattern();
  final formattedPrice = numberFormatter.format(
    double.parse(
      value.toStringAsFixed(numberAfterDecimal),
    ),
  );

  return formattedPrice;
}
