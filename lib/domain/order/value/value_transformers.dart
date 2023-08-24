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

bool isBonusMaterialMaxQuantityExceed(int qty) => qty > 999;

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

bool havingPrincipalCodeForAllMaterial(String principalCode) =>
    principalCode == '0000000000';

bool havingSubmitPrincipalForClient(String principalCode) =>
    principalCode == '100822';

bool havingSubmitPrincipalForSalesRep(String principalCode) =>
    principalCode == '100225';

bool havingPnGPrincipalCode(String principalCode) =>
    principalCode == '105307' || principalCode == '101308';

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
