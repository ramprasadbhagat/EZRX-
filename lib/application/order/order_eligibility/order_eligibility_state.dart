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

    return isNotSuspended
        ? isCartContainsNonSampleMaterial
            ? isTotalGreaterThanMinOrderAmount
            : true
        : false;
  }

  bool get isTotalGreaterThanMinOrderAmount {
    if (salesOrg.salesOrg.isTH) {
      return subTotal >= double.parse(configs.minOrderAmount);
    }
    
    return grandTotal >= double.parse(configs.minOrderAmount);
  }

  bool get isNotSuspended {
    return !shipInfo.status.isSuspended && !customerCodeInfo.status.isSuspended;
  }

  bool get isCartContainsNonSampleMaterial {
    return cartItems
        .where((element) => (!element.materialInfo.isSampleMaterial))
        .isNotEmpty;
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
    return user.role.type.isSalesRep
        ? cartItems.where((element) => element.hasSalesRepPrincipal).isNotEmpty
        : cartItems.where((element) => element.hasClientPrincipal).isNotEmpty;
  }

  bool get isDisablePriceOverRide =>
      user.role.type.isSalesRep &&
      !configs.disableOrderType &&
      eligibleOrderType;
}
