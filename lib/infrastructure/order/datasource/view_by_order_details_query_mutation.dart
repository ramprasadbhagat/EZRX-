class ViewByOrderDetailsQueryMutation {
  String getOrderHistoryDetails() {
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
      ShipToAddres
      SoldToAddress
      CompanyName
      OrderValue
      DeliveryFee
      ManualFee
      ProcessingStatus
      CreatedDate
      CreatedTime
      RequestedDeliveryDate
      OrderBy
      TelephoneNumber
      POReference
      TotalTax
      ReferenceNotes
      TotalValue
      SpecialInstructions
      PaymentMethod
      InvoiceNumber
      PaymentTerm
      ItmCount
      HasPOAttachment
      ItmDescription
      PODocuments {
        Url
        Name
      }
      CustomerHolidays {
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday
      }
      OrderItems {
        Type
        MaterialCode
        MaterialDescription
        DefaultMaterialDescription
        Qty
        PickedQuantity
        UnitPrice
        TotalPrice
        LineReferenceNotes
        Batch
        ExpiryDate
        SAPStatus
        Tax
        taxClassification
        ParentID
        PlannedDeliveryDate
        PrincipalName
        PrincipalCode
        ProductType
        ItemBrand
        HidePrice
        mrp
        promotype
        promoStatus
        Batches {
          BatchNumber
          ExpiryDate
        }
        Details {
          DiscountCode
          DiscountDescription
          Rate
        }
        WarehouseStorageCondition
        GovernmentMaterialCode
        ItemRegistrationNumber
        IsTenderContractMaterial
        TenderContractDetails {
          ContractNumber
          OrderReason
          Price
          PriceUnit
          ContractQuantity
          RemainingQuantity
          ExpiryDate
          ContractReference
          VisaNumber
          SalesDistrict
          AnnouncementLetterNumber
        }
      }
      OrderHolidays {
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday
      }
      IsGreen
    }
  }
}''';
  }
}
