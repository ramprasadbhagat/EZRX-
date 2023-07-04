class ViewByItemQueryMutation {
  String getViewByItemForCustomer() {
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
        CreatedDate
        Qty
        UnitPrice
        TotalPrice
        Status
        DeliveryDate
        OrderNumber
        OrderBy
        OrderNumber
        Batch
        ExpiryDate
        POReference
        ManufactureName
        InvoiceNumber
        IsBonusMaterial
        TelephoneNumber
        Tax
       
      }
      
    }
        }
      }
      ''';
  }

  String getViewByItemForSalesRep() {
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
        CreatedDate
        Qty
        UnitPrice
        TotalPrice
        Status
        DeliveryDate
        OrderType
        OrderBy
        OrderNumber
        Batch
        ExpiryDate
        POReference
        ManufactureName
        InvoiceNumber
        IsBonusMaterial
        TelephoneNumber
        Tax
       
      }
      
    }
          }
        }''';
  }

  String getViewByItemDetails() {
    return '''
    query itemOrderHistoryV2(\$soldTo: String!, \$language: String, \$materialSearch: String, \$orderNumber: String) {
  orderHistoryV2(
    soldTo: \$soldTo
    language: \$language
    materialSearch: \$materialSearch
    orderNumber: \$orderNumber
  ) {
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
        CreatedDate
        Qty
        UnitPrice
        TotalPrice
        Status
        DeliveryDate
        OrderType
        OrderNumber
        OrderBy
        Batch
        ExpiryDate
        POReference
        ManufactureName
        SpecialInstructions
        RequestedDeliveryDate
        IsBonusMaterial
        ParentID
        TelephoneNumber
        
      }
      
    }
    
  }
}
      ''';
  }
}
