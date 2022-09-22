// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class SalesOrgQueryMutation {
  // For fetching Sales Organiazation Configs by salesOrg ID
  String getSalesOrgConfigsQuery() {
    return '''
      query salesOrgConfigs(\$salesOrg: String!){
        salesOrgConfigs(salesOrg: \$salesOrg) {
          id
          salesOrgCode
          ponRequired
          enableAnalytics
          priceOverride
          expiryDateDisplay
          batchNumDisplay
          currency
          enableUploadAd
          enableMobileNumber
          enableRemarks
          enableListPrice
          enableTaxDisplay
          enableDefaultMD
          enableZDP5
          enableZDP8Override
          enableGMC
          supportURL
          minOrderAmount
          netPriceOverride
          enableFutureDeliveryDay
          futureDeliveryDay
          plantNumber
          languageFilter
          languageValue
          materialWithoutPrice
          enablePaymentTerms
          enableBatchNumber
          enableOHPrice
          enableSpecialInstructions
          enableReferenceNote
          displayOrderDiscount
          enableTaxClassification
          supportMail
          disableDeliveryDate
          disablePrincipals
          principalList {
            value {
              date
              principal
            }
          }  
          enable2FA
          disableBundles
          disableOrderType
          disablePaymentTermsDisplay
          netPriceOverride
          enableCollectiveNumber
          addOosMaterials
          vatValue
          enableVat
          oosValue
          enableUnreferencedReturn
          enableGimmickMaterial
          enableBillTo
          hideCustomer
          hideStockDisplay
          disablePayment
          enablePartialPayment
          disableDeals
          showPOAttachment
          principleDisabledDeals {
          value {
            principal
           }
          }
          created_at
          updated_at
          enableLoyaltyScheme
       }
      }
    ''';
  }
}
