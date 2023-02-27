class MaterialPriceQueryMutation {
  /* For fetching material price  */
  String getMaterialPrice() {
    return '''
      query price(
        \$customer: String!
        \$salesOrganisation: String!
        \$shipToCode: String!
        \$request: [PriceRequest!]!
        ) {
         price(
           customer: \$customer
           salesOrganisation: \$salesOrganisation
           request: \$request
           shipToCode: \$shipToCode
         ) {
           MaterialNumber
           OverridenRulePresent
           ZDP5MaxQuota
           ZDP5RemainingQuota
           ZMGDiscount
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
            ComboDeals {
              Eligible
              FlexibleGroup
              SalesDeal
              Category {
                Type
                Value
              }
            }
           Bonuses {
             BonusTiers {
               BonusMaterial {
                 MaterialNumber
                 MaterialDescription
                 Calculation
                 BonusRatio
                 QualifyingQuantity
                 BonusQuantity
                 ConditionId
               }
               Calculation
               QualifyingQuantity
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
