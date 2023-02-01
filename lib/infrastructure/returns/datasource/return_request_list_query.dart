class ReturnRequestListQuery {
  String getReturnRequestList() {
    return '''
      fragment MaterialsFields on returnMaterialInformation {
        item {
          assignmentNumber
          referenceDocument
          purchaseNumberC
          poMethod
          createdDate
          currency
          plant
          material
          materialDescription
          itemNumber
          targetQuantity
          storeLocation
          batch
          highLevelItemCode
          orderReason
          priceDate
          unitPrice
          totalPrice
          principalCode
          principalName
          expiryDate
          eligibleForReturn
          schedules {
            scheduledLine
            requestDate
            __typename
          }
          conditions {
            conditionType
            conditionValue
            __typename
          }
          texts {
            textID
            textLine
            language
            __typename
          }
          suggestedPriceOverride
          balanceQuantity
          balanceValue
          outsidePolicy
          bonusItem {
            assignmentNumber
            referenceDocument
            purchaseNumberC
            poMethod
            createdDate
            currency
            plant
            material
            materialDescription
            itemNumber
            targetQuantity
            storeLocation
            batch
            highLevelItemCode
            orderReason
            priceDate
            unitPrice
            totalPrice
            principalCode
            principalName
            expiryDate
            eligibleForReturn
            schedules {
              scheduledLine
              requestDate
              __typename
            }
            conditions {
              conditionType
              conditionValue
              __typename
            }
            texts {
              textID
              textLine
              language
              __typename
            }
            suggestedPriceOverride
            balanceQuantity
            balanceValue
            outsidePolicy
            __typename
          }
          __typename
        }
        __typename
      }
      fragment materialBasicInformation on materialBasicInfo {
        salesOrg
        partnerRole
        partnerNumber
        __typename
      }
      query searchReturnMaterials(
        \$searchReturnMaterialsRequest: searchReturnMaterialsRequest!
      ) {
        searchReturnMaterials(request: \$searchReturnMaterialsRequest) {
          isSearchComplete
          materialBasicInformation {
            ...materialBasicInformation
            __typename
          }
          materials {
            ...MaterialsFields
            __typename
          }
          __typename
        }
      } 
    ''';
  }
}
