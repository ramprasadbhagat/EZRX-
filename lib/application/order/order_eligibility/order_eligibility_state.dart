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
    required double zpSubtotal,
    required double mpSubtotal,
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
        mpSubtotal: 0,
        zpSubtotal: 0,
        subTotal: 0,
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

  String get orderEligibleTrackingErrorMessage {
    const invalidItemErrorMessage =
        'The following items have been identified in your cart:';
    if (!isMinOrderValuePassed) {
      final displayMinOrderAmount =
          StringUtils.displayPrice(configs, configs.minOrderAmount);
      final displayMPMinOrderAmount =
          StringUtils.displayPrice(configs, configs.mpMinOrderAmount);

      if (!cartItems.containMPMaterial) {
        return 'Please ensure that the order value satisfies the minimum order value of $displayMinOrderAmount}';
      }

      if (!mpSubtotalMOVEligible && !zpSubtotalMOVEligible) {
        return 'Please ensure that minimum order value is at least $displayMinOrderAmount for ZP subtotal & $displayMPMinOrderAmount for MP subtotal.';
      } else if (!zpSubtotalMOVEligible) {
        return 'Please ensure that minimum order value is at least $displayMinOrderAmount for ZP subtotal.';
      } else if (askUserToAddCommercialMaterial) {
        return 'Your cart must contain other commercial material to proceed checkout';
      } else if (isGimmickMaterialNotAllowed) {
        return 'Gimmick material $gimmickMaterialCode is not allowed';
      } else {
        return 'Please ensure that minimum order value is at least $displayMPMinOrderAmount for MP subtotal.';
      }
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
    if (cartItems.containMPMaterial) {
      return zpSubtotalMOVEligible && mpSubtotalMOVEligible;
    }

    if (salesOrg.salesOrg.checkMOVonSubTotal) {
      return subTotal >= configs.minOrderAmount;
    }

    return grandTotal >= configs.minOrderAmount;
  }

  bool get zpSubtotalMOVEligible =>
      cartItems.zpMaterialOnly.isEmpty || zpSubtotal >= configs.minOrderAmount;

  bool get mpSubtotalMOVEligible =>
      cartItems.mpMaterialOnly.isEmpty ||
      mpSubtotal >= configs.mpMinOrderAmount;

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
      cartItems.any((product) => product.isSuspendedMaterial);

  bool get cartContainsSuspendedPrincipal =>
      cartItems.any((product) => product.materialInfo.isPrincipalSuspended);

  bool get isComboNotAllowedIfPresentInCart =>
      !comboDealEligible &&
      cartItems.any((product) => product.materialInfo.type.typeCombo);

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
            (item.isSuspendedMaterial ||
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

  bool get isNotAvailableToCheckoutForID => cartItems.any(
        (element) => element.showErrorMessageForID,
      );

  bool get isCheckoutDisabled =>
      !isBundleQuantitySatisfies ||
      displayInvalidItemsBanner ||
      isNotAvailableToCheckoutForID ||
      !isMinOrderValuePassed ||
      askUserToAddCommercialMaterial ||
      isGimmickMaterialNotAllowed;

  List<bool> get activeErrorsList => [
        displayMovWarning,
        displayInvalidItemsWarning,
        isNotAvailableToCheckoutForID,
        askUserToAddCommercialMaterial,
        isGimmickMaterialNotAllowed,
      ].where((condition) => condition).toList();

  bool get hasMultipleErrors => activeErrorsList.length > 1;

  bool get is26SeriesMaterialOnlyInCart =>
      cartItems.isNotEmpty &&
      cartItems.every((element) => element.is26SeriesMaterial);

  String get gimmickMaterialCode => cartItems
      .where((element) => element.isGimmickMaterial)
      .map((e) => e.materialInfo.materialNumber.displayMatNo)
      .toList()
      .join(',');

  bool get isGimmickMaterialPresentInCart =>
      cartItems.isNotEmpty &&
      cartItems.any((element) => element.isGimmickMaterial);

  bool get isGimmickMaterialNotAllowed =>
      (!configs.enableGimmickMaterial && isGimmickMaterialPresentInCart) ||
      (!user.role.type.isSalesRepRole && isGimmickMaterialPresentInCart);

  bool get askUserToAddCommercialMaterial =>
      is26SeriesMaterialOnlyInCart ||
      (configs.enableGimmickMaterial && cartItems.isGimmickMaterialOnlyInCart);
}
