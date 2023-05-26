class BankBeneficiaryQueryMutation {
  String getBankBeneficiaryQuery() {
    return '''
      query bankBeneficiary(\$request: bankBeneficiaryRequest!) {
        bankBeneficiary(request: \$request) {
        salesOrg
        salesDistrict
        beneficiaryName
        bankName
        branch
        bankCode
        bankAccount
        hdbcSwiftCode
        bankAddress
        payNowUen
        emailId
      }
    }
    ''';
  }

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

  String addOrUpdateBeneficiaryQuery() {
    return '''
      mutation addBankBeneficiary(\$input: addBankBeneficiaryInput!) {
        addBankBeneficiary(input: \$input) {
          info
        }
      }
    ''';
  }
}
