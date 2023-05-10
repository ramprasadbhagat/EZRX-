class AdminPoAttachmentQueryMutation {
  String adminPoAttachmentQuery() {
    return '''
      query getPOAttachmentQuery(
        \$soldTo: String, 
        \$fromDate: String, 
        \$toDate: String, 
        \$shipTo: String, 
        \$salesOrg: String, 
        \$fileName: String, 
        \$exRxNo: String, 
        \$first: Int!, 
        \$after: Int!, 
        \$orderNumber: String) {
          getPOAttachment(
            soldTo: \$soldTo, 
            fromDate: \$fromDate, 
            toDate: \$toDate, 
            shipTo: \$shipTo, 
            salesOrg: \$salesOrg, 
            fileName: \$fileName, 
            exRxNo: \$exRxNo, 
            first: \$first, 
            after: \$after, 
            orderNumber: \$orderNumber) {
    salesOrderNumber
    ezrxReferenceNumber
    createdBy
    createdTime
    documentUrl
    documentName
    salesOrg
    soldToCode
    shipToCode
    tempOrderNumber
      }
    }
    ''';
  }
}
