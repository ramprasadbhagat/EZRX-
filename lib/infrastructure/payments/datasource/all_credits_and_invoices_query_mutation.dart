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
          companyCode
          bpCustomerNumber
          accountingDocument
          accountingDocumentType
          fiscalYear
          accountingDocumentItem
          specialGLCode
          postingKey
          postingKeyName
          netDueDate
          postingDate
          transactionCurrency
          billingDocument
          referenceDocumentNumber
          payerParty
          payerName1
          dueCalculationBaseDate
          cashDiscount1DueDate
          cashDiscount2DueDate
          cashDiscount1Percent
          cashDiscount2Percent
          invoiceProcessingStatus
          documentReferenceID
          purchaseOrderByCustomer
          customerReferenceNumber
          openAmountInTransCrcy
          grossAmount
          netAmount
          taxAmount
          paymentAmount
          iban
          bankAccountNumber
          bankName
          memoLine
          paymentCardType
          paymentCardTypeName
          paymentCardNumber
          paymentCardMaskedNumber
          paymentCardHolderName
          debitCreditCode
          postingPeriod
          clearingAccountingDocument
          clearingDate
          documentDate
          amountInTransactionCurrency
          isDisputed
          disputeCaseUUID
          disputeCaseStatus
          disputeCaseStatusName
          invoiceReference
          partnerFunctionIsPrintRelevant
          functionIsXMLRelevant
          invoiceIsResidualForInference
          returnId
          orderId
        }
        totalCount
      }
      }
    ''';
  }
}
