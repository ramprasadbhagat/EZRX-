class CartQueryMutation {
  String cart() => '''
  query Cart(\$language: String) {
  cart(language: \$language) {
    ID
    UserID
    EzRxItems {
      ProductID
      ParentID
      Type
      ItemSource
      Quantity
      CreatedAt
      UpdatedAt
      principalCode
      principalName
      materialNumber
      materialDescription
      therapeuticClass
      itemBrand
      oldMaterialCode
      governmentMaterialCode
      materialGroup4
      materialGroup2
      taxClassification
      unitOfMeasurement
      itemRegistrationNumber
      defaultMaterialDescription
      genericMaterialName
      language
      taxM1
      taxes
      isSampleMaterial
      hidePrice
      hasValidTenderContract
      hasMandatoryTenderContract
      isFOCMaterial
      isFavourite
      productCount
      productAddedAt
      productUpdatedAt
      minimumQty
      maximumQty
      orderedQty
      remainingQty
      mov
      materialType
      suspensionStatus
      principalCutoffStatus
      warehouseStorageCondition
      IsGimmick
      BonusMaterials {
        principalCode
        principalName
        materialNumber
        materialDescription
        productCount
      }
    }
    MarketplaceItems {
      ProductID
      ItemSource
      Quantity
      CreatedAt
      UpdatedAt
    }
    CustomerCode
    ShipTo {
      ID
      AddressName
      CompanyName
      FirstName
      LastName
      Street1
      Street2
      City
      State
      Zip
      Country
      Phone
    }
    CreatedAt
    UpdatedAt
    OrderID
    WorkSheet {
      ShipEstimateResponse {
        ShipEstimates
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderCalculateResponse {
        LineItemOverrides
        ShippingTotal
        TaxTotal
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderSubmitResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderSubmitForApprovalResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderApprovedResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderPromotions {
        Amount
        LineItemID
        ID
        LineItemLevel
        Code
        Name
        RedemptionLimit
        RedemptionLimitPerUser
        RedemptionCount
        Description
        FinePrint
        StartDate
        ExpirationDate
        EligibleExpression
        ValueExpression
        CanCombine
        AllowAllBuyers
        OwnerID
        xp {
          IntegrationData
          Status
          HasVariants
          Note
          ProductType
          SizeTier
          IsResale
          Currency
          ArtworkRequired
          PromotionEligible
          FreeShipping
          FreeShippingMessage
          Documents {
            Url
            FileName
          }
          Images {
            Url
            ThumbnailUrl
            Tags
          }
          Accessorials
          UnitOfMeasure {
            Qty
            Unit
          }
          Tax {
            Code
            Description
            LongDescription
          }
          Facets {
            greenlabel
            countryoforigin
            computer
            animaux
            category
            industry
            supplier
          }
          Brand
          CountryOfOrigin
          TherapeuticClass
          ShippingZuelligPharma
          ShippingDirectToBuyer
          ShippingStandard
          Company
          CustomerRating
          Manufacturer
          ProductRegistrationNumber
          SupplierProductCode
          ProductBatch {
            BatchNumber
            BatchExpirationDate
            BatchStockQuantity
          }
          Workflow {
            RejectionReason
          }
          Promotions
        }
      }
      LineItems {
        ID
        ProductID
        Quantity
        DateAdded
        QuantityShipped
        UnitPrice
        PromotionDiscount
        LineTotal
        LineSubtotal
        CostCenter
        DateNeeded
        ShippingAccount
        ShippingAddressID
        ShipFromAddressID
        Variant
        ShippingAddress
        SupplierID
        InventoryRecordID
        PriceScheduleID
        PriceOverridden
        Specs
        ShipFromAddress {
          ID
          DateCreated
          CompanyName
          FirstName
          LastName
          Street1
          Street2
          City
          State
          Zip
          Country
          Phone
          AddressName
          xp
        }
        Product {
          ID
          Name
          Description
          Returnable
          QuantityMultiplier
          ShipWeight
          ShipHeight
          ShipWidth
          ShipLength
          DefaultSupplierID
          xp {
            IntegrationData
            Status
            HasVariants
            Note
            ProductType
            SizeTier
            IsResale
            Currency
            ArtworkRequired
            PromotionEligible
            FreeShipping
            FreeShippingMessage
            Documents {
              Url
              FileName
            }
            Images {
              Url
              ThumbnailUrl
              Tags
            }
            Accessorials
            UnitOfMeasure {
              Qty
              Unit
            }
            Tax {
              Code
              Description
              LongDescription
            }
            Facets {
              greenlabel
              countryoforigin
              computer
              animaux
              category
              industry
              supplier
            }
            Brand
            CountryOfOrigin
            TherapeuticClass
            ShippingZuelligPharma
            ShippingDirectToBuyer
            ShippingStandard
            Company
            CustomerRating
            Manufacturer
            ProductRegistrationNumber
            SupplierProductCode
            ProductBatch {
              BatchNumber
              BatchExpirationDate
              BatchStockQuantity
            }
            Workflow {
              RejectionReason
            }
            Promotions
          }
        }
        xp {
          IntegrationData
          Status
          HasVariants
          Note
          ProductType
          SizeTier
          IsResale
          Currency
          ArtworkRequired
          PromotionEligible
          FreeShipping
          FreeShippingMessage
          Documents {
            Url
            FileName
          }
          Images {
            Url
            ThumbnailUrl
            Tags
          }
          Accessorials
          UnitOfMeasure {
            Qty
            Unit
          }
          Tax {
            Code
            Description
            LongDescription
          }
          Facets {
            greenlabel
            countryoforigin
            computer
            animaux
            category
            industry
            supplier
          }
          Brand
          CountryOfOrigin
          TherapeuticClass
          ShippingZuelligPharma
          ShippingDirectToBuyer
          ShippingStandard
          Company
          CustomerRating
          Manufacturer
          ProductRegistrationNumber
          SupplierProductCode
          ProductBatch {
            BatchNumber
            BatchExpirationDate
            BatchStockQuantity
          }
          Workflow {
            RejectionReason
          }
          Promotions
        }
      }
      Order {
        ID
        FromCompanyID
        ToCompanyID
        FromUserID
        BillingAddressID
        BillingAddress
        ShippingAddressID
        Comments
        LineItemCount
        Status
        DateCreated
        DateSubmitted
        DateApproved
        DateDeclined
        DateCanceled
        DateCompleted
        LastUpdated
        Subtotal
        ShippingCost
        TaxCost
        PromotionDiscount
        Currency
        Total
        IsSubmitted
        FromUser {
          ID
          CompanyID
          Username
          Password
          FirstName
          LastName
          Email
          Phone
          TermsAccepted
          Active
          AvailableRoles
          Locale
          DateCreated
          PasswordLastSetDate
        }
      }
    }
  }
}
  ''';

  String deleteCartMutation() => '''
    mutation DeleteCart {
      deleteCart {
        Type
        Message
        __typename
      }
    }
''';

  String upsertCart() => '''
mutation UpsertCart(\$itemInput: ItemInput!) {
  upsertCart(itemInput: \$itemInput) {
    ID
    UserID
    EzRxItems {
      Type
      ProductID
      ItemSource
      Quantity
      CreatedAt
      UpdatedAt
      principalCode
      principalName
      materialNumber
      materialDescription
      therapeuticClass
      itemBrand
      oldMaterialCode
      governmentMaterialCode
      materialGroup4
      materialGroup2
      taxClassification
      unitOfMeasurement
      itemRegistrationNumber
      defaultMaterialDescription
      genericMaterialName
      language
      taxM1
      taxes
      isSampleMaterial
      hidePrice
      hasValidTenderContract
      hasMandatoryTenderContract
      isFOCMaterial
      isFavourite
      productCount
      productAddedAt
      productUpdatedAt
      minimumQty
      maximumQty
      orderedQty
      remainingQty
      mov
      materialType
      suspensionStatus
      principalCutoffStatus
      warehouseStorageCondition
      CounterOfferPrice	
      CounterOfferCurrency	
      Comment
      BonusMaterials {
        principalCode
        principalName
        materialNumber
        materialDescription
        productCount
        __typename
      }
      __typename
    }
    MarketplaceItems {
      ProductID
      ItemSource
      Quantity
      CreatedAt
      UpdatedAt
      CounterOfferPrice	
      CounterOfferCurrency	
      Comment
      __typename
    }
    CustomerCode
    ShipTo {
      ID
      AddressName
      CompanyName
      FirstName
      LastName
      Street1
      Street2
      City
      State
      Zip
      Country
      Phone
      __typename
    }
    CreatedAt
    UpdatedAt
    OrderID
    WorkSheet {
      ShipEstimateResponse {
        ShipEstimates
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
        __typename
      }
      OrderCalculateResponse {
        LineItemOverrides
        ShippingTotal
        TaxTotal
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
        __typename
      }
      OrderSubmitResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
        __typename
      }
      OrderSubmitForApprovalResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
        __typename
      }
      OrderApprovedResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
        __typename
      }
      OrderPromotions {
        Amount
        LineItemID
        ID
        LineItemLevel
        Code
        Name
        RedemptionLimit
        RedemptionLimitPerUser
        RedemptionCount
        Description
        FinePrint
        StartDate
        ExpirationDate
        EligibleExpression
        ValueExpression
        CanCombine
        AllowAllBuyers
        OwnerID
        xp {
          IntegrationData
          Status
          HasVariants
          Note
          ProductType
          SizeTier
          IsResale
          Currency
          ArtworkRequired
          PromotionEligible
          FreeShipping
          FreeShippingMessage
          Documents {
            Url
            FileName
            __typename
          }
          Images {
            Url
            ThumbnailUrl
            Tags
            __typename
          }
          Accessorials
          UnitOfMeasure {
            Qty
            Unit
            __typename
          }
          Tax {
            Code
            Description
            LongDescription
            __typename
          }
          Facets {
            greenlabel
            countryoforigin
            computer
            animaux
            category
            industry
            supplier
            __typename
          }
          Brand
          CountryOfOrigin
          TherapeuticClass
          ShippingZuelligPharma
          ShippingDirectToBuyer
          ShippingStandard
          Company
          CustomerRating
          Manufacturer
          ProductRegistrationNumber
          SupplierProductCode
          ProductBatch {
            BatchNumber
            BatchExpirationDate
            BatchStockQuantity
            __typename
          }
          Workflow {
            RejectionReason
            __typename
          }
          Promotions
          __typename
        }
        __typename
      }
      LineItems {
        ID
        ProductID
        Quantity
        DateAdded
        QuantityShipped
        UnitPrice
        PromotionDiscount
        LineTotal
        LineSubtotal
        CostCenter
        DateNeeded
        ShippingAccount
        ShippingAddressID
        ShipFromAddressID
        Variant
        ShippingAddress
        SupplierID
        InventoryRecordID
        PriceScheduleID
        PriceOverridden
        Specs
        ShipFromAddress {
          ID
          DateCreated
          CompanyName
          FirstName
          LastName
          Street1
          Street2
          City
          State
          Zip
          Country
          Phone
          AddressName
          xp
          __typename
        }
        Product {
          ID
          Name
          Description
          Returnable
          QuantityMultiplier
          ShipWeight
          ShipHeight
          ShipWidth
          ShipLength
          DefaultSupplierID
          xp {
            IntegrationData
            Status
            HasVariants
            Note
            ProductType
            SizeTier
            IsResale
            Currency
            ArtworkRequired
            PromotionEligible
            FreeShipping
            FreeShippingMessage
            Documents {
              Url
              FileName
              __typename
            }
            Images {
              Url
              ThumbnailUrl
              Tags
              __typename
            }
            Accessorials
            UnitOfMeasure {
              Qty
              Unit
              __typename
            }
            Tax {
              Code
              Description
              LongDescription
              __typename
            }
            Facets {
              greenlabel
              countryoforigin
              computer
              animaux
              category
              industry
              supplier
              __typename
            }
            Brand
            CountryOfOrigin
            TherapeuticClass
            ShippingZuelligPharma
            ShippingDirectToBuyer
            ShippingStandard
            Company
            CustomerRating
            Manufacturer
            ProductRegistrationNumber
            SupplierProductCode
            ProductBatch {
              BatchNumber
              BatchExpirationDate
              BatchStockQuantity
              __typename
            }
            Workflow {
              RejectionReason
              __typename
            }
            Promotions
            __typename
          }
          __typename
        }
        xp {
          IntegrationData
          Status
          HasVariants
          Note
          ProductType
          SizeTier
          IsResale
          Currency
          ArtworkRequired
          PromotionEligible
          FreeShipping
          FreeShippingMessage
          Documents {
            Url
            FileName
            __typename
          }
          Images {
            Url
            ThumbnailUrl
            Tags
            __typename
          }
          Accessorials
          UnitOfMeasure {
            Qty
            Unit
            __typename
          }
          Tax {
            Code
            Description
            LongDescription
            __typename
          }
          Facets {
            greenlabel
            countryoforigin
            computer
            animaux
            category
            industry
            supplier
            __typename
          }
          Brand
          CountryOfOrigin
          TherapeuticClass
          ShippingZuelligPharma
          ShippingDirectToBuyer
          ShippingStandard
          Company
          CustomerRating
          Manufacturer
          ProductRegistrationNumber
          SupplierProductCode
          ProductBatch {
            BatchNumber
            BatchExpirationDate
            BatchStockQuantity
            __typename
          }
          Workflow {
            RejectionReason
            __typename
          }
          Promotions
          __typename
        }
        __typename
      }
      Order {
        ID
        FromCompanyID
        ToCompanyID
        FromUserID
        BillingAddressID
        BillingAddress
        ShippingAddressID
        Comments
        LineItemCount
        Status
        DateCreated
        DateSubmitted
        DateApproved
        DateDeclined
        DateCanceled
        DateCompleted
        LastUpdated
        Subtotal
        ShippingCost
        TaxCost
        PromotionDiscount
        Currency
        Total
        IsSubmitted
        FromUser {
          ID
          CompanyID
          Username
          Password
          FirstName
          LastName
          Email
          Phone
          TermsAccepted
          Active
          AvailableRoles
          Locale
          DateCreated
          PasswordLastSetDate
          __typename
        }
        __typename
      }
      __typename
    }
    __typename
  }
}
''';

  String upsertCartItems() => '''
fragment ezrxItemsFields on Item {
  ProductID
  ItemSource
  Quantity
  CreatedAt
  UpdatedAt
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
  ParentID
  BonusMaterials {
    principalCode
    principalName
    materialNumber
    materialDescription
    productCount
    ProductID
    __typename
  }
  Type
  BundleDetails {
    BundleName
    BundleCode
    BundleInformation {
      Sequence
      Quantity
      Type
      Rate
      __typename
    }
    __typename
  }
  BundleMaterials {
    ...BundleMaterialsFields
    __typename
  }
  __typename
}

fragment shipToFields on ShipTo {
  ID
  AddressName
  CompanyName
  FirstName
  LastName
  Street1
  Street2
  City
  State
  Zip
  Country
  Phone
  __typename
}

fragment userAddressFields on CartShippingAddress {
  name
  street
  city
  addressCode
  country
  __typename
}

fragment materialsFields on CartMaterials {
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
  __typename
}

fragment BundleMaterialsFields on Item {
  Type
  ProductID
  ItemSource
  Quantity
  CreatedAt
  UpdatedAt
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
  ParentID
  __typename
}

mutation UpsertCartItems(\$itemInput: [ItemInput!]) {
  upsertCartItems(itemInput: \$itemInput) {
    ID
    UserID
    EzRxItems {
      ...ezrxItemsFields
      __typename
    }
    CustomerCode
    ShipTo {
      ...shipToFields
      __typename
    }
    CreatedAt
    UpdatedAt
    OrderID
    userAddress {
      ...userAddressFields
      __typename
    }
    materials {
      ...materialsFields
      __typename
    }
    SalesOrg
    __typename
  }
}
''';
}
