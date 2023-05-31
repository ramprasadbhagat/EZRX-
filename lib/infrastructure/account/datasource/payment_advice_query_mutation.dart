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
}
