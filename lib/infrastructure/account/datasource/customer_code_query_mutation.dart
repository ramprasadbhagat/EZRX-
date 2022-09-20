class CustomerCodeQueryMutation {
  // Query for fetching the customer information by search
  String getCustomerInfoBySearch(
    String custCode,
    String salesOrg,
    paginate,
    bool hidecustomer,
  ) {
    return '''
      {
        customerInformationSearch( searchKey: "$custCode" salesOrganisation: "$salesOrg" first: 20 after: $paginate, filterBlockCustomer: $hidecustomer,) {
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
  String getCustomerListForSalesRep(
    String username,
    String searchKeyActive,
    String salesOrg,
    paginate,
    bool hidecustomer,
  ) {
    var searchKey = '';
    if (searchKeyActive != '') {
      searchKey = ''' searchKey: "$searchKeyActive", ''';
    }

    return '''
      {
        customerListForSalesRep(username: "$username",$searchKey salesOrganisation: "$salesOrg" first: 20, after: $paginate, filterBlockCustomer: $hidecustomer) {
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
