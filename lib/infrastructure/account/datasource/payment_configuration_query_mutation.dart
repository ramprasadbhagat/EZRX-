class PaymentConfigurationQueryMutation {
  String getAvailablePaymentMethodsQuery() {
    return '''
      query availablePaymentMethods(\$request: availablePaymentMethodsRequest!) {
        availablePaymentMethods(request: \$request) {
          salesOrg
          paymentMethods
        }
      }
    ''';
  }
}
