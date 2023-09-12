class ViewByOrderQuery {
  String getOrderHistoryV3() {
    return '''
query orderHistoryQuery(
 \$soldTo: String!, 
  \$fromDate: String, 
  \$toDate: String, 
  \$shipTo: [String], 
  \$first: Int, 
  \$after: Int, 
  \$orderBy: String, 
  \$sort: String, 
  \$language: String, 
  \$searchKey: String,   
  \$salesOrg: [String],
 ) {
  orderHistoryV3(
   request: {
      soldTo: \$soldTo, 
      shipTo: \$shipTo, 
      fromDate: \$fromDate, 
      toDate: \$toDate, 
      first: \$first, 
      after: \$after, 
      orderBy: \$orderBy, 
      sort: \$sort, 
      language: \$language, 
      searchKey: \$searchKey,  
      salesOrg: \$salesOrg,
     }
  ) {
    orderCount
    creatingOrderIds
   orderHeaders {
      Type
      OrderNumber
      EZRXNumber
      SoldTo
      ShipTo
      CompanyName
      OrderValue
      ProcessingStatus
      CreatedDate
      CreatedTime
      RequestedDeliveryDate
      TotalTax
      POReference
      HasPOAttachment
      ItmCount
      ItmDescription
      PaymentMethod
      IsGreen
      OrderItems {
        MaterialCode
        MaterialDescription
        DefaultMaterialDescription
       
      }
     
    }
  
  }
}
''';
  }
}
