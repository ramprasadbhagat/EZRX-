import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

double totalPriceStringAsFixed(String value) {
  return double.parse(value);
}

bool materialIsFOC(String materialGroup) {
  return materialGroup == '6A1';
}

String currencyAlign(
  Currency currency,
  bool hidePrice,
  double value,
  bool isFoc,
) {
  if (hidePrice || isFoc) return 'NA';
  final formattedPrice = formatAsFixed(value, 2);

  return '${currency.code} $formattedPrice';
  // if (currency.isVN) {
  //   return '$formattedPrice${currency.symbol}';
  // }

  // return '${currency.symbol}$formattedPrice';
}

String totalPrice(
  Currency currency,
  bool isFoc,
  bool hidePrice,
  double value,
  int quantity,
) {
  if (hidePrice || isFoc) return 'NA';
  final total = value * quantity;
  final formattedPrice = formatAsFixed(total, 2);

  return '${currency.code} $formattedPrice';
}

String unitPrice(
  Currency currency,
  bool isFoc,
  bool hidePrice,
  bool isVNUser,
  bool enableVat,
  bool enableTaxClassification,
  int vatValue,
  MaterialTaxClassification taxClassification,
  List taxes,
  double value,
) {
  if (hidePrice || isFoc) return 'NA';

  var finalPrice = value;
  finalPrice = isVNUser
      ? enableVat && enableTaxClassification
          ? value +
              (value * ((taxes).isNotEmpty ? double.parse(taxes[0]) * 0.01 : 0))
          : value
      : enableTaxClassification && !taxClassification.isExempt()
          ? !taxClassification.isNoTax()
              ? value + (value * vatValue * 0.01)
              : value
          : value;

  final formattedPrice = formatAsFixed(finalPrice, 2);

  return '${currency.code} $formattedPrice';
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

bool materialQtyConformZDP5Rule(int qtyValue, String zdp5Value) {
  try {
    final zdp5ValueNumber = int.parse(zdp5Value);

    return qtyValue >= zdp5ValueNumber;
  } catch (_) {
    return false;
  }
}
