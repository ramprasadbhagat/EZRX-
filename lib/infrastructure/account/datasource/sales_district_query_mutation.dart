class SalesDistrictQueryMutation {
  String getSalesDistrictQuery() {
    return '''
      query salesDistrict(\$request: salesDistrictRequest!) {
        salesDistrict(request: \$request) {
          salesOrg
          salesDistricts {
            id
            salesDistrict
            salesDistrictLabel
          }
        }
      }
    ''';
  }

  String addSalesDistrictQuery() {
    return '''
      mutation addSalesDistrict(\$input: addSalesDistrictInput!) {
        addSalesDistrict(input: \$input) {
          message
        }
      }
    ''';
  }
}
