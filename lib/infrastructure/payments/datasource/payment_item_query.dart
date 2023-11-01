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

  String getPaymentSummaryQuery() {
    return '''
       query customerPayment(\$request: customerPaymentRequest!) {
        customerPayment(request: \$request) {
          total
          showing
          totalPaymentInProgress
          customerPaymentResponse {
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
            extensibilityCustomField {
              paymentBatchAdditionalInfo {
                businessContext
                label
                technicalName
              }
            }
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
            zzAdvice
            zzHtmcs
            adviceExpiry
            createdDate
            transactionStatus
            status
          }
        }
      }
    ''';
  }

  String deleteCustomerPaymentQuery() {
    return '''
        mutation deleteCustomerPayment(\$input: deleteCustomerPaymentInput!) {
          deleteCustomerPayment(input: \$input) {
              statusMessage
          }
      }
    ''';
  }
}
