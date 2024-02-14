class RequestInformationQuery {
  String getReturnInformationQuery() {
    return '''
       query requestInformationV2(\$request: requestInformationRequest!) {
  requestInformationV2(request: \$request) {
    requestHeader {
      soldTo
      refundTotal
      returnReference
      specialInstructions
      cName1
      requestID
      createdDate
      createdTime
      createdBy
      bapiStatus
      totalItemCount
    }
    requestInformationV2 {
      invoiceNo
      expiryDate
      comment
      remarks
      rejectReason
      returnQuantity
      unitPrice
      totalPrice
      initialQuantity
      priceOverrideTrail {
          overriderRole
          overrideValue
      }
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
      attachmentUrl {
        fileName
        fileUrl
      }
      attachments
      priceDate
      createdDate
      overrideValue
      returnOrderDesc
      principal
      principalName
      prsfd
      bapiSalesDocNumber
      bapiStatus
      status
      statusReason
      outsidePolicy
      invoiceDate
      bonusInformation {
      invoiceNo
      expiryDate
      comment
      rejectReason
      returnQuantity
      unitPrice
      totalPrice
      overrideValue
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
      attachmentUrl {
        fileName
        fileUrl
      }
      attachments
      priceDate
      createdDate
      returnOrderDesc
      principal
      principalName
      bapiSalesDocNumber
      bapiStatus
      status
      statusReason
      outsidePolicy
      invoiceDate
      }
    }
  }
}
    ''';
  }
}
