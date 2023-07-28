class ReturnRequestQuery {
  String searchReturnMaterials() {
    return '''
      fragment MaterialsFields on returnMaterialInformation {
        item {
          assignmentNumber
          material
          materialDescription
          targetQuantity
          batch
          priceDate
          unitPrice
          totalPrice
          principalCode
          principalName
          expiryDate
          bonusItem {
            assignmentNumber
            material
            materialDescription
            targetQuantity
            batch
            priceDate
            unitPrice
            totalPrice
            principalCode
            principalName
            expiryDate
          }
        }
      }

      fragment materialBasicInformation on materialBasicInfo {
        salesOrg
        partnerRole
        partnerNumber
      }

      query searchReturnMaterials(\$searchReturnMaterialsRequestV2: searchReturnMaterialsRequestV2!) {
        searchReturnMaterialsV2(request: \$searchReturnMaterialsRequestV2) {
          materialBasicInformation {
            ...materialBasicInformation
          }
          materials {
            ...MaterialsFields
          }
        }
      } 
    ''';
  }
}
