class PaymentAdviceQueryMutation {
  String getPaymentAdviceQuery() {
    return '''
    query getPaymentAdvice(\$request: paymentAdviceRequest!) {
      paymentAdvice(request: \$request) {
        salesOrg
        salesDistrict
        footer
        headerLogoPath
        header
        pleaseNote
      }
    }
    ''';
  }

  String addPaymentAdviceMutation() {
    return '''
      mutation addPaymentAdviceMutation(\$input: addPaymentAdviceInput!) {
        addPaymentAdvice(input: \$input) {
          info
        }
      }
    ''';
  }

  String deletePaymentAdviceMutation() {
    return '''
      mutation deletePaymentAdviceMutation(\$input: deletePaymentAdviceInput!) {
      deletePaymentAdvice(input: \$input) {
        info
      }
    }
    ''';
  }
}
