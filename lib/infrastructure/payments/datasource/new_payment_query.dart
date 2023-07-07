class NewPaymentQuery {

  String getCustomerOpenItemsQuery() {
    return '''
    query customerOpenItems(\$request: customerOpenItemsRequest!) {
      customerOpenItems(request: \$request) {
        total
        customerOpenItemsResponse {
          status
          accountingDocument
          netDueDate
          amountInTransactionCurrency
          documentReferenceID
          postingKeyName
        }
      }
    }
    ''';
  }
}
