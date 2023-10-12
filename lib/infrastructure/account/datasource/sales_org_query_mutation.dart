// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class SalesOrgQueryMutation {
  // For fetching Sales Organiazation Configs by salesOrg ID
  String getSalesOrgConfigsQuery() {
    return '''
      query salesOrgConfigs(\$request: SalesOrgConfigRequest) {
  salesOrgConfigs(request: \$request) {
    id
    salesOrgCode
    ponRequired
    enableAnalytics
    priceOverride
    expiryDateDisplay
    batchNumDisplay
    currency
    logo
    enableMobileNumber
    enableRemarks
    enableListPrice
    enableTaxDisplay
    addOosMaterials
    oosValue
    enablePartialPayment
    enableDefaultMD
    enableZDP8Override
    enableGMC
    enableGMN
    enableUploadAd
    topLeftAd
    topRightAd
    btmLeftAd
    btmRightAd
    supportURL
    minOrderAmount
    vatValue
    netPriceOverride
    enableFutureDeliveryDay
    futureDeliveryDay
    enablePaymentTerms
    plantNumber
    languageFilter
    enableVat
    enableZDP5
    languageValue
    materialWithoutPrice
    enableDeliveryStatus
    enableOMC
    enableBatchNumber
    enableOHPrice
    enableSpecialInstructions
    enableReferenceNote
    displayOrderDiscount
    enableIRN
    enableTaxClassification
    supportMail
    disablePrincipals
    principalList {
      value {
        date
        principalName
      }
    }
    disableDeals
    principleDisabledDeals {
      value {
        principal
      }
    }
    enable2FA
    disableBundles
    disableProcessingStatus
    disableOrderType
    enableCollectiveNumber
    enableGimmickMaterial
    enableUnreferencedReturn
    hideCustomer
    enableBillTo
    autoBlockOrders
    disablePaymentTermsDisplay
    disableReturnsAccess
    disablePayment
    disableReturnsAccessSR
    hideStockDisplay
    showPOAttachment
    enablePOAttachmentRequired
    created_at
    updated_at
    enableLoyaltyScheme
    disableOverrideFieldSR
    disableOverrideFieldCustomer
    disableOverrideApprovalCustomer
    disableOverrideApprovalSR
    disableDeliveryDate
    allowReturnsOutsidePolicy
    disableApproverActions
    disableUserRestrictions
    enableTaxAtTotalLevelOnly
    displayItemTaxBreakdown
    displaySubtotalTaxBreakdown
    enableComboDeals
  }
}

    ''';
  }
}
