#!/bin/bash
echo -e "\n"
echo "Presetting sales org config for TH."
loginApiResponse=$(curl -s --location 'https://uat-th.ezrx.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "throotadmin",
 "password": "St@ysafe01" } },
 "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReq=$(curl --location 'https://uat-th.ezrx.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '{ "query":"mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) { updateSalesOrgConfig(input: $input) { salesOrgConfig { salesOrgCode ponRequired priceOverride expiryDateDisplay enableBatchNumber currency netPriceOverride  enableVat enableZDP5 materialWithoutPrice enableZDP8Override displayOrderDiscount enableIRN enableTaxClassification disableBundles disableProcessingStatus enableCollectiveNumber enableGimmickMaterial hideStockDisplay showPOAttachment disableDeliveryDate enableTaxAtTotalLevelOnly enableGreenDelivery greenDeliveryDelayInDays greenDeliveryUserRole minOrderAmount hideCustomer disableOrderType vatValue enableSpecialInstructions enableReferenceNote enableMobileNumber enablePaymentTerms enableGMC enableListPrice enableDefaultMD disablePaymentTermsDisplay enableBillTo enableOHPrice addOosMaterials oosValue enableRemarks enableTaxDisplay enableGMN } } } ", 
"variables": {
  "input": {
    "id": 1,
    "data": {
      "ponRequired": false,
      "enableSmallOrderFee": false,
      "smallOrderFeeUserRoles": [],
      "priceOverride": true,
      "expiryDateDisplay": false,
      "batchNumDisplay": false,
      "currency": "thb",
      "enableUploadAd": false,
      "topLeftAd": "",
      "topRightAd": "",
      "btmLeftAd": "",
      "btmRightAd": "",
      "supportURL": "",
      "minOrderAmount": "1500.00",
      "smallOrderFee": 0,
      "vatValue": 7,
      "enableFutureDeliveryDay": true,
      "netPriceOverride": true,
      "futureDeliveryDay": "7",
      "plantNumber": "",
      "materialWithoutPrice": true,
      "enablePaymentTerms": false,
      "enableAnalytics": false,
      "enablePartialPayment": false,
      "enableUnreferencedReturn": false,
      "disableReturnsAccess": true,
      "disablePayment": false,
      "disableReturnsAccessSR": true,
      "enableMobileNumber": false,
      "enableRemarks": false,
      "enableListPrice": true,
      "enableTaxDisplay": false,
      "addOosMaterials": true,
      "oosValue": 1,
      "enableDefaultMD": true,
      "enableZDP5": false,
      "enableZDP8Override": true,
      "enableGMC": false,
      "enableGMN": false,
      "enableBatchNumber": false,
      "enableOHPrice": true,
      "enableSpecialInstructions": true,
      "enableReferenceNote": true,
      "displayOrderDiscount": false,
      "enableIRN": true,
      "enableTaxClassification": false,
      "enableTaxAtTotalLevelOnly": false,
      "displayItemTaxBreakdown": true,
      "displaySubtotalTaxBreakdown": true,
      "supportMail": "",
      "disablePrincipals": true,
      "principalList": {
        "value": []
      },
      "disableDeals": false,
      "principleDisabledDeals": {
        "value": []
      },
      "enable2FA": false,
      "disableBundles": true,
      "disableProcessingStatus": false,
      "disableOrderType": false,
      "enableCollectiveNumber": false,
      "enableGimmickMaterial": false,
      "enableVat": false,
      "hideCustomer": false,
      "enableBillTo": false,
      "disablePaymentTermsDisplay": true,
      "hideStockDisplay": false,
      "showPOAttachment": true,
      "enablePOAttachmentRequired": false,
      "enableLoyaltyScheme": false,
      "disableOverrideFieldCustomer": false,
      "disableOverrideFieldSR": true,
      "disableOverrideApprovalCustomer": false,
      "disableOverrideApprovalSR": false,
      "disableDeliveryDate": true,
      "allowReturnsOutsidePolicy": false,
      "disableApproverActions": false,
      "disableUserRestrictions": false,
      "hideCredit": true,
      "statementOfAccountEnabled": false,
      "enableComboDeals": false,
      "authorizedsalesRep": [],
      "comboDealsUserRole": null,
      "mpMinOrderAmount": "0"
    }
  }
 } }')
response=$(echo $updateSalesorgconfigMutationReq)
echo "Response is : "  $response
echo "Your TH sales org config has been successfully reset."
echo -e "\n"