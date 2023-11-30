class ViewByItemQueryMutation {
  String getViewByItem() {
    return '''
     query orderHistoryFetchByItems(\$soldTo: String!, \$fromDate: String, \$toDate: String, \$shipTo: [String], \$first: Int, \$after: Int, \$language: String, \$orderStatus: [String!], \$searchKey: String, \$salesOrg: [String], \$filterBlockCustomer: Boolean, \$materialSearch: String) {
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
    materialSearch: \$materialSearch
    filterBlockedCustomer: \$filterBlockCustomer
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
        poAttachment {
          Url
          Name
        }
        isCounterOffer
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
        SpecialInstructions
        RequestedDeliveryDate
        InvoiceNumber
        IsBonusMaterial
        GovernmentMaterialCode
        ItemRegistrationNumber
        TelephoneNumber
        HidePrice
        TenderContractNumber
        TenderOrderReason
        TenderPrice
        TenderPriceUnit
        TenderContractReference
        isGreen
        IsBundle
        InvoiceNumber
        PrincipalCode
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

  String getInvoiceIdForOrders() {
    return '''
     query getInvoiceIdForOrders(\$orderNumbers: [String!]!) {
      getInvoiceIdForOrders(orderNumbers: \$orderNumbers) {
        orderId
        invoice
        lineNumber
      }
    }
  ''';
  }
}
