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
      valueDate
      paymentAmount
      transactionCurrency
      paymentDocument
      invoiceProcessingStatus
      paymentMethod
      iban
      bankIdentification
      bankCountryKey
      bankKey
      bankAccountNumber
      bankName
      paymentCardID
      paymentCardNumber
      paymentCardHolderName
      paymentCardMaskedNumber
      paymentCardTypeName
      extensibilityCustomField
      customId
      tmpPaytByDigitalPaytService
      payerByPaymentServiceProvider
      paymentRefByPaytSrvcProvider
      paymentServiceProvider
      transactionStatus
      customerInvoice
      paymentCardData
      paytCardVerificatDetResultText
      disputeCaseInformationText
      userName
      paymentBatchAdditionalInfo
      accountingDocExternalReference
      zCcpPaymentQRCode
      zzHtmcs
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
        beneficiaryName
        bankName
        branch
        bankCode
        bankAccount
        hdbcSwiftCode
        bankAddress
        payNowUen
        emailId
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
}
