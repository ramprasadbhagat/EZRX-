class MaterialPriceDetailQueryMutation {
  /* For fetching material detail with info and price  */
  String getMaterialDetail() {
    return '''
        query customerMaterialPriceDetailsQuery(
          \$customerCode: String!
          \$shipToCode: String!
          \$salesOrganisation: String!
          \$request: [PriceRequest!]!
          \$language: String
          \$listPriceOnly: Boolean!
        ) {
            customerMaterialPriceDetails(
              customerCode: \$customerCode
              shipToCode: \$shipToCode
              salesOrganisation: \$salesOrganisation
              request: \$request
              language: \$language
              listPriceOnly: \$listPriceOnly
            ) {
              Price {
                MaterialNumber
                OverridenRulePresent
                ZDP5MaxQuota
                ZDP5RemainingQuota
                ZMGDiscount
                OldMaterialCode
                ListPrice
                FinalIndividualPrice
                FinalTotalPrice
                Valid
                Bundles {
                  BundleName
                }
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
                    BonusMaterial {
                      MaterialNumber
                      MaterialDescription
                      Calculation
                      BonusRatio
                      QualifyingQuantity
                      BonusQuantity
                      ConditionId
                      OldMaterialCode
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
              }
              MaterialInformation {
                TaxClassification
                Taxm1
                Taxes
                PrincipalCode
                PrincipalName
                MaterialNumber
                MaterialDescription
                TherapeuticClass
                ItemBrand
                OldMaterialCode
                GenericMaterialName
                defaultMaterialDescription
                hasMandatoryTenderContract
                hasValidTenderContract
                hidePrice
                GovernmentMaterialCode
                IsSampleMaterial
                ItemRegistrationNumber
                UnitOfMeasurement
                MaterialGroup2
                MaterialGroup4
              }
              ValidMaterial
            }
        }
   ''';
  }
}
