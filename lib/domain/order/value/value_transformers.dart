import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter/material.dart';

double totalPriceStringAsFixed(String value) {
  return double.parse(value);
}

bool materialIsFOC(String materialGroup) {
  return materialGroup == '6A1';
}

BonusMaterialCalculationEnum getBonusCalculationEnum(String calculation) {
  switch (calculation) {
    case '001':
      return BonusMaterialCalculationEnum.apl001;
    case '002':
      return BonusMaterialCalculationEnum.apl002;
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
    principalCode == '100225' || principalCode == '101252';

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

PriceOverrideValue getPriceOverrideValue(double value) =>
    PriceOverrideValue(value);

Zdp8OverrideValue getZdp8OverrideValue(double value) =>
    Zdp8OverrideValue(value);

bool isBonusReturnType(String prsfd) => prsfd == 'B';

int getParentLineNumberIntValue(int value) => value - (value % 10);

String getOrderStatus(String status) {
  switch (status) {
    case 'Pending release':
    case 'Pending release on backorder':
    case 'Pending release - on backorder':
    case 'Pending release - seller approval required':
      return 'Pending release';
    case 'Order Creating':
      return 'Order Created';
    case '':
      return '-';
    default:
      return status;
  }
}

bool isEqual(String value1, String value2) =>
    value1.trim().toLowerCase() == value2.trim().toLowerCase();

bool checkIsEligibleForFetchZyllemStatues(String orderStatus) =>
    isEqual(orderStatus, 'Out for delivery') ||
    isEqual(orderStatus, 'Delivered');

List<OrderHistoryStep> getOrderHistorySteps({
  required bool isViewByOrder,
  required String stepTitle,
}) {
  final baseSteps = <OrderHistoryStep>[
    if (isViewByOrder || isEqual(stepTitle, 'Order received'))
      OrderHistoryStep.empty().copyWith(
        title: 'Order received',
        icon: Icons.pending_actions,
      ),
    OrderHistoryStep.empty().copyWith(
      title: 'Order created',
      icon: Icons.inventory_outlined,
    ),
  ];

  var result = <OrderHistoryStep>[];
  if (isEqual(stepTitle, 'Cancelled') ||
      isEqual(stepTitle, 'Order Cancelled')) {
    result = <OrderHistoryStep>[
      ...baseSteps,
      OrderHistoryStep.empty().copyWith(
        title: stepTitle,
        icon: Icons.cancel,
      ),
    ];
  } else {
    final fullSteps = <OrderHistoryStep>[
      ...baseSteps,
      if (!isViewByOrder || isEqual(stepTitle, 'Pending release'))
        OrderHistoryStep.empty().copyWith(
          title: 'Pending release',
          icon: Icons.query_builder,
        ),
      OrderHistoryStep.empty().copyWith(
        title: 'Picking in progress',
        icon: Icons.inventory_2_outlined,
      ),
      OrderHistoryStep.empty().copyWith(
        title: 'Out for delivery',
        icon: Icons.local_shipping_outlined,
      ),
      OrderHistoryStep.empty().copyWith(
        title: 'Delivered',
        icon: Icons.check,
      ),
    ];

    final stepIndex = fullSteps.indexWhere(
      (step) => isEqual(step.title, stepTitle),
    );
    if (stepIndex > -1) {
      result = fullSteps.sublist(0, stepIndex + 1);
    }
  }
  if (result.isNotEmpty) {
    result = [
      if (result.length - 1 > -1) ...result.sublist(0, result.length - 1),
      result.last.copyWith(state: OrderHistoryStepStates.active),
    ];
  }

  return result.reversed.toList();
}

String getOrderSAPStatus(String status) {
  switch (status) {
    case 'Order Creating':
      return 'Order Created';
    case '':
      return '-';
    default:
      return status;
  }
}
