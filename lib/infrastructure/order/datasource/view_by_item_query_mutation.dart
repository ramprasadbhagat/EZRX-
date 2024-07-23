class ViewByItemQueryMutation {
  String getViewByItem(bool enableMarketplace) {
    return '''
     query orderHistoryFetchByItems(
        \$soldTo: String!,
        \$fromDate: String,
        \$toDate: String, 
        \$shipTo: [String], 
        \$first: Int, 
        \$after: Int, 
        \$language: String, 
        \$orderStatus: [String!], 
        \$searchKey: String, 
        \$salesOrg: [String], 
        \$filterBlockCustomer: Boolean, 
        \$materialSearch: String, 
        \$orderNumber: String, 
        \$isOptimised: Boolean, 
        ${enableMarketplace ? '\$orderType: Int,' : ''}
      ) {
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
    orderNumber: \$orderNumber
    isOptimised: \$isOptimised
    ${enableMarketplace ? 'orderType: \$orderType' : ''}
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
        TotalUnitPrice
        TotalPrice
        Status
        LineNumber
        Tax
        TotalTax
        TaxRate
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
        ${enableMarketplace ? 'IsMarketplace' : ''}
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
        isTenderExpire
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
        referenceNotes
        isCovid
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

  String getInvoiceDetailsForOrder() {
    return '''
     query GetInvoiceDetailsForOrder(\$invoicesByOrderRequest: invoicesByOrderRequest!) {
      GetInvoiceDetailsForOrder(input: \$invoicesByOrderRequest) {
          InvoiceNumber
          InvoiceProcessingStatus
          InvoiceDate
          InvoiceTotalQty
          InvoiceTotalPrice
          InvoiceItems {
              MaterialCode
              MaterialDescription
              Qty
              UnitPrice
          }
      }
    }
    ''';
  }
}
