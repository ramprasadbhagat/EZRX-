class MaterialsWithMetaQuery {
  String getCustomerMaterialList() {
    return '''
      query materialsWithMetaQuery(
        \$customerCode: String!, 
        \$shipToCustomer: String!, 
        \$salesOrganisation: String!, 
        \$plants: [String], 
        \$language: String, 
        \$pickAndPack: String, 
        \$orderBy: String, 
        \$first: Int, 
        \$after: Int, 
        \$searchKey: String, 
        \$cached: Boolean, 
        \$isForFOC: Boolean) {
            materialsWithMeta(
              customer: \$customerCode, 
              shipToCustomer: \$shipToCustomer, 
              salesOrganisation: \$salesOrganisation, 
              plants: \$plants, 
              language: \$language, 
              pickAndPack: \$pickAndPack, 
              orderBy: \$orderBy, 
              first: \$first, 
              after: \$after, 
              searchKey: \$searchKey, 
              cached: \$cached, 
              isForFOC: \$isForFOC) {
        rawMetaData{
          count
        }
        processedMetaData{
          count
        }
        materials {
          materialNumber
          isSampleMaterial
          materialDescription
          governmentMaterialCode
          principalName
          principalCode
          therapeuticClass
          itemBrand
          taxClassification
          itemRegistrationNumber
          unitOfMeasurement
          materialGroup2
          materialGroup4
          taxes
          hidePrice
          hasValidTenderContract
          hasMandatoryTenderContract
        }
      }
    }
    ''';
  }

  String getSalesRepMaterialList() {
    return '''
      query CustomerMaterialsForSalesRep(
        \$username: String!, 
        \$customerSoldToCode: String!, 
        \$customerShipToCode: String!, 
        \$salesOrganisation: String!, 
        \$first: Int, 
        \$after: Int, 
        \$excludePrincipal: [String], 
        \$searchKey: String, 
        \$language: String, 
        \$cached: Boolean, 
        \$orderBy: String, 
        \$pickAndPack: String, 
        \$gimmickMaterial: Boolean, 
        \$isForFOC: Boolean, 
        \$isSample: Boolean) { 
          customerMaterialsForSalesRep(
            username: \$username, 
            customerSoldToCode: \$customerSoldToCode, 
            customerShipToCode: \$customerShipToCode, 
            salesOrganisation: \$salesOrganisation, 
            excludePrincipal: \$excludePrincipal, 
            language: \$language, 
            orderBy: \$orderBy, 
            first: \$first, 
            after: \$after, 
            searchKey: \$searchKey, 
            cached: \$cached, 
            pickAndPack: \$pickAndPack, 
            gimmickMaterial: \$gimmickMaterial, 
            isForFOC: \$isForFOC, 
            isSample: \$isSample) {
        rawMetaData{
          count
        }
        processedMetaData{
          count
        }
        materials {
          materialNumber
          isSampleMaterial
          materialDescription
          governmentMaterialCode
          principalName
          principalCode
          therapeuticClass
          itemBrand
          taxClassification
          itemRegistrationNumber
          unitOfMeasurement
          materialGroup2
          materialGroup4
          taxes
          hidePrice
          hasValidTenderContract
          hasMandatoryTenderContract
        }
      }
    }
    ''';
  }
}
