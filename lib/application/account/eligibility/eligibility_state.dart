part of 'eligibility_bloc.dart';

@freezed
class EligibilityState with _$EligibilityState {
  const EligibilityState._();

  const factory EligibilityState({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required OrderDocumentType selectedOrderType,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoadingCustomerCode,
    required bool preSelectShipTo,
  }) = _EligibilityState;

  factory EligibilityState.initial() => EligibilityState(
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        selectedOrderType: OrderDocumentType.empty(),
        failureOrSuccessOption: none(),
        preSelectShipTo: false,
        isLoadingCustomerCode: false,
      );

  bool get isReturnsEnable {
    if (user.disableReturns) return false;

    if (user.role.type.isSalesRepRole &&
        salesOrgConfigs.disableReturnsAccessSR) {
      return false;
    }

    if (user.role.type.isCustomer && salesOrgConfigs.disableReturnsAccess) {
      return false;
    }

    return true;
  }

  bool get isPaymentEnabled {
    if (salesOrg.isSg && customerCodeInfo.paymentTerm.isOutsideOfSystem) {
      return false;
    }

    if (user.role.type.hasAdminAccess) {
      return true;
    }

    if (salesOrgConfigs.disablePayment) {
      return false;
    }

    return user.isCustomerWithPaymentsEnable;
  }

  bool get canOrderCovidMaterial {
    // 1. SG Covid
    return (user.role.type.isCustomer &&
            salesOrganisation.salesOrg.isSg &&
            customerCodeInfo.customerAttr7.isZEV) ||

        // 2. PH Covid
        (user.role.type.isCustomer &&
            salesOrganisation.salesOrg.isPH &&
            customerCodeInfo.customerGrp4.canOrderCovidMaterial);
  }

  bool get isOrderTypeEnable {
    // TH user disable order type
    if (!user.enableOrderType && salesOrganisation.salesOrg.isTH) {
      return false;
    }

    // 1. country must be case 'TH', 'SG', 'TW', 'MY'
    if (salesOrganisation.salesOrg.isValidCountryOrderTypeEligible &&
        isOrderTypeEligible) {
      return true;
    }

    return false;
  }

  bool get isOrderTypeEnableAndSpecialOrderType =>
      !isOrderTypeEnable || !selectedOrderType.documentType.isSpecialOrderType;

  // ***pickAndPack values***
  String get getPNPValueMaterial {
    // Condition 1: user role type must be SalesRep
    // Condition 2: If SG user then pickAndPack = "include"
    // Condition 3: If TH,MY,TW user then pickAndPack = "include" (isOrderTypeEnable already covers this so can reuse that)
    return user.role.type.isSalesRepRole &&
            (salesOrganisation.salesOrg.isSg || isOrderTypeEnable)
        ? 'include'
        : '';
  }

  String get getPNPValueCovidMaterial {
    // Condition 1: For Covid Tab Materials and Non-SG user, pickAndPack = "only"
    return user.role.type.isSalesRepRole && !salesOrganisation.salesOrg.isSg
        ? 'only'
        : '';
  }

  bool get isAccountSuspended {
    return customerCodeInfo.status.isSuspended || shipToInfo.status.isSuspended;
  }

  String get getPNPValueBonusMaterialSearch {
    // Condition 1: user role type must be SalesRep
    // Condition 2: If SG and MY user, then pickAndPack = "include"
    return user.role.type.isSalesRepRole &&
            (salesOrganisation.salesOrg.isSg || salesOrganisation.salesOrg.isMY)
        ? 'include'
        : '';
  }

  bool get isPaymentTermDescriptionEnable {
    return !user.role.type.isSalesRepRole &&
        !salesOrgConfigs.disablePaymentTermsDisplay;
  }

  bool get displayPaymentTerm {
    return user.role.type.hasAdminAccess ||
        !salesOrgConfigs.disablePaymentTermsDisplay;
  }

  bool get validateOutOfStockValue => salesOrgConfigs.oosValue.isOosValueZero
      ? user.role.type.isSalesRepRole
      : true;

  bool get doNotAllowOutOfStockMaterials =>
      !(salesOrgConfigs.addOosMaterials.getOrDefaultValue(false) &&
          validateOutOfStockValue);

  bool get isBonusOverrideEnable => user.role.type.isSalesRepRole
      ? user.hasBonusOverride
      : salesOrgConfigs.priceOverride;

  bool get isSalesRepAndBonusEligible =>
      salesOrganisation.salesOrg.isMY &&
      user.role.type.isSalesRepRole &&
      user.hasBonusOverride;

  bool get isBillToInfo =>
      customerCodeInfo.hasBillToInfo && salesOrgConfigs.enableBillTo;

  bool get isZDP8Override =>
      user.role.type.isSalesRepRole && salesOrgConfigs.enableZDP8Override;

  bool get isPriceOverrideEnable => user.role.type.isSalesRepRole
      ? user.hasPriceOverride
      : salesOrgConfigs.priceOverride;

  bool get showGreenDeliveryBox {
    final gdEligibleRole = salesOrgConfigs.greenDeliveryUserRole;
    final roleType = user.role.type;

    if (!salesOrgConfigs.enableGreenDelivery) {
      return false;
    }

    if (gdEligibleRole.isAllUsers) {
      return true;
    }

    if (gdEligibleRole.isCustomer && roleType.isCustomer) {
      return true;
    }

    if (gdEligibleRole.isSalesReps && roleType.isSalesRepRole) {
      return true;
    }

    return false;
  }

