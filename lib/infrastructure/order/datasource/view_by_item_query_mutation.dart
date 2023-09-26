class ViewByItemQueryMutation {
  String getViewByItem() {
    return '''
     query orderHistoryFetchByItems(\$soldTo: String!, \$fromDate: String, \$toDate: String, \$shipTo: [String], \$first: Int, \$after: Int, \$language: String, \$orderStatus: [String!], \$searchKey: String, \$salesOrg: [String]) {
  orderHistoryFetchByItems(
    soldTo: \$soldTo
    fromDate: \$fromDate
    toDate: \$toDate
    shipTo: \$shipTo
    first: \$first
    after: \$after
    language: \$language
    orderStatus: \$orderStatus
    searchKey: \$searchKey
    salesOrg: \$salesOrg
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
        ItemRegistrationNumber
        TelephoneNumber
        HidePrice
       
      }
     
    }
   
  }
}
      ''';
  }

  String getViewByItemDetails() {
    return '''
   query orderHistoryFetchByItems(\$soldTo: String!, \$language: String, \$materialSearch: String, \$searchKey: String, \$fromDate: String, \$toDate: String, \$salesOrg: [String], \$filterBlockCustomer: Boolean) {
  orderHistoryFetchByItems(
    soldTo: \$soldTo
    language: \$language
    materialSearch: \$materialSearch
    searchKey: \$searchKey
    fromDate: \$fromDate
    toDate: \$toDate
    salesOrg: \$salesOrg
    filterBlockedCustomer: \$filterBlockCustomer
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
        Batch
        ExpiryDate
        IsMarketplace
        Seller
        POReference
        ManufactureName
        SpecialInstructions
        RequestedDeliveryDate
        IsBonusMaterial
        ParentID
        GovernmentMaterialCode
        ItemRegistrationNumber
        TelephoneNumber
        HidePrice
        TenderContractNumber
        TenderOrderReason
        TenderPrice
        TenderPriceUnit
        TenderContractReference
        InvoiceNumber
        mrp
        promotype
        promoStatus
        
      }
      
    }
    
  }
}
      ''';
  }

  String getProduct() {
    return '''
      query GetProductResponse(\$request: GetProductRequest!) {
        getProduct(request: \$request) {
          orderCloudProduct {
            materialID
            name
            description
            image
            thumbNail
            isFavourite
          }
          Items {
            PromotionMaterial
            HidePrice
            XP {
              Dosage
              HowToUse
              Composition
              DeliveryInstructions
              Usability
            }
          }
        }
      }
      ''';
  }
}
