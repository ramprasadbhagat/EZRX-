class MaterialFilterQueryMutation{
  
String getMaterialFilterCategoryList() {
    return '''
      query materialsWithMeta(\$customer: String!,\$salesOrganisation: String!,\$shipToCustomer:String!,\$language: String!){
      materialsWithMeta(customer: \$customer, salesOrganisation: \$salesOrganisation, shipToCustomer: \$shipToCustomer, language: \$language) {
        rawMetaData{
          uniqueItemBrand,
          uniquePrincipalName,
          uniqueTherapeuticClass,
        }
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