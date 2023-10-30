class ReturnRequestQuery {
  String searchReturnMaterials() {
    return '''
      fragment MaterialsFields on returnMaterialInformation {
        item {
          assignmentNumber
          material
          materialDescription
          balanceQuantity
          batch
          eligibleForReturn
          priceDate
          unitPrice
          totalPrice
          principalCode
          principalName
          expiryDate
          itemNumber
          outsidePolicy
          bonusItem {
            assignmentNumber
            material
            materialDescription
            balanceQuantity
            eligibleForReturn
            batch
            priceDate
            unitPrice
            totalPrice
            principalCode
            principalName
            expiryDate
            itemNumber
            outsidePolicy
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

  String addFileRequest() {
    return '''
    mutation AddFileRequest(\$folder: String!, \$req: [UploadFile!]!) {
      addRequestFileUpload(folder: \$folder, req: \$req) {
        id
        path
      }
    }
  ''';
  }

  String deleteFile() {
    return '''
   mutation DeleteFile(\$filePath: String!) {
      deleteFile(file: \$filePath) {
        isDeleted
      }
    }
  ''';
  }

  String addRequest() {
    return '''
    mutation addRequestV2(\$returnInput: returnInput!) {
      addRequestV2(input: \$returnInput) {
        requestID
        messages {
          childRequestID
          message {
            type
            number
            message
          }
        }
      }
    }
  ''';
  }
}
