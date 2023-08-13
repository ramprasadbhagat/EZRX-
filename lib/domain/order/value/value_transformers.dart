import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double totalPriceStringAsFixed(String value) {
  return double.parse(value);
}

bool isZero(String value) {
  return double.parse(value) == 0.0;
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
bool checkMaterialTypeBonus(String type) {
  return type == 'Bonus';
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

bool validateZDP5Quantity(int quantity, String zDP5Value) =>
    zDP5Value.isEmpty ? false : quantity > int.parse(zDP5Value);

bool validateIfRemainingQtyExceeded(int quantity, String zDP5Value) =>
    zDP5Value.isEmpty ? false : quantity <= int.parse(zDP5Value);

int getParsedValue(String zDP5Value) =>
    zDP5Value.isEmpty ? 0 : int.parse(zDP5Value);

bool isValueNotEmpty(String zDP5Value) => zDP5Value.isNotEmpty;

String intToString(int value) => value == 0 ? '' : '$value';

bool checkIfSuccessful(int value) => value == 1;

double getDoubleParsedValue(String value) =>
    value.isEmpty ? 0 : double.parse(value);

String getPaymentTermValue(String value) => value.isEmpty
    ? ''
    : value.characters.getRange(0, value.indexOf('-')).string;
    

