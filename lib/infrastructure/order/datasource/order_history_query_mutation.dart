class OrderHistoryQueryMutation {
  String getOrderHistoryForCustomer() {
    return '''
      query orderHistoryV2(                                                                   
      \$soldTo: String!,
      \$shipTo: [String],
      \$fromDate: String!,
      \$toDate: String!,
      \$orderStatus: [String!], 
      \$language: String,
      \$query: String,
      \$first: Int!,
      \$after: Int!,
    
      )
      {
      orderHistoryV2(
        soldTo: \$soldTo, 
        shipTo:\$shipTo, 
        fromDate:\$fromDate, 
        toDate:\$toDate,
        orderStatus:\$orderStatus,
        after:\$after,
        first:\$first,
        language:\$language,
        query:\$query,
        ){
          OrderCount
         OrderHistory {
      OrderBasicInformation {
        SoldTo
        CompanyName
        ShipTo
        PaymentTerm {
          PaymentTermCode
          PaymentTermDescription
         
        }
       
      }
      OrderItems {
        MaterialCode
        MaterialDescription
        DefaultMaterialDescription
        CreatedTime
        CreatedDate
        Qty
        UnitPrice
        TotalPrice
        Status
        LineNumber
        Tax
        DeliveryDate
        DeliveryTime
        OrderType
        EZRXNumber
        OrderNumber
        OrderBy
        PurchaseOrderType
        WarehouseStorageCondition
        OrderNumber
        Available
        Batch
        ExpiryDate
        IsMarketplace
        Seller
        POReference
        ManufactureName
        InvoiceNumber
        IsBonusMaterial
        GovernmentMaterialCode
        TelephoneNumber
       
      }
      
    }
        }
      }
      ''';
  }

  String getOrderHistoryForSalesRep() {
    return '''
      query orderHistoryForSalesRepV2(
      \$orderStatus: [String!],  
      \$language: String!,
      \$first: Int!,
      \$after: Int!,
      \$shipTo: [String],
      \$soldTo: String!,
      \$userName: String!,
     \$fromDate: String!,
      \$toDate: String!,
      ){
       orderHistoryForSalesRepV2(
        orderStatus:\$orderStatus,
        language:\$language,
        shipTo:\$shipTo,
        soldTo:\$soldTo,
        after:\$after,
        first:\$first, 
        userName:\$userName,
        fromDate:\$fromDate, 
        toDate:\$toDate,
      ) {
        OrderCount
            OrderHistory {
      OrderBasicInformation {
        SoldTo
        CompanyName
        ShipTo
        PaymentTerm {
          PaymentTermCode
          PaymentTermDescription
         
        }
       
      }
      OrderItems {
        MaterialCode
        MaterialDescription
        DefaultMaterialDescription
        CreatedTime
        CreatedDate
        Qty
        UnitPrice
        TotalPrice
        Status
        LineNumber
        Tax
        DeliveryDate
        DeliveryTime
        OrderType
        EZRXNumber
        OrderNumber
        OrderBy
        PurchaseOrderType
        WarehouseStorageCondition
        OrderNumber
        Available
        Batch
        ExpiryDate
        IsMarketplace
        Seller
        POReference
        ManufactureName
        InvoiceNumber
        IsBonusMaterial
        GovernmentMaterialCode
        TelephoneNumber
       
      }
      
    }
          }
        }''';
  }
}
