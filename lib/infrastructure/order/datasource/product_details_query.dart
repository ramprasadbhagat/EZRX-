class ProductDetailQuery {
  String getMaterialDetails(bool enableMarketplace) {
    return '''
     query materialDetails(
        \$materialNumber: String!,
        \$language: String, 
        \$salesOrg: String, 
        \$customerCode: String, 
        \$shipToCode: String
        ) {
      materialDetails(
        materialNumber:\$materialNumber
        language: \$language
        salesOrg: \$salesOrg
        customerCode: \$customerCode
        shipToCode: \$shipToCode
      ) {
        materialNumber
        materialDescription
        principalCode
        principalName
        unitOfMeasurement
        therapeuticClass
        genericMaterialName
        itemBrand
        promoStatus
        promoType
        materialBrand
        isFavourite
        isFOCMaterial
        ${enableMarketplace ? 'isMarketPlace' : ''}
        defaultMaterialDescription
        country
        countryName
        hidePrice
        governmentMaterialCode
        itemRegistrationNumber
        suspensionStatus
      }
    }
     ''';
  }

  String getSimilarProductQuery(bool enableMarketplace) {
    return '''
     query similarSearches(
      \$principalCode: String, 
      \$first: Int, 
      \$after: Int,
      \$language: String,
      \$resultCount: Int, 
      \$excludeMaterialNumber: String, 
      \$customerCode: String!, 
      \$salesOrg: String!, 
      \$shipToCode: String!) {
      similarSearches(
        principalCode: \$principalCode
        first: \$first
        after: \$after
        language: \$language
        resultCount: \$resultCount
        excludeMaterialNumber: \$excludeMaterialNumber
        customerCode: \$customerCode
        shipToCode: \$shipToCode
        salesOrg: \$salesOrg
      ) {
        materials {
          principalName
          principalCode
          materialNumber
          materialDescription
          defaultMaterialDescription
          itemBrand
          isFavourite
          ${enableMarketplace ? 'isMarketPlace' : ''}
          hidePrice
          governmentMaterialCode
        }
      }
    }
     ''';
  }

  String getProductMetaData() {
    return '''
      query GetProductResponse(\$request: GetProductRequest!) {
        getProduct(request: \$request) {
          orderCloudProduct {
            materialID
            name
            description
            image
            thumbNail
            isFavourite
          }
          Items {
            PromotionMaterial
            HidePrice
            ID
            XP {
              Dosage
              HowToUse
              Composition
              DeliveryInstructions
            }
          }
        }
      }
      ''';
  }
}
