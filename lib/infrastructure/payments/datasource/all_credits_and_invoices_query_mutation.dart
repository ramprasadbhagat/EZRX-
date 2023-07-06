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

  String getDocumentHeaderListQuery() {
    return '''
    query customerDocumentHeader(\$input: customerDocumentHeaderRequest!) {
      customerDocumentHeader(request: \$input) {
          documentHeaderList {
          bpCustomerNumber
          fiscalYear
          accountingDocumentItem
          netDueDate
          referenceDocumentNumber
          postingDate
          amountInTransactionCurrency
          invoiceReference
          invoiceProcessingStatus
          orderId
          accountingDocumentType
          accountingDocument
          postingKeyName
        }
        totalCount
      }
      }
    ''';
  }
}
