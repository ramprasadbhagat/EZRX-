class CustomerCodeQueryMutation {
  // Query for fetching the customer information by search
  String getCustomerInfoBySearch() {
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
    SoldToInformation {
      customerCodeSoldTo
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

  //TODO: Removed comboEligible and salesDeals fields so api can function properly with customer codes tagged
  // We need to add this later when we cover combo deals for KH market

  // Query for fetching the customer information for Sales Rep User
  String getCustomerListForSalesRep() {
    return '''
        query CustomerListForSalesRep(\$username: String!,
                                      \$searchKey: String,
                                      \$salesOrganisation: String!,
                                      \$first: Int,
                                      \$after: Int){
          customerListForSalesRep(username: \$username,
                                  searchKey: \$searchKey,
                                  salesOrganisation:\$salesOrganisation,
                                  first:\$first,
                                  after: \$after) {
              taxIncludedBySalesOrganization
              customerClassification
              customerCodeSoldTo
              customerLocalGroup
              name1
              name2
              name3
              name4
              status
              street1
              street2
              street3
              street4
              street5
              postalCode
              telephoneNumber
              division
              region
              city1
              city2
              customerAttr7
              customerGrp4
              distributionChannel
              district
              paymentTermDescription
              country
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
                  country
              }
              billTo{
              billToCustomerCode
              plant
              name1
              name2
              name3
              name4
              altName1
              altName2
              altName3
              altName4
              country
              region
              district
              postalCode
              postalCode2
              street
              street2
              street3
              street4
              street5
              houseNumber1
              houseNumber2
              building
              floor
              roomnumber
              telephoneNumber
              telephoneExtension
              faxNumber
              faxExtension
              city1
              city2
              status
              defaulBillToAddress
              taxIncludedBySalesOrganization
              taxNumber
              customerClassification
              customerLocalGroup
              emailAddresses
        }
      }
    }    
    ''';
  }
}
