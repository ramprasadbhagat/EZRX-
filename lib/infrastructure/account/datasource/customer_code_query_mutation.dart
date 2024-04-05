class CustomerCodeQueryMutation {
  // Query for fetching the customer information by search
  String getCustomerInfoBySearch(bool enableMarketplace) {
    return '''
query customerInformationSearch(
  \$salesOrganisation: String!
  \$searchKey: String!
  \$first: Int!
  \$after: Int!
  \$filterBlockCustomer: Boolean
  \$customerCodeString: String
) {
  customerInformationSearch(
    searchKey: \$searchKey
    salesOrganisation: \$salesOrganisation
    first: \$first
    after: \$after
    filterBlockCustomer: \$filterBlockCustomer
    customerCodeString: \$customerCodeString
  ) {
    shipToCount
    SoldToInformation {
      customerCodeSoldTo
      telephoneNumber
      salesDeals
      paymentTerm
      paymentTermDescription
      customerGrp4
      customerAttr7
      name1
      name2
      name3
      name4
      street1
      street2
      street3
      street4
      building
      floor
      houseNumber1
      postalCode
      region
      city1
      city2
      status
      ${enableMarketplace ? 'isMarketPlace' : ''}
      shipTo {
        defaultShipToAddress
        shipToCustomerCode
        name1
        name2
        name3
        name4
        street
        street2
        street3
        street4
        building
        floor
        houseNumber1
        postalCode
        region
        city1
        city2
        status
        targetCustomerType
        plant
        customerBlock
      }
    }
  }
}

    ''';
  }

  //TODO: Removed comboEligible and salesDeals fields so api can function properly with customer codes tagged
  // We need to add this later when we cover combo deals for KH market

  // Query for fetching the customer information for Sales Rep User
  String getCustomerListForSalesRep() {
    return '''
              query customerInformationSalesRep(
        \$customerInformationSalesRepInput: customerInformationSalesRepInput!
      ) {
        customerInformationSalesRep(input: \$customerInformationSalesRepInput) {
          shipToCount
          SoldToInformation {
            customerCodeSoldTo
            telephoneNumber
            name1
            name2
            name3
            name4
            street1
            street2
            street3
            street4
            building
            floor
            houseNumber1
            postalCode
            city1
            city2
            status
            salesDeals
            paymentTerm
            paymentTermDescription
            shipTo {
              defaultShipToAddress
              shipToCustomerCode
              name1
              name2
              name3
              name4
              street
              street2
              street3
              street4
              building
              floor
              houseNumber1
              postalCode
              city1
              city2
              status
            }
          }
        }
      }    
    ''';
  }
}
