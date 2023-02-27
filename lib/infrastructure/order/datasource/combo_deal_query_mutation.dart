class ComboDealQueryMutation {
  String getComboDealList() {
    return '''
      query comboDealListForMaterial(
        \$salesOrg: String!
        \$customerCode: String!
        \$salesDeal: String!
        \$flexibleGroup: String!
        \$materialNumbers: [String!]!
      ) {
        comboDealForMaterials(
          salesOrg: \$salesOrg
          customerCode: \$customerCode
          salesDeal: \$salesDeal
          flexibleGroup: \$flexibleGroup
          validatedMatnrList: \$materialNumbers
        ) {
            groupDeal {
              minTotalAmount
              maxTotalAmount
              minTotalQuantity
              rate
              type
              conditionNumber
            }
            flexiSKUTier {
              rate
              conditionNumber
              minQty
              type
            }
            flexiQtyTier {
              rate
              type
              conditionNumber
              minQty
            }
            flexiAmmountTier {
              conditionNumber
              minTotalAmount
              minTotalCurrency
              maxTotalAmount
              maxTotalCurrency
              rate
              type
            }
            materialComboDeals {
              setNo
              materials {
                minQty
                materialNumber
                rate
                type
                conditionNumber
                mandatory
              }
            }
          }
       }
    ''';
  }
}
