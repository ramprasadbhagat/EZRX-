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
    }
    requestInformationV2 {
      invoiceNo
      expiryDate
      comment
      rejectReason
      returnQuantity
      unitPrice
      totalPrice
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
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
      bonusInformation {
       invoiceNo
      expiryDate
      comment
      rejectReason
      returnQuantity
      unitPrice
      totalPrice
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
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
