class OrderHistoryQueryMutation {
  String getOrderHistoryRep() {
    return '''
      query orderHistoryV2(                                                                   
      \$soldTo: String!,
      \$shipTo: [String],
      \$fromDate: String!,
      \$toDate: String!,
      \$orderBy: String!, 
      \$companyName: String,
      \$first: Int!,
      \$after: Int!,
      \$sort:String!
      \$orderNumber:String! 
     \$poReference:String!
     \$materialSearch:String!
     \$principalSearch:String!
      )
      {
      orderHistoryV2(
        soldTo: \$soldTo, 
        shipTo:\$shipTo, 
        fromDate:\$fromDate, 
        toDate:\$toDate,
        orderBy:\$orderBy,
       companyName: \$companyName,
        after:\$after,
        first:\$first,
        sort:\$sort,
        orderNumber:\$orderNumber,
        poReference:\$poReference,
        materialSearch:\$materialSearch,
        principalSearch:\$principalSearch,){
          OrderHistory{
            OrderBasicInformation{ SoldTo ShipTo CompanyName }
            OrderItems {
              MaterialCode
              MaterialDescription
              Qty
              UnitPrice
              TotalPrice
              Status
              DeliveryDate
              DeliveryTime
              LineNumber
              Tax
              OrderType
              OrderNumber
              EZRXNumber
              CreatedDate
              CreatedTime
              OrderBy
              PurchaseOrderType  
            }
          }
        }
      }
      ''';
  }

  String getOrderHistoryForSalesRep() {
    return '''
      query orderHistoryForSalesRepV2(
      \$orderBy: String!,  
      \$language: String!,
      \$first: Int!,
      \$after: Int!,
      \$shipTo: [String],
      \$soldTo: String!,
      \$userName: String!,
      \$sort:String!
      \$orderNumber:String! 
     \$poReference:String!
     \$materialSearch:String!
     \$principalSearch:String!
      ){
       orderHistoryForSalesRepV2(
        orderBy:\$orderBy,
        language:\$language,
        shipTo:\$shipTo,
        soldTo:\$soldTo,
        after:\$after,
        first:\$first, 
        userName:\$userName,
        sort:\$sort,
        orderNumber:\$orderNumber,
        poReference:\$poReference,
        materialSearch:\$materialSearch,
        principalSearch:\$principalSearch,
      ) {
            OrderHistory {
              OrderBasicInformation { SoldTo ShipTo CompanyName }
              OrderItems {
                MaterialCode
                MaterialDescription
                Qty
                UnitPrice
                TotalPrice
                Status
                DeliveryDate
                DeliveryTime
                LineNumber
                Tax
                OrderType
                OrderNumber
                EZRXNumber
                CreatedDate
                CreatedTime
                OrderBy
                PurchaseOrderType
              }
            }
          }}
        }''';
  }
}
