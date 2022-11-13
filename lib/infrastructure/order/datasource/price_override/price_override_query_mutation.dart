// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class PriceOverrideQueryMutation {
  String getItemPriceOverride(
    String custCode,
    String salesOrg,
    String materialNumber,
    zpo1,
    zdp8,
  ) {
    return '''
    {
      price(customer:"$custCode", salesOrganisation:"$salesOrg",
        request:{MaterialNumber:"$materialNumber"$zpo1,$zdp8})
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
