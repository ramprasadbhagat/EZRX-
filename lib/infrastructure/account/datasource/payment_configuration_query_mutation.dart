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

  String updatePaymentMethodsMutation() {
    return '''
      mutation updatePaymentMethodMutation(\$input: updatePaymentMethodsInput!) {
        updatePaymentMethods(input: \$input) {
          success
          action
        }
      }
    ''';
  }

  String deletePaymentMethodsMutation() {
    return '''
      mutation deletePaymentMethods(\$request: deletePaymentMethodsInput!) {
        deletePaymentMethods(input: \$request) {
          success
        }
      }
    ''';
  }
}
