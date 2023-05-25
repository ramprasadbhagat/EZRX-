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
}
