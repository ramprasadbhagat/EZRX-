class MaterialsWithMetaQuery {
  String getProductQuery() {
    return '''
      query (\$request: GetAllProductsRequest!) {
        GetAllProducts(request: \$request) {
          Count
          Products {
            Code
            Name
            PrincipalCode
            materialNumber
            materialDescription
            Manufactured
            IsFavourite
            isFOCMaterial
            materialGroup4
            Type
            HidePrice
            BundleInformation {
              BundleName
              BundleCode
              Conditions
              BonusEligible
              BundleInformation {
                Sequence
                Quantity
                Type
                Rate
              }
            }
            Data {
              MaterialCode
              Manufactured
              MaterialDescription
              DefaultMaterialDescription
              GenericMaterialName
              Manufactured
              GovernmentMaterialCode
            }
            DataTotalCount
            DataTotalHidden
            HidePrice
            IsGimmick
          }
        }
      }
    ''';
  }

  String getProductDetailsQuery() {
    return '''
    query GetProductDetails(\$request: GetProductDetailsRequest!) {
      GetProductDetails(request: \$request) {
        Code
        Name
        Manufactured
        Type
        IsFavourite
        BundleInformation {
          BundleName
          BundleCode
          Conditions
          BonusEligible
          BundleInformation {
            Sequence
            Quantity
            Type
            Rate
          }
        }
        Data {
          MaterialCode
          Manufactured
          MaterialDescription
          DefaultMaterialDescription
          GenericMaterialName
          ItemRegistrationNumber
          __typename
        }
        DataTotalCount
        DataTotalHidden
        IsGimmick
        __typename
      }
    }
    ''';
  }

  String addFavouriteMutation() {
    return '''
      mutation addFavouriteMaterial(\$materialNumber: String!){
        addFavouriteMaterial(materialNumber:\$materialNumber)
          }
    ''';
  }

  String removeFavouriteMutation() {
    return '''
      mutation removeFavouriteMaterial(\$materialNumber: String!){
        removeFavouriteMaterial(materialNumber:\$materialNumber)
      }
    ''';
  }

  String getComboDealPrincipalMaterialsQuery() {
    return '''
      query (\$request: GetAllProductsRequest!) {
        GetAllProducts(request: \$request) {
          Count
          Products {
            Code
            Name
            PrincipalCode
            materialNumber
            materialDescription
            Manufactured
            IsFavourite
            isFOCMaterial
            materialGroup4
            Type
            HidePrice
            BundleInformation {
              BundleName
              BundleCode
              Conditions
              BonusEligible
              BundleInformation {
                Sequence
                Quantity
                Type
                Rate
              }
            }
            Data {
              MaterialCode
              Manufactured
              MaterialDescription
              DefaultMaterialDescription
              GenericMaterialName
              Manufactured
              GovernmentMaterialCode
            }
            DataTotalCount
            DataTotalHidden
            HidePrice
            IsGimmick
          }
        }
      }
    ''';
  }
}
