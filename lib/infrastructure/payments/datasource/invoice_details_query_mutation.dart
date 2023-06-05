class InvoiceDetailsQueryMutation {
  String getInvoiceDetails() {
    return '''
    query customerDocumentDetails(\$input: customerDocumentDetailsRequest!) {
      customerDocumentDetails(request: \$input) {
        billingDocumentItem
        salesDocumentItemType
        material
        billingDocumentItemText
        billingQuantity
        billingQuantityUnit
        salesMeasureISOUnit
        referenceSDDocument
        referenceSDDocumentItem
        referenceSDDocumentCategory
        grossAmount
        netAmount
        taxAmount
        transactionCurrency
      }
    }
    ''';
  }
}
