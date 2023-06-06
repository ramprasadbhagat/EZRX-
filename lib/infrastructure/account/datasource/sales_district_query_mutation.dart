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

  String manageSalesDistrictQuery() {
    return '''
      mutation addSalesDistrict(\$input: addSalesDistrictInput!) {
        addSalesDistrict(input: \$input) {
          message
        }
      }
    ''';
  }

  String deleteSalesDistrictQuery() {
    return '''
      mutation deleteSalesDistrict(\$id: Int!) {
        deleteSalesDistrict(id: \$id) {
          message
        }
      }

    ''';
  }
}
