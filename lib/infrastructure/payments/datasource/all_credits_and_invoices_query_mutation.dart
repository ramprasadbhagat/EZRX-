class AllCreditsAndInvoicesQueryMutation {
  String getAvailableStatusesQuery() {
    return '''
    query availableStatuses(\$request: availableStatusesRequest!) {
      availableStatuses(request: \$request) {
        statuses
      }
    }
    ''';
  }

  String getCustomerDocumentHeaderQuery() {
    return '''
    query customerDocumentHeader(\$input: customerDocumentHeaderRequest!) {
      customerDocumentHeader(request: \$input) {
        documentHeaderList {
          accountingDocument
          accountingDocumentType
          fiscalYear
          accountingDocumentItem
          postingKeyName
          netDueDate
          postingDate
          transactionCurrency
          referenceDocumentNumber
          invoiceProcessingStatus
          grossAmount
          netAmount
          taxAmount
          amountInTransactionCurrency
          invoiceReference
          returnId
          orderId
        }
        totalCount
      }
      }
    ''';
  }
}
