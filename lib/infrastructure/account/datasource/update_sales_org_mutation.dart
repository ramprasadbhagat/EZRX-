class UpdateSalesOrgQueryMutation {
  String getUpdateSalesOrgConfigsQuery() {
    return '''
      mutation updateSalesorgconfigMutation(\$input: UpdateSalesOrgConfigInput!) {
        updateSalesOrgConfig(input: \$input) {
          salesOrgConfig {
            salesOrgCode
            ponRequired
            priceOverride
            expiryDateDisplay
            enableBatchNumber
            currency
            netPriceOverride
            languageFilter
            enableVat
            enableZDP5
            languageValue
            materialWithoutPrice
            enableZDP8Override
            displayOrderDiscount
            enableIRN
            enableTaxClassification
            disableBundles
            disableProcessingStatus
            enableCollectiveNumber
            enableGimmickMaterial
            hideStockDisplay
            showPOAttachment
            disableDeliveryDate
            enableTaxAtTotalLevelOnly
            enableGreenDelivery
            greenDeliveryDelayInDays
            greenDeliveryUserRole
            minOrderAmount
            hideCustomer
            disableOrderType
            vatValue
            enableSpecialInstructions
            enableReferenceNote
            enableMobileNumber
            enablePaymentTerms
            enableGMC
            enableListPrice
            enableDefaultMD
            disablePaymentTermsDisplay
            enableBillTo
            enableOHPrice
            addOosMaterials
            oosValue
            enableRemarks
            enableTaxDisplay
            enableGMN

          }
        }
      }
    ''';
  }
}
