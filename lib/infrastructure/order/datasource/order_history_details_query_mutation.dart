class OrderHistoryDetailsQueryMutation {
  String getOrderHistoryDetails() {
    return '''
      query orderDetails(\$salesDocument: String!, \$language: String, \$companyName: String) {
  orderDetails(salesDocument: \$salesDocument, language: \$language, companyName: \$companyName) {
    OrderHeader {
      TotalTax
      RequestedDeliveryDate
      POReference
      OrderBy
      Type
      TelephoneNumber
      EZRXNumber
      OrderBy
      OrderValue
      CreatedDate
      ReferenceNotes
    }
    ShippingInformation {
      Address
      POReference
      InvoiceNumber
      InvoiceDate
      Invoices {
        InvoiceNumber
        InvoiceDate
        InvoicePrice
      }
      Country
      Phone
      Fax
    }
    OrderItems {
      MaterialCode
      MaterialDescription
      TotalPrice
      Tax
      SAPStatus
      PlannedDeliveryDate
      Qty
      PickedQuantity
      UnitPrice
      TotalPrice
      Type
      LineNumber
      Batch
      ExpiryDate
      LineReferenceNotes

      Details {
        DiscountCode
        DiscountDescription
        Rate
      }
      IsTenderContractMaterial
      TenderContractDetails {
        TenderContractNumber
        TenderContractReference
        TenderPackageDescription
      }
    }
    PaymentTerm {
      PaymentTermCode
      PaymentTermDescription
    }
    SpecialInstructions
    PODocuments {
      Url
      Name
    }
    Messages {
      Type
      Message
    }
  }
}
      ''';
  }

  String getOrderHistoryDetailsForSalesRep() {
    return '''
     query orderDetailsForSalesRep(
  \$salesDocument: String!
  \$companyName: String!
  \$language: String!
  \$userName: String!
) {
  orderDetailsForSalesRep(
    salesDocument: \$salesDocument
    companyName: \$companyName
    language: \$language
    userName: \$userName
  ) {
    OrderHeader {
      TotalTax
      RequestedDeliveryDate
      POReference
      OrderBy
      Type
      TelephoneNumber
      EZRXNumber
      OrderBy
      OrderValue
      CreatedDate
    }
    ShippingInformation {
      Address
      POReference
      InvoiceNumber
      InvoiceDate
      Invoices {
        InvoiceNumber
        InvoiceDate
        InvoicePrice
      }
      Country
      Phone
      Fax
    }
    OrderItems {
      MaterialCode
      MaterialDescription
      TotalPrice
      Tax
      SAPStatus
      PlannedDeliveryDate
      Qty
      PickedQuantity
      UnitPrice
      TotalPrice
      Type
      LineNumber
      Batch
      ExpiryDate
      LineReferenceNotes

      Details {
        DiscountCode
        DiscountDescription
        Rate
      }
      IsTenderContractMaterial
      TenderContractDetails {
        TenderContractNumber
        TenderContractReference
        TenderPackageDescription
      }
    }
    PaymentTerm {
      PaymentTermCode
      PaymentTermDescription
    }
    SpecialInstructions
    PODocuments {
      Url
      Name
    }
    Messages {
      Type
      Message
    }
  }
}''';
  }
}
