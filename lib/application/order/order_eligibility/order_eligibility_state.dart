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
      );

  bool get isMinOrderValuePassed {
    if (hasPrinciple) {
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
            ? isGrandTotalIsGreaterThanMinOrderAmount
            : true
        : false;
  }

  bool get isGrandTotalIsGreaterThanMinOrderAmount {
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

  bool get hasPrinciple {
    return user.role.type.isSalesRep
        ? cartItems.where((element) => element.hasSalesRepPrinciple).isNotEmpty
        : cartItems.where((element) => element.hasClientPrinciple).isNotEmpty;
  }
}
