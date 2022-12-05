import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';

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
bool checkMatrialType(String type) {
  return type == 'Comm';
}