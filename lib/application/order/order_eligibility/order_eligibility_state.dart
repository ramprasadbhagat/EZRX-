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

  bool get hasMinistryOfHealthProduct => cartItems.any(
        (element) =>
            element.materialInfo.principalData.principalCode.isMinistryOfHealth,
      );

  bool get isMinOrderValuePassed {
    if (hasPrincipal) {
      return true;
    }
    if (eligibleOrderType) {
      return true;
    }
    if (hasMinistryOfHealthProduct) {
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
      !cartContainsSuspendedMaterials &&
      !cartContainsSuspendedPrincipal &&
      !isComboNotAllowedIfPresentInCart;

  String get orderEligibleTrackingErrorMessage {
    const invalidItemErrorMessage =
        'The following items have been identified in your cart:';
    if (!isMinOrderValuePassed) {
      return 'Please ensure that the order value satisfies the minimum order value of ${StringUtils.displayPrice(configs, double.tryParse(configs.minOrderAmount) ?? 0)}';
    }
    if (isMWPNotAllowedAndPresentInCart) {
      return '$invalidItemErrorMessage Material without price';
    }
    if (!isOOSAllowedIfPresentInCart) {
      return '$invalidItemErrorMessage Out of stock material';
    }
    if (cartContainsSuspendedMaterials) {
      return '$invalidItemErrorMessage Principle suspended material';
    }
    if (cartContainsSuspendedMaterials) {
      return '$invalidItemErrorMessage Suspended material';
    }
    if (!isBundleQuantitySatisfies) {
      return '$invalidItemErrorMessage Unsatisfied qty bundle';
    }

    return '';
  }

  bool get comboDealEligible {
    if (!configs.enableComboDeals) return false;
    if (customerCodeInfo.salesDeals.isEmpty) return false;

    final comboDealUserRole = configs.comboDealsUserRole;
    final userRole = user.role.type;

    if (comboDealUserRole.isAllUsers) {
      return true;
    }

    if (comboDealUserRole.isCustomerOnly && userRole.isCustomer) {
      return true;
    }

    if (comboDealUserRole.isSalesRepOnly && userRole.isSalesRepRole) {
      return true;
    }

    return false;
  }

  bool get isTotalGreaterThanMinOrderAmount {
    if (salesOrg.salesOrg.checkMOVonSubTotal) {
      return subTotal >= double.parse(configs.minOrderAmount);
    }

    return grandTotal >= double.parse(configs.minOrderAmount);
  }

  bool get isAccountSuspended {
    return customerCodeInfo.status.isSuspended || shipInfo.status.isSuspended;
  }

  bool get isCartItemsContainsFOCMaterial {
    return cartItems
        .where((element) => element.materialInfo.isFOCMaterial)
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

  bool get displayMovWarning =>
      !isMinOrderValuePassed && showErrorMessage && !isAccountSuspended;

  bool get displayOOSWarning =>
      !isOOSAllowedIfPresentInCart && showErrorMessage;

  bool get displayInvalidItemsWarning =>
      displayInvalidItemsBanner && showErrorMessage;

  /*MWP: Material Without Price*/
  bool get isMWPNotAllowedAndPresentInCart =>
      cartItems.any(
        (e) => e.materialInfo.type.typeMaterial && e.price.finalPrice.isEmpty,
      ) &&
      !configs.materialWithoutPrice;

  bool get isOOSAllowedIfPresentInCart =>
      ((_isOOSOrderPresent && isOOSOrderAllowedToSubmit) ||
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
        .getTotalQuantityOfBundleProduct;
  }

  bool get isOOSOrderAllowedToSubmit => (configs.addOosMaterials
          .getOrDefaultValue(false) &&
      (configs.oosValue.isOosValueZero ? user.role.type.isSalesRepRole : true));

  bool get _isOOSOrderPresent =>
      cartItems.any((element) => element.isAnyOOSItemPresentInCart);

  bool get displayMWPNotAllowedWarning =>
      isMWPNotAllowedAndPresentInCart && showErrorMessage;

  bool get cartContainsSuspendedMaterials =>
      cartItems.any((product) => product.materialInfo.isSuspended);

  bool get cartContainsSuspendedPrincipal =>
      cartItems.any((product) => product.materialInfo.isPrincipalSuspended);

  bool get isComboNotAllowedIfPresentInCart =>
      !comboDealEligible &&
      cartItems.any((product) => product.materialInfo.type.typeCombo);

  bool get isCheckoutNotAllowed =>
      isComboNotAllowedIfPresentInCart ||
      shipInfo.customerBlock.isCustomerBlocked;

  bool get displayInvalidItemsBanner =>
      cartContainsSuspendedMaterials ||
      isMWPNotAllowedAndPresentInCart ||
      !isOOSAllowedIfPresentInCart ||
      cartContainsSuspendedPrincipal ||
      isComboNotAllowedIfPresentInCart;

  List<MaterialInfo> get invalidMaterialCartItems => cartItems
      .where(
        (item) =>
            item.materialInfo.type.typeMaterial &&
            (item.materialInfo.isSuspended ||
                item.materialInfo.isPrincipalSuspended ||
                (item.price.finalPrice.isEmpty &&
                    isMWPNotAllowedAndPresentInCart) ||
                (!item.inStock && !isOOSAllowedIfPresentInCart)),
      )
      .map((item) => item.materialInfo.copyWith(quantity: MaterialQty(0)))
      .toList();

  bool get displayPriceNotAvailableMessage =>
      configs.materialWithoutPrice &&
      cartItems.any(
        (e) => e.materialInfo.type.typeMaterial && e.invalidPrice,
      );

  List<MaterialInfo> get invalidBundleCartItems => cartItems
      .where((element) => element.materialInfo.type.typeBundle)
      .expand(
        (element) => element.bundle.materials
            .where(
              (element) =>
                  (!element.inStock && !isOOSAllowedIfPresentInCart) ||
                  element.isSuspended,
            )
            .map(
              (e) => e.copyWith(
                quantity: MaterialQty(0),
                parentID: element.bundle.bundleCode,
              ),
            ),
      )
      .toList();

  List<PriceAggregate> get invalidComboItems => cartItems
      .where((item) => !comboDealEligible && item.materialInfo.type.typeCombo)
      .expand(
        (item) => item.convertComboItemToPriceAggregateList.map(
          (priceAggregate) => priceAggregate.copyWith(
            quantity: 0,
            price: priceAggregate.price.copyWith(
              comboDeal:
                  priceAggregate.price.comboDeal.copyWith(isEligible: false),
            ),
          ),
        ),
      )
      .toList();

  List<MaterialInfo> get invalidCartItems =>
      [...invalidMaterialCartItems, ...invalidBundleCartItems];

  bool get displayInvalidOOSOnCartItem =>
      !isOOSOrderAllowedToSubmit && configs.hideStockDisplay;
}
