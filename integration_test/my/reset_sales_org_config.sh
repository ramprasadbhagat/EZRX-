#!/bin/bash

echo -e "\n"
echo "Presetting sales org config for MY."

loginApiResponse=$(curl -s --location 'https://uat-my.ezrx.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "rootadmin", "password": "Pa55word@1234" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReq=$(curl --location 'https://uat-my.ezrx.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '
{
  "query": "mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) {updateSalesOrgConfig(input: $input) {    salesOrgConfig {        salesOrgCode        ponRequired        priceOverride        expiryDateDisplay        enableBatchNumber        currency        netPriceOverride                enableVat        enableZDP5                materialWithoutPrice        enableZDP8Override        displayOrderDiscount        enableIRN        enableTaxClassification        disableBundles        disableProcessingStatus        enableCollectiveNumber        enableGimmickMaterial        hideStockDisplay        showPOAttachment        disableDeliveryDate        enableTaxAtTotalLevelOnly        enableGreenDelivery        greenDeliveryDelayInDays        greenDeliveryUserRole        minOrderAmount        hideCustomer        disableOrderType        vatValue        enableSpecialInstructions        enableReferenceNote        enableMobileNumber        enablePaymentTerms        enableGMC        enableListPrice        enableDefaultMD        disablePaymentTermsDisplay        enableBillTo        enableOHPrice        addOosMaterials        oosValue        enableRemarks        enableTaxDisplay        enableGMN        enableMarketPlace        }    }}       ",
  "variables": {
    "input": {
      "id": 4,
      "data": {
        "ponRequired": false,
        "priceOverride": true,
        "expiryDateDisplay": true,
        "batchNumDisplay": true,
        "currency": "myr",
        "enableUploadAd": false,
        "topLeftAd": "",
        "topRightAd": "",
        "btmLeftAd": "",
        "btmRightAd": "",
        "supportURL": "",
        "minOrderAmount": "300",
        "vatValue": 0,
        "enableFutureDeliveryDay": false,
        "netPriceOverride": false,
        "futureDeliveryDay": "7",
        "plantNumber": "",
        "materialWithoutPrice": false,
        "enablePaymentTerms": false,
        "enableAnalytics": false,
        "enablePartialPayment": false,
        "enableUnreferencedReturn": false,
        "disableReturnsAccess": false,
        "disablePayment": false,
        "disableReturnsAccessSR": false,
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
        "enableTaxAtTotalLevelOnly": false,
        "displayItemTaxBreakdown": false,
        "displaySubtotalTaxBreakdown": false,
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
        "disableBundles": false,
        "disableProcessingStatus": false,
        "disableOrderType": true,
        "enableCollectiveNumber": true,
        "enableGimmickMaterial": false,
        "enableVat": false,
        "hideCustomer": false,
        "enableBillTo": false,
        "disablePaymentTermsDisplay": false,
        "hideStockDisplay": false,
        "showPOAttachment": false,
        "enablePOAttachmentRequired": false,
        "enableLoyaltyScheme": false,
        "disableOverrideFieldCustomer": false,
        "disableOverrideFieldSR": true,
        "disableOverrideApprovalCustomer": false,
        "disableOverrideApprovalSR": false,
        "disableDeliveryDate": false,
        "allowReturnsOutsidePolicy": false,
        "disableApproverActions": false,
        "disableUserRestrictions": false,
        "hideCredit": false,
        "enableComboDeals": false,
        "enableGreenDelivery": false,
        "comboDealsUserRole": null,
        "enableMarketPlace": true
      }
    }
  }
}
')

response=$(echo $updateSalesorgconfigMutationReq)
echo "Response is : "  $response

echo "Your MY sales org config has been successfully reset."
echo -e "\n"