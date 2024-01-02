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
    query customerDocumentHeaderV2(\$input: customerDocumentHeaderRequest!) {
      customerDocumentHeaderV2(request: \$input) {
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
          deliveryFee
          discount
          manualFee
          taxAmount
          documentDate
          debitCreditCode
          referenceId
          documentReferenceID
        }
        totalCount
      }
      }
    ''';
  }

  String getOrderForInvoice() {
    return '''
      query getOrdersForInvoiceId(\$invoiceId: [String!]) {
        getOrdersForInvoiceId(invoiceId: \$invoiceId) {
          invoice
          orderId
        }
      }
    ''';
  }
}
