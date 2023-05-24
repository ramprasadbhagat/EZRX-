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
        \$principalNameList: [String!],
        \$therapeuticClassList: [String!],
        \$itemBrandList: [String!],
        \$cached: Boolean, 
        \$isForFOC: Boolean,
        \$ean: String) {
            materialsWithMeta(
              customer: \$customerCode, 
              shipToCustomer: \$shipToCustomer, 
              salesOrganisation: \$salesOrganisation, 
              plants: \$plants, 
              language: \$language, 
              pickAndPack: \$pickAndPack, 
              orderBy: \$orderBy, 
              principalNameList: \$principalNameList,
              therapeuticClassList: \$therapeuticClassList,
              itemBrandList: \$itemBrandList,
              first: \$first, 
              after: \$after, 
              searchKey: \$searchKey, 
              cached: \$cached, 
              isForFOC: \$isForFOC,
              ean: \$ean) {
        rawMetaData{
          count
        }
        processedMetaData{
          count
        }
        materials {
          materialNumber
          ean
          isSampleMaterial
          materialDescription
          defaultMaterialDescription
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
          genericMaterialName
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
        \$principalNameList: [String!],
        \$therapeuticClassList: [String!],
        \$itemBrandList: [String!], 
        \$searchKey: String, 
        \$language: String, 
        \$cached: Boolean, 
        \$orderBy: String, 
        \$pickAndPack: String, 
        \$gimmickMaterial: Boolean, 
        \$isForFOC: Boolean, 
        \$isSample: Boolean,
        \$ean: String) { 
          customerMaterialsForSalesRep(
            username: \$username, 
            customerSoldToCode: \$customerSoldToCode, 
            customerShipToCode: \$customerShipToCode, 
            salesOrganisation: \$salesOrganisation, 
            excludePrincipal: \$excludePrincipal, 
            language: \$language, 
            orderBy: \$orderBy,
            principalNameList: \$principalNameList,
            therapeuticClassList: \$therapeuticClassList,
            itemBrandList: \$itemBrandList, 
            first: \$first, 
            after: \$after, 
            searchKey: \$searchKey, 
            cached: \$cached, 
            pickAndPack: \$pickAndPack, 
            gimmickMaterial: \$gimmickMaterial, 
            isForFOC: \$isForFOC, 
            isSample: \$isSample,
            ean: \$ean) {
        rawMetaData{
          count
        }
        processedMetaData{
          count
        }
        materials {
          materialNumber
          ean
          isSampleMaterial
          materialDescription
          defaultMaterialDescription
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
          isFOCMaterial
          genericMaterialName
        }
      }
    }
    ''';
  }

  String get comboDealMaterials {
    return '''
      query materialsWithMetaQuery(
        \$customerCode: String!, 
        \$shipToCustomer: String!, 
        \$salesOrganisation: String!, 
        \$first: Int, 
        \$after: Int, 
        \$principalCodeList: [String!],
        ) {
            materialsWithMeta(
              customer: \$customerCode, 
              shipToCustomer: \$shipToCustomer, 
              salesOrganisation: \$salesOrganisation, 
              principalCodeList: \$principalCodeList,
              first: \$first, 
              after: \$after, 
              ) {
        rawMetaData{
          count
        }
        processedMetaData{
          count
        }
        materials {
          materialNumber
          ean
          isSampleMaterial
          materialDescription
          defaultMaterialDescription
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
          genericMaterialName
        }
      }
    }
    ''';
  }

  String get comboDealMaterialsForSaleRep {
    return '''
      query CustomerMaterialsForSalesRep(
        \$customerSoldToCode: String!, 
        \$customerShipToCode: String!, 
        \$salesOrganisation: String!, 
        \$first: Int, 
        \$after: Int, 
        \$principalNameList: [String!],
        ) { 
          customerMaterialsForSalesRep(
            customerSoldToCode: \$customerSoldToCode, 
            customerShipToCode: \$customerShipToCode, 
            salesOrganisation: \$salesOrganisation, 
            principalCodeList: \$principalNameList,
            first: \$first, 
            after: \$after, 
            ) {
        rawMetaData{
          count
        }
        processedMetaData{
          count
        }
        materials {
          materialNumber
          ean
          isSampleMaterial
          materialDescription
          defaultMaterialDescription
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
          isFOCMaterial
          genericMaterialName
        }
      }
    }
    ''';
  }
}
