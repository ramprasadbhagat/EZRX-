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
      if (cartItems.containInvalidTenderContractMaterial) {
        return 'Tender Contract is no longer available for one or few item(s). Please remove to continue.';
      }
      if (cartItems.isMaxQtyExceedsForAnyTender) {
        return 'One or few item(s) order qty exceed the maximum available tender quantity.';
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

  bool get containsRegularMaterials => cartItems
      .any((element) => !element.materialInfo.isSpecialOrderTypeMaterial);

  bool get validateRegularOrderType =>
      isContainIgnoreCase(orderType, 'zpor') && !configs.salesOrg.isTH
          ? containsRegularMaterials
          : true;

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
      .every((e) => e.miniumQtySatisfied);

  bool get isOOSOrderAllowedToSubmit => (configs.addOosMaterials
          .getOrDefaultValue(false) &&
      (configs.oosValue.isOosValueZero ? user.role.type.isSalesRepRole : true));

  bool get _isOOSOrderPresent =>
      cartItems.any((element) => element.containOOSItem);

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
      isGimmickMaterialNotAllowed ||
      hasInvalidTenderMaterial ||
      isMaxQtyExceedsForAnyTender ||
      displayAtLeastOneItemInStockWarning;

  List<bool> get activeErrorsList => [
        displayMovWarning,
        displayInvalidItemsWarning,
        isNotAvailableToCheckoutForID,
        askUserToAddCommercialMaterial,
        isGimmickMaterialNotAllowed,
        hasInvalidTenderMaterial,
        isMaxQtyExceedsForAnyTender,
        displayAtLeastOneItemInStockWarning,
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

  bool get hasInvalidTenderMaterial =>
      cartItems.isNotEmpty && cartItems.containInvalidTenderContractMaterial;

  bool get isMaxQtyExceedsForAnyTender =>
      cartItems.isNotEmpty && cartItems.isMaxQtyExceedsForAnyTender;

  bool get isGimmickMaterialNotAllowed =>
      (!configs.enableGimmickMaterial && isGimmickMaterialPresentInCart) ||
      (!user.role.type.isSalesRepRole && isGimmickMaterialPresentInCart);

  bool get askUserToAddCommercialMaterial =>
      is26SeriesMaterialOnlyInCart ||
      (configs.enableGimmickMaterial && cartItems.isGimmickMaterialOnlyInCart);

  //============================================================
  // Minimum order value
  //
  //============================================================
  bool get displayMovWarning =>
      !isMinOrderValuePassed && showErrorMessage && !isAccountSuspended;

  bool get isMinOrderValuePassed {
    if (_hasPrincipal) {
      return true;
    }
    if (_eligibleOrderType) {
      return true;
    }
    if (_hasMinistryOfHealthProduct) {
      return true;
    }
    if (_isCartItemsContainsFOCMaterial) {
      return true;
    }
    if (cartItems.hasTenderContract) {
      return true;
    }

    return !isAccountSuspended ? isTotalGreaterThanMinOrderAmount : false;
  }

  bool get isAccountSuspended {
    if (salesOrg.salesOrg.isID) return shipInfo.customerBlock.isCustomerBlocked;

    return customerCodeInfo.status.isSuspended || shipInfo.status.isSuspended;
  }

  bool get _hasMinistryOfHealthProduct =>
      cartItems.containMinistryOfHealthMaterial;

  bool get _hasPrincipal =>
      user.role.type.isExternalSalesRep &&
      cartItems.where((e) => e.hasSalesRepPrincipal).isNotEmpty;

  bool get _eligibleOrderType =>
      orderType.isNotEmpty && isContainIgnoreCase(orderType, 'zpfc') ||
      isContainIgnoreCase(orderType, 'zpfb');

  bool get _isCartItemsContainsFOCMaterial => cartItems
      .where((element) => element.materialInfo.isFOCMaterial)
      .isNotEmpty;

  bool get isTotalGreaterThanMinOrderAmount {
    if (cartItems.containMPMaterial) {
      return zpSubtotalMOVEligible && mpSubtotalMOVEligible;
    }

    if (zpSmallOrderFeeEnable) return true;

    if (salesOrg.salesOrg.checkMOVonSubTotal) {
      return subTotal >= configs.minOrderAmount;
    }

    return grandTotal >= configs.minOrderAmount;
  }

  // If small order fee is enabled, will validate MOV using value from SAP instead of from SalesConfig
  bool get zpSubtotalMOVEligible =>
      cartItems.zpMaterialOnly.isEmpty ||
      zpSubtotal >= configs.minOrderAmount ||
      zpSmallOrderFeeEnable;

  bool get mpSubtotalMOVEligible =>
      cartItems.mpMaterialOnly.isEmpty ||
      mpSubtotal >= configs.mpMinOrderAmount ||
      mpSmallOrderFeeEnable;

  //============================================================
  // Small order fee
  //
  //============================================================
  TRObject get smallOrderFeeAppliedMessage {
    final zpSAPMOV =
        StringUtils.displayPrice(configs, configs.sapMinOrderAmount);
    final mpSAPMOV =
        StringUtils.displayPrice(configs, configs.mpSAPMinOrderAmount);

    if (zpSmallOrderFeeApplied && mpSmallOrderFeeApplied) {
      return TRObject(
        'A small order fee applies to orders with ZP and MP in-stock items separately that are under the minimum order value of {zpSmallOrderFee} ZP subtotal & {mpSmallOrderFee} for MP subtotal.',
        arguments: {
          'zpSmallOrderFee': zpSAPMOV,
          'mpSmallOrderFee': mpSAPMOV,
        },
      );
    } else if (zpSmallOrderFeeApplied) {
      return TRObject(
        'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
        arguments: {'smallOrderFee': zpSAPMOV},
      );
    } else {
      return TRObject(
        'A small order fee applies to orders with MP in-stock items that are under the minimum order value of {smallOrderFee} for MP subtotal.',
        arguments: {'smallOrderFee': mpSAPMOV},
      );
    }
  }

  bool get smallOrderFeeApplied =>
      zpSmallOrderFeeApplied || mpSmallOrderFeeApplied;

  double get smallOrderFee => zpSmallOrderFee + mpSmallOrderFee;

  double get zpSmallOrderFee =>
      zpSmallOrderFeeApplied ? configs.smallOrderFee : 0.0;

  double get mpSmallOrderFee =>
      mpSmallOrderFeeApplied ? configs.mpSmallOrderFee : 0.0;

  bool get zpSmallOrderFeeApplied {
    if (!zpSmallOrderFeeEnable) return false;
    if (displayAtLeastOneZPItemInStockWarning) return false;
    if (cartItems.zpMaterialOnly.isMOVExclusion) return false;

    if (cartItems.zpMaterialOnly.containCovidMaterial) return false;

    if (cartItems.zpMaterialOnly.containMinistryOfHealthMaterial &&
        configs.salesOrg.isSg) return false;

    return cartItems.zpMaterialOnly.subtotalWithInStockOnly <
        configs.sapMinOrderAmount;
  }

  bool get mpSmallOrderFeeApplied {
    if (!mpSmallOrderFeeEnable) return false;
    if (displayAtLeastOneMPItemInStockWarning) return false;

    return cartItems.mpMaterialOnly.subtotalWithInStockOnly <
        configs.mpSAPMinOrderAmount;
  }

  bool get displayAtLeastOneItemInStockWarning =>
      displayAtLeastOneMPItemInStockWarning ||
      displayAtLeastOneZPItemInStockWarning;

  bool get displayAtLeastOneMPItemInStockWarning =>
      cartItems.mpMaterialOnly.every((e) => e.containAllOOSItem) &&
      mpSmallOrderFeeEnable;

  bool get displayAtLeastOneZPItemInStockWarning =>
      cartItems.zpMaterialOnly.every((e) => e.containAllOOSItem) &&
      zpSmallOrderFeeEnable;

  bool get mpSmallOrderFeeEnable =>
      cartItems.mpMaterialOnly.isNotEmpty &&
      configs.enableMPSmallOrderFee &&
      configs.mpSmallOrderFeeUserRoles
          .contains(user.role.type.smallOrderFeeRole);

  bool get zpSmallOrderFeeEnable =>
      cartItems.zpMaterialOnly.isNotEmpty &&
      configs.enableSmallOrderFee &&
      configs.smallOrderFeeUserRoles.contains(user.role.type.smallOrderFeeRole);
}
