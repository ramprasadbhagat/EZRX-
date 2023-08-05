class MaterialFilterQueryMutation {
  String getMaterialFilterCategoryList() {
    return '''
      query (\$request: GetFilterListRequest!) {
        GetFilterList(request: \$request) {
          ManufactureList
          CountryList {
            Code
            Name
          }
          BrandList
        }
      }
    ''';
  }

  String getMaterialFilterCategoryListSalesRep() {
    return '''
      query customerMaterialsForSalesRep(\$customer: String!,\$customerShipToCode: String!,\$salesOrganisation: String!, \$username: String!
                                         \$gimmickMaterial: Boolean, \$language: String){
      customerMaterialsForSalesRep(customerSoldToCode:\$customer,
        customerShipToCode:\$customerShipToCode,
        salesOrganisation:\$salesOrganisation,
        username: \$username,
        gimmickMaterial: \$gimmickMaterial,
        language: \$language
      ){
      rawMetaData{
        uniqueTherapeuticClass
        uniqueItemBrand
        uniquePrincipalName
       }
      }
    }
    ''';
  }
}
