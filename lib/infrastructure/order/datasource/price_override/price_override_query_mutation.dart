// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class PriceOverrideQueryMutation {
  String getItemPriceOverride() {
    return '''


query price(
        \$customer: String! 
        \$salesOrganisation: String!
        \$request:[PriceRequest!]!
      ) {
        price(
          customer: \$customer 
          salesOrganisation: \$salesOrganisation
          request: \$request
        ) 
    {
        MaterialNumber
        OverridenRulePresent
        ZDP5MaxQuota
        ZDP5RemainingQuota
        ZMGDiscount
        ListPrice
        FinalIndividualPrice
        FinalTotalPrice
        AdditionalBonusEligible
        PriceRules{
          Type
          Rate
          Conditions
          BonusEligible
          ConditionNumber
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
        TieredPricing{
          Tier
          PriceTier{
            ApplyBonus
            Sequence
            Quantity
            Type
            Rate
          }
        }
        Bundles{
          BundleName
          BundleCode
          BundleInformation{
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
