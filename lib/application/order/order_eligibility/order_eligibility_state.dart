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
    required bool showErrorMessage,
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
        showErrorMessage: false,
      );

  bool get isMinOrderValuePassed {
    if (hasPrincipal) {
      return true;
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
      isMinOrderValuePassed &&
      !isMWPNotAllowedAndPresentInCart &&
      isOOSAllowedIfPresentInCart &&
      isBundleQuantitySatisfies &&
      !cartContainsSuspendedMaterials;

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
    return user.role.type.isExternalSalesRep &&
        cartItems.where((element) => element.hasSalesRepPrincipal).isNotEmpty;
  }

  bool get containsRegularMaterials => cartItems
      .any((element) => !element.materialInfo.isSpecialOrderTypeMaterial);

  bool get validateRegularOrderType =>
      orderType.contains('ZPOR') && !configs.salesOrg.isTH
          ? containsRegularMaterials
          : true;

  bool get displayMovWarning => !isMinOrderValuePassed && showErrorMessage;

  bool get displayOOSWarning =>
      !isOOSAllowedIfPresentInCart && showErrorMessage;

  /*MWP: Material Without Price*/
  bool get isMWPNotAllowedAndPresentInCart =>
      cartItems.any(
        (e) => e.materialInfo.type.typeMaterial && e.price.finalPrice.isEmpty,
      ) &&
      !configs.materialWithoutPrice;

  bool get isOOSAllowedIfPresentInCart =>
      ((_isOOSOrderPresent && _isOOSOrderAllowedToSubmit) ||
          !_isOOSOrderPresent);

  bool get isBundleQuantitySatisfies => cartItems
      .where((element) => element.materialInfo.type.typeBundle)
      .map((e) => e.bundle)
      .every(
        (element) =>
            getTotalQuantityOfProductBundle(
              bundleCode: element.bundleCode,
            ) >=
            element.minimumQuantityBundleMaterial.quantity,
      );

  int getTotalQuantityOfProductBundle({required String bundleCode}) {
    return cartItems
            .firstWhere(
              (element) => element.bundle.bundleCode == bundleCode,
              orElse: () => PriceAggregate.empty(),
            )
            .bundle
            .materials
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.quantity,
            ) ??
        0;
  }

  bool get _isOOSOrderAllowedToSubmit => (configs.addOosMaterials
          .getOrDefaultValue(false) &&
      (configs.oosValue.isOosValueZero ? user.role.type.isSalesRepRole : true));

  bool get _isOOSOrderPresent =>
      cartItems.any((element) => element.isAnyOOSItemPresentInCart);

  bool get displayMWPNotAllowedWarning =>
      isMWPNotAllowedAndPresentInCart && showErrorMessage;

  bool get cartContainsSuspendedMaterials =>
      cartItems.any((product) => product.materialInfo.isSuspended);

  List<MaterialInfo> get invalidCartItems => cartItems
      .where(
        (item) => item.materialInfo.isSuspended,
      )
      .map((item) => item.materialInfo.copyWith(quantity: 0))
      .toList();
}