  bool get comboDealEligible {
    if (!salesOrgConfigs.enableComboDeals) return false;
    if (customerCodeInfo.salesDeals.isEmpty) return false;

    final comboDealUserRole = salesOrgConfigs.comboDealsUserRole;
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

  bool get isGimmickMaterialEnabled =>
      (user.role.type.isSalesRepRole && salesOrgConfigs.salesOrg.isTH) ||
      salesOrgConfigs.enableGimmickMaterial;

  bool get isBundleMaterialEnable =>
      !salesOrgConfigs.disableBundles &&
      !selectedOrderType.documentType.isSpecialOrderType;

  //============================================================
  // 1. user role type must be SalesRep
  // 2. sales org config OrderType feature toggle enable
  //============================================================
  bool get isOrderTypeEligible =>
      user.role.type.isSalesRepRole && !salesOrgConfigs.disableOrderType;

  bool get isBonusSampleItemVisible =>
      isBonusOverrideEnable &&
      !selectedOrderType.documentType.isSpecialOrderType;

  bool get isOrderTypeEligibleAndSpecialOrderType =>
      isOrderTypeEligible && selectedOrderType.documentType.isSpecialOrderType;

  bool get isCounterOfferVisible =>
      !isOrderTypeEligibleAndSpecialOrderType &&
      (isPriceOverrideEnable || isZDP8Override);

  bool get isOutOfStockMaterialAllowed {
    if (!salesOrgConfigs.addOosMaterials.isOutOfStockMaterialAllowed) {
      return false;
    }

    if (salesOrgConfigs.oosValue.isOosValueZero &&
        !user.role.type.isSalesRepRole) {
      return false;
    }

    return true;
  }

  bool get isMYExternalSalesRepUser =>
      salesOrganisation.salesOrg.isMY && user.role.type.isExternalSalesRep;

  SalesOrg get salesOrg => salesOrganisation.salesOrg;

  bool get haveShipTo => shipToInfo != ShipToInfo.empty();

  bool get isReturnsOverrideEnable {
    if (user.role.type.isSalesRepRole &&
        salesOrgConfigs.disableOverrideFieldSR) {
      return false;
    }

    if (user.role.type.isCustomer &&
        salesOrgConfigs.disableOverrideFieldCustomer) {
      return false;
    }

    return true;
  }

  bool get isIDMarket => salesOrg.isID;

  bool get isZDP5eligible =>
      salesOrgConfigs.salesOrg.isVN && salesOrgConfigs.enableZDP5;

  bool get isNotificationSettingsEnable =>
      user.userCanAccessOrderHistory || isPaymentEnabled || isReturnsEnable;

  bool get disableCreateOrder =>
      !user.userCanCreateOrder || customerBlockOrSuspended || isEDI;

  bool get showMaterialDescInMandarin =>
      salesOrg.isTW && user.preferredLanguage.isMandarin;

  bool get haveCustomerCodeInfo =>
      customerCodeInfo != CustomerCodeInfo.empty() &&
      customerCodeInfo.customerCodeSoldTo.isNotEmpty;

  String get displayShipToCustomerCode =>
      haveShipTo ? shipToInfo.shipToCustomerCode : 'NA';

  String get displayShipTo =>
      haveCustomerCodeInfo ? shipToInfo.fullDeliveryAddress : 'NA';

  bool get haveCustomerCodeInfos =>
      haveCustomerCodeInfo && customerCodeInfo.customerCodeSoldTo.isNotEmpty;

  bool get haveShipToInfos =>
      haveCustomerCodeInfo && customerCodeInfo.shipToInfos.isNotEmpty;

  StatusType get outOfStockProductStatus => StatusType(
        validateOutOfStockValue
            ? salesOrgConfigs.addOosMaterials.oosMaterialTag
            : salesOrgConfigs.addOosMaterials.oosTag,
      );

  bool get marketPlaceEligible {
    if (!isMarketPlaceEnabled) return false;
    if (!user.acceptMPTC.isAccept) return false;

    return true;
  }

  bool get showMarketPlaceTnc {
    if (!user.acceptPrivacyPolicy) return false;
    if (!isMarketPlaceEnabled) return false;
    if (!user.acceptMPTC.isUnknown) return false;

    return true;
  }

  bool get isMarketPlaceEnabled {
    if (!salesOrgConfigs.enableMarketPlace) return false;
    if (!customerCodeInfo.isMarketPlace) return false;
    if (!user.role.type.canAccessMarketPlace) return false;

    return true;
  }

  bool get customerBlockOrSuspended =>
      isAccountSuspended || shipToInfo.customerBlock.isCustomerBlocked;

  bool get isEDI => customerCodeInfo.status.isEDI;

  String get productManufacturerFilterTitle =>
      marketPlaceEligible ? 'Manufacturers & Sellers' : 'Manufacturer';

  // Used in listenWhen for BlocListener for sections in home page to refresh the data
  // when pulling to refresh or selecting a new shipTo
  bool isRefreshed(EligibilityState previous) {
    final isLoadShipToSuccess =
        previous.isLoadingCustomerCode != isLoadingCustomerCode &&
            !isLoadingCustomerCode;
    final isSelectNewShipTo = previous.shipToInfo != shipToInfo && haveShipTo;
    final isSelectNewLanguage =
        previous.user.preferredLanguage != user.preferredLanguage;

    return isLoadShipToSuccess || isSelectNewShipTo || isSelectNewLanguage;
  }

  double get paymentHomeItemWidthRatio => salesOrg.isPaymentClaimEnabled ||
          !salesOrgConfigs.statementOfAccountEnabled
      ? 0.45
      : 0.3;

  String get invalidSelectedReturnItemMsg => marketPlaceEligible
      ? 'Please note that ZP and MP products cannot be returned together. Additionally, MP products must be from the same seller in each request.'
      : 'Please ensure that the items selected for return are from the same Principal.';
}
