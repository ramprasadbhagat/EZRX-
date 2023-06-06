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

  String addDeductionCodesMutation() {
    return '''
      mutation addDeductionCodeMutation(\$input: addDeductionCodeInput!) {
        addDeductionCode(input: \$input) {
          success
          info
        }
      }
    ''';
  }

  String deleteDeductionCodesMutation() {
    return '''
      mutation deleteDeductionCodeMutation(\$input: deleteDeductionCodeInput!) {
        deleteDeductionCode(input: \$input) {
          info
          success
        }
      }
    ''';
  }
}
