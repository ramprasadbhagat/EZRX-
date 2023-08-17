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
    required bool isLoading,
  }) = _EligibilityState;

  factory EligibilityState.initial() => EligibilityState(
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        selectedOrderType: OrderDocumentType.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
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

  bool get isCovidMaterialEnable {
    // 1. SG Covid tab
    return (customerCodeInfo.customerAttr7.isZEV &&
            user.role.type.isCustomer &&
            salesOrganisation.salesOrg.isSg) ||
        // 2. Sample item
        customerCodeInfo.customerGrp4.canOrderCovidMaterial ||
        // 3. PH Covid tab
        (user.role.type.isSalesRepRole && salesOrganisation.salesOrg.isPH);
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

  bool get validateOutOfStockValue {
    return user.role.type.isSalesRepRole &&
        salesOrgConfigs.oosValue.isOosValueZero;
  }

  bool get doNotAllowOutOfStockMaterials {
    return !(salesOrgConfigs.addOosMaterials.getValue() ||
        (salesOrgConfigs.addOosMaterials.getValue() && validateOutOfStockValue));
  }

  bool get isBonusOverrideEnable => user.role.type.isSalesRepRole
      ? user.hasBonusOverride
      : salesOrgConfigs.priceOverride;

  bool get isSalesRepAndBonusEligible =>
      salesOrganisation.salesOrg.isMY &&
      user.role.type.isSalesRepRole &&
      user.hasBonusOverride;

  bool get isOrderSummaryPPEDisclaimerEnable {
    return salesOrganisation.salesOrg.isSg && !user.role.type.isSalesRepRole;
  }

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
    if (!customerCodeInfo.comboEligible) return false;

    final comboDealUserRole = salesOrgConfigs.comboDealsUserRole;
    final userRole = user.role.type;

    if (comboDealUserRole.isAllUsers) {
      return true;
    }

    if (comboDealUserRole.isCustomerOnly && !userRole.isSalesRepRole) {
      return true;
    }

    if (comboDealUserRole.isSalesRepOnly && userRole.isSalesRepRole) {
      return true;
    }

    return false;
  }

  bool get isBundleMaterialEnable =>
      !salesOrgConfigs.disableBundles &&
      !selectedOrderType.documentType.isSpecialOrderType;

  //============================================================
  // 1. user role type must be SalesRep
  // 2. sales org config OrderType feature toggle enable
  //============================================================
  bool get isOrderTypeEligible =>
      user.role.type.isSalesRepRole && !salesOrgConfigs.disableOrderType;

  bool get isMYMarketSalesRep =>
      user.role.type.isSalesRepRole && salesOrganisation.salesOrg.isMY;

  bool get isBonusSampleItemVisible =>
      isBonusOverrideEnable &&
      !selectedOrderType.documentType.isSpecialOrderType;

  bool get isOrderTypeEligibleAndSpecialOrderType =>
      isOrderTypeEligible && selectedOrderType.documentType.isSpecialOrderType;

  bool get isCounterOfferVisible =>
      !isOrderTypeEligibleAndSpecialOrderType && isPriceOverrideEnable;
}
