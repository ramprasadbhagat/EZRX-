#!/bin/bash

echo -e "\n"
echo "Presetting sales org config for PH."

updateSalesorgconfigMutationReq=$(curl --location 'https://uat-ph.ezrx.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"query":"   mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) {
  updateSalesOrgConfig(input: $input) {
    salesOrgConfig {
      salesOrgCode
      ponRequired
      priceOverride
      expiryDateDisplay
      batchNumDisplay
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
      allowReturnsOutsidePolicy
      disableApproverActions
      disableDeals
      disableOverrideApprovalCustomer
      disableOverrideApprovalSR
      disableOverrideFieldCustomer
      disableOverrideFieldSR
      disablePayment
      disablePrincipals
      disableReturnsAccess
      disableReturnsAccessSR
      disableUserRestrictions
      displayItemTaxBreakdown
      displaySubtotalTaxBreakdown
      enable2FA
      enableAnalytics
      enableComboDeals
      enableFutureDeliveryDay
      enableLoyaltyScheme
      enablePOAttachmentRequired
      enablePartialPayment
      enablePaymentTerms
      enableUnreferencedReturn
      enableUploadAd
      futureDeliveryDay
      hideCredit
      plantNumber
    }
  }
}


variable:
{
  "input": {
    "where": {
      "id": 3
    },
    "data": {
      "ponRequired": true,
      "priceOverride": true,
      "expiryDateDisplay": false,
      "batchNumDisplay": false,
      "currency": "php",
      "minOrderAmount": "0",
      "vatValue": 0,
      "netPriceOverride": false,
      "languageFilter": false,
      "languageValue": "",
      "materialWithoutPrice": true,
      "enablePaymentTerms": false,
      "enableMobileNumber": false,
      "enableRemarks": false,
      "enableListPrice": false,
      "enableTaxDisplay": false,
      "addOosMaterials": true,
      "oosValue": 1,
      "enableDefaultMD": false,
      "enableZDP5": false,
      "enableZDP8Override": true,
      "enableGMC": false,
      "enableGMN": false,
      "enableBatchNumber": false,
      "enableOHPrice": true,
      "enableSpecialInstructions": true,
      "enableReferenceNote": false,
      "displayOrderDiscount": false,
      "enableIRN": false,
      "enableTaxClassification": false,
      "disableBundles": false,
      "disableProcessingStatus": false,
      "disableOrderType": false,
      "enableCollectiveNumber": false,
      "enableGimmickMaterial": false,
      "enableVat": false,
      "hideCustomer": false,
      "enableBillTo": true,
      "disablePaymentTermsDisplay": false,
      "hideStockDisplay": false,
      "showPOAttachment": false,
      "disableDeliveryDate": true,
      "enableTaxAtTotalLevelOnly": false,
      "enableGreenDelivery": false,
      "greenDeliveryDelayInDays" : 0,
      "greenDeliveryUserRole" : 0,
      "allowReturnsOutsidePolicy": false,
      "disableApproverActions": false,
      "disableDeals" : false,
      "disableOverrideApprovalCustomer" : false,
      "disableOverrideApprovalSR" : false,
      "disableOverrideFieldCustomer" : false,
      "disableOverrideFieldSR" : true,
      "disablePayment" : false,
      "disablePrincipals" : true,
      "disableReturnsAccess" : false,
      "disableReturnsAccessSR" : false,
      "disableUserRestrictions" : false,
      "displayItemTaxBreakdown" : false,
      "displaySubtotalTaxBreakdown" : false,
      "enable2FA" : false,
      "enableAnalytics" : false,
      "enableComboDeals" : false,
      "enableFutureDeliveryDay" : false,
      "enableLoyaltyScheme" : false,
      "enablePOAttachmentRequired" : false,
      "enablePartialPayment" : false,
      "enablePaymentTerms" : false,
      "enableUnreferencedReturn" : false,
      "enableUploadAd" : false,
      "futureDeliveryDay" : "7",
      "hideCredit" : false,
      "plantNumber" : "",
    }
  }
}')

response=$(echo $updateSalesorgconfigMutationReq)
echo "Response is : "  $response

echo "Your PH sales org config has been successfully reset."
echo -e "\n"