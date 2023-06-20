class ViewByOrderQuery {
  String getOrderHistory() {
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
  \$creatingOrderIds: [String!]) {
  orderHistory(
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
      creatingOrderIds: \$creatingOrderIds}
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
      MaterialCount
      ItmDescription
      HasPOAttachment
      ItmCount
      TelephoneNumber
      OrderBy
      
    }
   
  }
}
''';
  }
}
