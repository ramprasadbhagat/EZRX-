part of 'order_eligibility_bloc.dart';

@freezed
class OrderEligibilityState with _$OrderEligibilityState {
  const OrderEligibilityState._();

  const factory OrderEligibilityState({
    required List<PriceAggregate> cartItems,
    required SalesOrganisationConfigs configs,
    required SalesOrganisation salesOrg,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required String orderType,
    required User user,
    required double subTotal,
  }) = _OrderEligibilityState;

  factory OrderEligibilityState.initial() => OrderEligibilityState(
        cartItems: <PriceAggregate>[],
        grandTotal: 0.0,
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipInfo: ShipToInfo.empty(),
        orderType: '',
        configs: SalesOrganisationConfigs.empty(),
        salesOrg: SalesOrganisation.empty(),
        user: User.empty(),
        subTotal: 0.0,
      );

  bool get isMinOrderValuePassed {
    if (hasPrincipal) {
      return false;
    }
    if (eligibleOrderType) {
      return true;
    }
    if (isCartItemsContainsFOCMaterial) {
      return true;
    }

    return !isAccountSuspended ? isTotalGreaterThanMinOrderAmount : false;
  }

  bool get eligibleForOrderSubmit =>
      isMinOrderValuePassed && validateRegularOrderType;

  bool get isTotalGreaterThanMinOrderAmount {
    if (salesOrg.salesOrg.isTH) {
      return subTotal >= double.parse(configs.minOrderAmount);
    }

    return grandTotal >= double.parse(configs.minOrderAmount);
  }

  bool get isAccountSuspended {
    return customerCodeInfo.status.isSuspended || shipInfo.status.isSuspended;
  }

  bool get isCartItemsContainsFOCMaterial {
    return cartItems
        .where((element) => element.materialInfo.materialGroup4.isFOC)
        .isNotEmpty;
  }

  bool get eligibleOrderType {
    return orderType.isNotEmpty &&
        (orderType.contains('ZPFC') || orderType.contains('ZPFB'));
  }

  bool get hasPrincipal {
    return user.role.type.isSalesRepRole
        ? cartItems.where((element) => element.hasSalesRepPrincipal).isNotEmpty
        : cartItems.where((element) => element.hasClientPrincipal).isNotEmpty;
  }

  bool get containsRegularMaterials => cartItems
      .any((element) => !element.materialInfo.isSpecialOrderTypeMaterial);

  bool get validateRegularOrderType =>
      orderType.contains('ZPOR') && !configs.salesOrg.isTH ? containsRegularMaterials : true;
}
