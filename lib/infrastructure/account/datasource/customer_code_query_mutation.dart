class CustomerCodeQueryMutation {
  // Query for fetching the customer information by search
  String getCustomerInfoBySearch() {
    return '''
      query customerInformationSearch(\$searchKey: String!,
                                      \$salesOrganisation: String!,
                                      \$filterBlockCustomer: Boolean!,
                                      \$first: Int,
                                      \$after: Int){
        customerInformationSearch(searchKey: \$searchKey,
                                  salesOrganisation: \$salesOrganisation,
                                  first: \$first,
                                  after: \$after,
                                  filterBlockCustomer: \$filterBlockCustomer) {
          SoldToInformation {
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
            paymentTermDescription
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
      }
    ''';
  }

  // Query for fetching the customer information for Sales Rep User
  String getCustomerListForSalesRep() {
    return '''
        query customerListForSalesRep(\$username: String!,
                                      \$searchKey: String!,
                                      \$salesOrganisation: String!,
                                      \$filterBlockCustomer: Boolean!,
                                      \$first: Int,
                                      \$after: Int){
          customerListForSalesRep(username: \$username,
                                  searchKey: \$searchKey,
                                  salesOrganisation:\$salesOrganisation,
                                  first:\$first,
                                  after: \$after,
                                  filterBlockCustomer: \$filterBlockCustomer) {
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
              distributionChannel
              district
              paymentTermDescription
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
