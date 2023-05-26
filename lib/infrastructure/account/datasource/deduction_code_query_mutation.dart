class DeductionCodeQueryMutation {
  String getDeductionCodesQuery() {
    return '''
      query getDeductionCodes(\$request: deductionCodeRequest!) {
        deductionCodes(request: \$request) {
          salesOrg
          salesDistrict
          deductionCode
          deductionDescription
          amountType
        }
      }
    ''';
  }
}
