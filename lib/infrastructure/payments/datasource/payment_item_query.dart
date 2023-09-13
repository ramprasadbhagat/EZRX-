class PaymentItemQuery {
  String getPaymentItemQuery() {
    return '''
      query paymentItems(\$request: paymentItemsRequest!) {
  paymentItems(request: \$request) {
    accountingDocument
    accountingDocumentItem
    netDueDate
    postingDate
    documentDate
    transactionCurrency
    paymentAmountInDisplayCrcy
    postingKeyName
    documentReferenceID
    accountingDocumentType
  }
} 
    ''';
  }
}
