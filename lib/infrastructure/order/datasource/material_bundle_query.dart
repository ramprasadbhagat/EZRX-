class MaterialBundleQuery {
  String getCustomerMaterialBundleList() {
    return '''
      query GetBundles(
        \$customer: String!
        \$shipToCode: String!
        \$salesOrganisation: String!
      ) {
        GetBundles(
          customer: \$customer
          shipToCode: \$shipToCode
          salesOrganisation: \$salesOrganisation
        ) {
          MaterialNumber
          ListPrice
          FinalIndividualPrice
          FinalTotalPrice
          AdditionalBonusEligible
          PriceRules {
            Type
            Rate
            Conditions
            BonusEligible
            ConditionNumber
          }
          Bonuses {
            BonusTiers {
              Calculation
              QualifyingQuantity
              BonusMaterial {
                Id
                MaterialNumber
                MaterialDescription
                Calculation
                BonusRatio
                QualifyingQuantity
                BonusQuantity
                LimitPerTransaction
                ConditionId
              }
            }
          }
          TieredPricing {
            Tier
            PriceTier {
              ApplyBonus
              Sequence
              Quantity
              Type
              Rate
            }
          }
          Bundles {
            BundleName
            BundleCode
            BundleInformation {
              Sequence
              Quantity
              Type
              Rate
            }
          }
          Valid
          }
        }
    ''';
  }

  String getSalesRepMaterialBundleList() {
    return '''
      query GetBundles(
        \$userName: String!
        \$custCode: String!
        \$materialNumberList: String!
        \$salesOrg: String!
      ) {
      GetBundlesForSalesRep(
        userName: \$userName
        customer: \$custCode
        shipToCode: \$materialNumberList
        salesOrganisation: \$salesOrg
      ) {
        MaterialNumber
        ListPrice
        FinalIndividualPrice
        FinalTotalPrice
        AdditionalBonusEligible
        PriceRules {
          Type
          Rate
          Conditions
          BonusEligible
          ConditionNumber
        }
        Bonuses {
          BonusTiers {
            Calculation
            QualifyingQuantity
            BonusMaterial {
              Id
              MaterialNumber
              MaterialDescription
              Calculation
              BonusRatio
              QualifyingQuantity
              BonusQuantity
              LimitPerTransaction
              ConditionId
            }
          }
        }
        TieredPricing {
          Tier
          PriceTier {
            ApplyBonus
            Sequence
            Quantity
            Type
            Rate
          }
        }
        Bundles {
          BundleName
          BundleCode
          BundleInformation {
            Sequence
            Quantity
            Type
            Rate
          }
        }
        Valid
      }
    }
    ''';
  }
}
