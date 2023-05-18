class PaymentSummaryQuery {
  String getPaymentSummaryQuery() {
    return '''
       query customerPayment(\$request: customerPaymentRequest!) {
         customerPayment(request: \$request) {
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
            adviceExpiry
            zzHtmcs
            createdDate
            status
          }
        }

    ''';
  }
}
