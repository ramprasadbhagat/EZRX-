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
          documentDate
          amountInTransactionCurrency
          documentReferenceID
          postingKeyName
          transactionCurrency
          accountingDocExternalReference
          bpCustomerNumber
          debitCreditCode
          cashDiscountAmountInDspCrcy
          cashDiscountDueDate
          totalAmountInDisplayCrcy
          displayCurrency
          openAmountInDisplayCrcy
          fiscalYear
          isDisputed
          accountingDocumentItem
          accountingDocumentItemRef
          partialPaymentHistoryDesc
          paymentAmountInDisplayCrcy
          companyCode
          openAmountInTransCrcy
        }
      }
    }
    ''';
  }

  String payQuery() {
    return '''
    mutation addCustomerPayment(\$input: addCustomerPaymentInput!) {
      addCustomerPayment(input: \$input) {
      paymentID
      paymentBatchAdditionalInfo
    }
  }
    ''';
  }

  String getCustomerPaymentQuery() {
    return '''
  query customerPayment(\$request: customerPaymentRequest!) {
  customerPayment(request: \$request) {
    total
    showing
    totalPaymentInProgress
    resultPaymentInProgress
    customerPaymentResponse {
      paymentID
      valueDate
      paymentAmount
      transactionCurrency
      paymentDocument
      invoiceProcessingStatus
      accountingDocExternalReference
      paymentMethod
      extensibilityCustomField {
        paymentBatchAdditionalInfo {
          businessContext
          label
          technicalName
        }
      }
      zCcpPaymentQRCode
      paymentBatchAdditionalInfo
      zzAdvice
      zzHtmcs
      adviceExpiry
      createdDate
      status
    }
  }
}
    ''';
  }

  String updatePaymentGatewayQuery() {
    return '''
    mutation updatePaymentGatewayMutation(\$input: updatePaymentGatewayInput!) {
      updatePaymentGateway(input: \$input) {
        message
      }
    }''';
  }

  String getPaymentInvoiceInfoPdf() {
    return '''
    query paymentInvoicePdf(\$request: paymentInvoiceRequest!) {
      paymentInvoicePdf(request: \$request) {
        valueDate
        paymentID
        zzAdvice
        paymentDue
        paymentMethod
        customerName
        payer
        bankBeneficiary {
         beneficiaryName
         bankName
         branch
         bankCode
         bankAccount
         hdbcSwiftCode
         bankAddress
         payNowUen
         emailId
        }
        qrCode
        paymentBatchAdditionalInfo
        paymentItems {
          postingKeyName
          accountingDocument
          documentDate
          transactionCurrency
          paymentAmountInDisplayCrcy
          documentReferenceID
        }
        salesDistrict
        footer
        headerLogoPath
        pleaseNote
        header
      }
    }
    ''';
  }

  String fetchPaymentMethodQuery() {
    return '''
    query availablePaymentMethods(\$request: availablePaymentMethodsRequest!) {
      availablePaymentMethods(request: \$request) {
        paymentMethods
      }
    }
    ''';
  }
}
