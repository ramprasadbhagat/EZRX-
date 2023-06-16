import 'dart:ui';

import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

double totalPriceStringAsFixed(String value) {
  return double.parse(value);
}

bool materialIsFOC(String materialGroup) {
  return materialGroup == '6A1';
}

BonusMaterialCalculationEnum getBonusCalculationEnum(String calculation) {
  switch (calculation) {
    case '915':
      return BonusMaterialCalculationEnum.calculation915;
    case '914':
      return BonusMaterialCalculationEnum.calculation914;
    case '913':
      return BonusMaterialCalculationEnum.calculation913;
    case '911':
      return BonusMaterialCalculationEnum.calculation911;
    case '912':
    default:
      return BonusMaterialCalculationEnum.calculation912;
  }
}

bool materialQtyConformZDP5Rule(int qtyValue, String zdp5Value) {
  try {
    final zdp5ValueNumber = int.parse(zdp5Value);

    return qtyValue >= zdp5ValueNumber;
  } catch (_) {
    return false;
  }
}

String materialGroup4Type(bool isFoc) {
  return isFoc ? 'ZPFC' : 'ZPOR';
}

bool checkMaterialType(String type) {
  return type == 'Comm';
}

bool contractIs730(String tenderReason) {
  return tenderReason == '730';
}

bool materialBundleTypeIsPercent(String bundleType) {
  return bundleType == '%';
}

bool materialTaxClassificationIsNoTax(String taxClassification) {
  return taxClassification == 'noTax';
}

bool materialTaxClassificationIsExempt(String taxClassification) {
  return taxClassification == 'Exempt';
}

bool materialTaxClassificationIsFullTax(String taxClassification) {
  return taxClassification == 'Product : Full Tax';
}

bool havingSubmitPrincipalForClient(String principalCode) {
  return principalCode == '100822';
}

bool havingPnGPrincipalCode(String principalCode) {
  return principalCode == '105307' || principalCode == '101308';
}

bool isPrincipalCodeForAll(String principalCode) {
  return principalCode == '0000000000';
}

bool havingSubmitPrincipalForSalesRep(String principalCode) {
  return principalCode == '100225';
}

Color getDueDateColor(String statusType) {
  return statusType == 'Overdue' ? ZPColors.red : ZPColors.black;
}

Color getStatusLabelColor(String statusType) {
  switch (statusType) {
    case 'Processed':
    case 'Successful':
    case 'Approved for Return':
    case 'FAILED':
      return ZPColors.lightSecondary;
    case 'Cancelled':
    case 'Failed':
    case 'Cancelled - credit issue':
    case 'Cancelled - duplicate order':
    case 'Cancelled - license invalid / expired':
    case 'Cancelled - stock unavailable':
    case 'Cancelled by buyer':
    case 'Cancelled by Seller':
      return ZPColors.lightRedStatusColor;
    case 'Pending':
    case 'Picking in-progress':
    case 'Order Created':
    case 'Out for delivery':
    case 'Pending Approval':
    case 'Out for re-delivery':
    case 'Not Available':
    case 'In Process':
    case 'Order Creating':
    case 'On the way to you':
    case 'Order being prepared':
    case 'Pending release':
    case 'Pending release - credit check':
    case 'Pending release - license issue':
    case 'Pending release - month end closing':
    case 'Pending release - on backorder':
    case 'Pending release - seller approval required':
    case 'order pending':
    case 'Order packed and ready for delivery':
      return ZPColors.lightYellow;
    case 'Cleared':
      return ZPColors.invoiceStatusGreen;
    case 'Overdue':
      return ZPColors.lightRedStatusColor;
    case 'Open':
      return ZPColors.invoiceStatusBlue;
    case 'In progress':
      return ZPColors.invoiceStatusOrange;

    case 'In Progress':
      return ZPColors.lightGray;
    case 'Completed':
    case 'Delivered':
    case 'Delivered - partial rejection':
    case 'Delivered - rejected upon delivery':
      return ZPColors.secondary;
    default:
      return ZPColors.lightYellow;
  }
}

bool validateZDP5Quantity(int quantity, String zDP5Value) =>
    zDP5Value.isEmpty ? false : quantity > int.parse(zDP5Value);

bool validateIfRemainingQtyExceeded(int quantity, String zDP5Value) =>
    zDP5Value.isEmpty ? false : quantity <= int.parse(zDP5Value);

int getParsedValue(String zDP5Value) =>
    zDP5Value.isEmpty ? 0 : int.parse(zDP5Value);

bool isValueNotEmpty(String zDP5Value) => zDP5Value.isNotEmpty;

String intToString(int value) => value == 0 ? '' : '$value';
