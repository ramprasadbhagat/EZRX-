
class PaymentCustomerInformationQueryMutation {
  // For fetching Payment Customer Information
  String getPaymentCustomerInformationQuery() {
    return '''
      query customerInformation(\$customer: String!,\$salesOrganisation: String!,\$filterBlockCustomer: Boolean,){
      customerInformation(customer: \$customer, salesOrganisation: \$salesOrganisation, filterBlockCustomer: \$filterBlockCustomer) {
        paymentTerm
      }
    }
    ''';
  }
}
