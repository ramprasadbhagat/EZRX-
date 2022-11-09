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
        \$isForFOC: Boolean) {
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
        \$isSample: Boolean) { 
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
        }
      }
    }
    ''';
  }

//   String getItemsFilteredSalesRep({
//     required String username,
//     required String custCode,
//     required String shipToCode,
//     required String salesOrg,
//     required int paginate,
//     required String languageActive,
//     required List excludePrincipal,
//     required String searchKeyActive,
//     required String orderBy,
//     required bool gimmickMaterial,
//     required String pickandpack,
//     required List<String> principalNameList,
//     required List<String> itemBrandList,
//     required List<String> therapeuticClassList,
//     required int offset,
//   }) {
//     // final filterKey =
//     //     searchKeyActiveFilter.isEmpty ? '' : searchKeyActiveFilter;
//     var language = '';
//     if (languageActive != '') {
//       language = ''', language: "$languageActive" ''';
//     }

//     final searchKey = searchKeyActive.isEmpty ? '' : searchKeyActive;

//     return '''
//     {
//       customerMaterialsForSalesRep(username: "$username",
//       customerSoldToCode: "$custCode", customerShipToCode: "$shipToCode",
//       salesOrganisation: "$salesOrg" ,language:$language , orderBy: "$orderBy",
//       excludePrincipal: $excludePrincipal ,$searchKey,
//        first:  $paginate ,after: $offset,gimmickMaterial:$gimmickMaterial true}) {
//         rawMetaData{
//           count
//         }
//         processedMetaData{
//           count
//         }
//         materials {
//           materialNumber
//           isSampleMaterial
//           isFOCMaterial
//           materialDescription
//           governmentMaterialCode
//           principalName
//           principalCode
//           therapeuticClass
//           itemBrand
//           taxClassification
//           itemRegistrationNumber
//           unitOfMeasurement
//           materialGroup2
//           materialGroup4
//           taxes
//           hidePrice
//           hasValidTenderContract
//           hasMandatoryTenderContract
//         }
//       }
//     }
//     ''';
//   }

// ////////////queryyyyyyyyyyyy

//   String getMaterialList({
//     required String custCode,
//     required String shipToCode,
//     required String salesOrg,
//     required int paginate,
//     required String languageActive,
//     required List excludePrincipal,
//     required String searchKeyActive,
//     required String orderBy,
//     required MaterialFilter searchKeyActiveFilter,
//     required List<String> principalNameList,
//     required List<String> itemBrandList,
//     required List<String> therapeuticClassList,
//     required int offset,
//   }) {
//     var language = '';
//     var searchKey = '';
//     if (searchKeyActive != '') {
//       searchKey = ''', searchKey: "$searchKeyActive" ''';
//     }
//     if (languageActive != '') {
//       language = ''', language: "$languageActive" ''';
//     }
//     var orderBy = '';
//     orderBy = ''', orderBy: "$orderBy" ''';
//     final principalName = principalNameList.isEmpty
//         ? ''
//         : ''',principalName:"$principalNameList"''';
//     final itemBrand =
//         itemBrandList.isEmpty ? '' : ''',itemBrand:"$itemBrandList"''';

//     final therapeuticClass = therapeuticClassList.isEmpty
//         ? ''
//         : ''',therapeuticClass:"$therapeuticClassList"''';

//     return '''{
//             materialsWithMeta(customer: "$custCode",
//              shipToCustomer: "$shipToCode",salesOrganisation: "$salesOrg",
//              excludePrincipal: $excludePrincipal $searchKey,first: $paginate ,after:$offset,
//  $principalName
//  $therapeuticClass
// $itemBrand

// )

// {
//               rawMetaData{
//                 count
//               }
//               processedMetaData{
//                 count
//               }
//               materials {
//                 materialNumber
//                 isSampleMaterial
//                 isFOCMaterial
//                 materialDescription
//                 governmentMaterialCode
//                 principalName
//                 principalCode
//                 therapeuticClass
//                 itemBrand
//                 taxClassification
//                 itemRegistrationNumber
//                 unitOfMeasurement
//                 materialGroup2
//                 materialGroup4
//                 taxes
//                 hidePrice
//                 hasValidTenderContract
//                 hasMandatoryTenderContract
//               }
//             }
//           }
// ''';
//   }
}
