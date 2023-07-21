class ProductDetailQuery {
  String getMaterialDetails() {
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
        materialBrand
        isFavourite
        defaultMaterialDescription
        country
        countryName
        hidePrice
        governmentMaterialCode
        itemRegistrationNumber
      }
    }
     ''';
  }

  String getSimilarProductQuery() {
    return '''
     query similarSearches(
      \$principalCode: String, 
      \$first: Int, 
      \$after: Int,
      \$language: String,
      \$resultCount: Int, 
      \$excludeMaterialNumber: String, 
      \$customerCode: String!, 
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
      ) {
        materials {
          principalName
          principalCode
          materialNumber
          materialDescription
          defaultMaterialDescription
          itemBrand
          isFavourite
          hidePrice
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
