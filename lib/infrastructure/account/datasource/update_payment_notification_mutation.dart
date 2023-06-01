class UpdatePaymentNotificationMutation {
  
  String updatePaymentNotificationMutation() {
    return '''
      mutation updatePaymentConfigMutation(\$input: updatePaymentConfigInput!) {
        updatePaymentConfig(input: \$input) {
          message
          __typename
        }
      }
    ''';
  }
}
