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
  }) = _EligibilityState;

  factory EligibilityState.initial() => EligibilityState(
        user: User.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
      );

  bool get isReturnsEnable {
    if (user.disableReturns) return false;

    if (user.role.type.isSalesRep && salesOrgConfigs.disableReturnsAccessSR) {
      return false;
    }

    if (user.role.type.isClient && salesOrgConfigs.disableReturnsAccess) {
      return false;
    }

    return true;
  }

  bool get isBundleMaterialEnable => !salesOrgConfigs.disableBundles;
  bool get isCovidMaterialEnable {
    // 1. SG Covid tab
    return (customerCodeInfo.customerAttr7.isZEV &&
            user.role.type.isClient &&
            salesOrganisation.salesOrg.isSg) ||
        // 2. Sample item
        customerCodeInfo.customerGrp4.canOrderCovidMaterial ||
        // 3. PH Covid tab
        (user.role.type.isSalesRep && salesOrganisation.salesOrg.isPH);
  }

  bool get isOrderTypeEnable {
    // TH user disable order type
    if (!user.enableOrderType && salesOrganisation.salesOrg.isTH) {
      return false;
    }

    // 1. country must be case 'TH', 'SG', 'TW', 'MY'
    // 2. user role type must be SalesRep
    // 3. sales org config OrderType feature toggle enable
    if (salesOrganisation.salesOrg.isOrderTypeEligible &&
        user.role.type.isSalesRep &&
        !salesOrgConfigs.disableOrderType) {
      return true;
    }

    return false;
  }

  // ***pickAndPack values***
  String get getPNPValueMaterial {
    // Condition 1: user role type must be SalesRep
    // Condition 2: If SG user then pickAndPack = "include"
    // Condition 3: If TH,MY,TW user then pickAndPack = "include" (isOrderTypeEnable already covers this so can reuse that)
    return user.role.type.isSalesRep &&
            (salesOrganisation.salesOrg.isSg || isOrderTypeEnable)
        ? 'include'
        : '';
  }

  String get getPNPValueCovidMaterial {
    // Condition 1: For Covid Tab Materials and Non-SG user, pickAndPack = "only"
    return user.role.type.isSalesRep && !salesOrganisation.salesOrg.isSg
        ? 'only'
        : '';
  }

  bool get isAccountSuspended {
    return customerCodeInfo.status.isSuspended && shipToInfo.status.isSuspended;
  }

  String get getPNPValueBonusMaterialSearch {
    // Condition 1: user role type must be SalesRep
    // Condition 2: If SG and MY user, then pickAndPack = "include"
    return user.role.type.isSalesRep &&
            (salesOrganisation.salesOrg.isSg || salesOrganisation.salesOrg.isMY)
        ? 'include'
        : '';
  }

  bool get isPaymentTermDescriptionEnable {
    return !user.role.type.isSalesRep &&
        !salesOrgConfigs.disablePaymentTermsDisplay;
  }

  bool get isPaymentTermEnable {
    return salesOrgConfigs.enablePaymentTerms;
  }

  bool get isSpecialInstructions {
    return salesOrganisation.salesOrg.isVN;
  }

  bool get isRequestedDeliveryDate {
    return salesOrgConfigs.disableDeliveryDate;
  }

  bool get isBillToEnable {
    return salesOrgConfigs.enableBillTo;
  }

  bool get validateOutOfStockValue {
    return user.role.type.isSalesRep && salesOrgConfigs.oosValue.isOosValueZero;
  }

  bool get doNotAllowOutOfStockMaterials {
    return !(salesOrgConfigs.addOosMaterials ||
        (salesOrgConfigs.addOosMaterials && validateOutOfStockValue));
  }

  bool get isShowPOAttachmentEnable => salesOrgConfigs.showPOAttachment;
  bool get enableOHPrice => salesOrgConfigs.enableOHPrice;
  bool get isDeliveryDateOrTimeEnable => salesOrgConfigs.disableDeliveryDate;
  bool get isdisplayOrderDiscountEnable => salesOrgConfigs.displayOrderDiscount;
  bool get isBonusOverrideEnable => user.role.type.isSalesRep
      ? user.hasBonusOverride
      : salesOrgConfigs.priceOverride;
  bool get isBatchNumberEnable => salesOrgConfigs.batchNumDisplay;
  bool get isRemarksEnable => salesOrgConfigs.enableRemarks;

  bool get isOrderSummaryPPEDisclaimerEnable {
    return salesOrganisation.salesOrg.isSg && !user.role.type.isSalesRep;
  }

  bool get isSalesRep => user.role.type.isSalesRep;
  bool get isEDI => customerCodeInfo.status.isEDI;

  bool get isBillToInfo {
    final billToInfo = customerCodeInfo.billToInfos.isNotEmpty
        ? customerCodeInfo.billToInfos.first
        : BillToInfo.empty();

    return salesOrgConfigs.enableBillTo &&
        billToInfo.billToCustomerCode.isNotEmpty &&
        billToInfo.billToCustomerCode != customerCodeInfo.customerCodeSoldTo;
  }

  bool get isZDP8Override =>
      user.role.type.isSalesRep && salesOrgConfigs.enableZDP8Override;
  bool get isPriceOverrideEnable => user.role.type.isSalesRep
      ? user.hasPriceOverride
      : salesOrgConfigs.priceOverride;
  bool get shouldDisplayVATInPercentage =>
      salesOrgConfigs.enableVat && !salesOrgConfigs.currency.isVN ||
      salesOrgConfigs.enableTaxAtTotalLevelOnly;

  bool get isReturnApprover =>
      user.role.type.isReturnApprover ||
      user.role.type.isRootAdmin ||
      user.role.type.isReturnAdmin;

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

}
