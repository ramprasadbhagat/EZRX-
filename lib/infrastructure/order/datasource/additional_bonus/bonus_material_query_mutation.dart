// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class BonusMaterialQueryMutation {
  String getBonusItem() {
    return '''
   query additionalBonusMaterial(
     \$customerCode: String
\$shipToCode: String
\$salesOrganisation: String!
\$searchKey: String!
     
   
   ) {
      additionalBonusMaterial(salesOrganisation: \$salesOrganisation,
        searchKey: \$searchKey,
        customerCode: \$customerCode,
        shipToCode: \$shipToCode,
        ){
          processedMetaData{
            count
          }
          materials{
            isSampleMaterial
            principalCode
            principalName
            materialNumber
            materialDescription
            therapeuticClass
            itemBrand
          }
        }
    }
   ''';
  }

//                 "username": String!
// "customerSoldToCode": String!
// "customerShipToCode": String!
// "salesOrganisation": String!
// "gimmickMaterial": Boolean
// "searchKey": String
// "pickAndPack": String
  String getBonusItemforSalesRep() {
    return '''
   query customerMaterialsForSalesRep(
                username: String!
 \$customerSoldToCode : String!
 \$customerShipToCode : String!
 \$salesOrganisation : String!
 \$gimmickMaterial : Boolean
 \$searchKey : String
 \$pickAndPack : String
     
   
   )
    {
     customerMaterialsForSalesRep(username: "\$username", customerSoldToCode: "\$soldTo", 
     customerShipToCode:"\$shipTo", salesOrganisation:"\$salesOrganisation",
      gimmickMaterial: \$gimmickMaterial \$pickandpack, searchKey: "\$searchKey",){
        processedMetaData{
          count
        }
        materials{
          isSampleMaterial
          isFOCMaterial
          principalCode
          principalName
          materialNumber
          materialDescription
          therapeuticClass
          itemBrand
        }
      }
    }
   ''';
  }
}
