class PaymentCustomerInformationQueryMutation {
  // For fetching Payment Customer Information
  String getPaymentCustomerInformationQuery() {
    return '''
      query customerInformation(\$customer: String!,\$salesOrganisation: String!,\$filterBlockCustomer: Boolean,){
      customerInformation(customer: \$customer, salesOrganisation: \$salesOrganisation, filterBlockCustomer: \$filterBlockCustomer) {
        paymentTerm
        shipTo {
          defaultShipToAddress
          shipToCustomerCode
          name1
          name2
          name3
          name4
          plant
          street
          street2
          street3
          street4
          street5
          building
          floor
          houseNumber1
          postalCode
          city1
          city2
          status
          region
          telephoneNumber
          licenses{
            licenceType
            licenseDescription
            licenseNumber
            validFrom
            validTo
          }
        }
      }
    }
    ''';
  }
}
