class ReturnSummaryQueryMutation {
  String getrequestsByUserV2Query() {
    return '''
       query(\$request: requestsByUserRequest!) {
        requestsByUserV2(request:\$request) 
       {
        requestID
        }
       }
    ''';
  }

  String getrequestInformationV2Query() {
    return '''
    query(\$request: requestInformationRequest!) {
  requestInformationV2(request:\$request) {
    requestHeader {
      soldTo
      shipTo
      createdBy
      returnType
      status
      createdDate
      createdTime
      requestID
      salesOrg
      refundTotal
      totalItemCount
      returnInvoices {
        invoiceNumber
        invoiceDate
        __typename
      }
      salesDoc {
        invoiceNo
        invoiceDate
        bapiSalesDoc
        ezrxNumber
        creditNotes {
          creditNoteId
          materials {
            materialNumber
            lineNumber
            materialDescription
            qty
            value
            __typename
          }
          __typename
        }
        __typename
      }
      returnTypeDesc
      ppaHeld
      cName1
      cName2
      cName3
      cName4
      street1
      street2
      street3
      street4
      __typename
    }
    requestInformationV2 {
      invoiceNo
      returnValue
      actionRequired
      expiryDate
      comment
      salesDocument
      exchangeOrder
      refundCurrency
      rejectReason
      exchangeOrderNumber
      docType
      referenceDocument
      division
      purchaseMethod
      usage
      distributionChannel
      approvalTimeStamp
      createdTimeStamp
      poDate
      returnQuantity
      unitPrice
      totalPrice
      billingItemNumber
      salesDocumentItemNumber
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
      attachmentUrl
      plant
      storageLocation
      highLevelItemCode
      orderReason
      priceDate
      createdDate
      overrideType
      overrideValue
      returnOrderText
      returnOrderDesc
      principal
      bapiSalesDocNumber
      eZRxNumber
      bapiStatus
      cnNumber
      status
      statusReason
      priceOverride
      remarks
      sendForDestruction
      returnToStock
      quarantine
      productRecall
      returnType
      returnTypeDesc
      purchaseNumberCOverride
      purchaseNumberC
      ppaHeld
      outsidePolicy
      __typename
    }
    __typename
  }
}
    ''';
  }
}
