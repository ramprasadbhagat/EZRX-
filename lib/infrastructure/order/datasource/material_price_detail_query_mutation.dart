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
