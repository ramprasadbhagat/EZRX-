// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_aggregate_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAggregateDtoAdapter extends TypeAdapter<_$_PriceAggregateDto> {
  @override
  final int typeId = 2;

  @override
  _$_PriceAggregateDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PriceAggregateDto(
      materialDto: fields[0] == null
          ? const MaterialDto(
              bundles: [],
              governmentMaterialCode: '',
              ean: '',
              defaultMaterialDescription: '',
              hasMandatoryTenderContract: false,
              hasValidTenderContract: false,
              hidePrice: false,
              isSampleMaterial: false,
              itemBrand: '',
              itemRegistrationNumber: '',
              materialGroup2: '',
              materialDescription: '',
              materialGroup4: '',
              principalCode: '',
              materialNumber: '',
              principalName: '',
              taxClassification: '',
              taxes: [],
              therapeuticClass: '',
              unitOfMeasurement: '',
              isFOCMaterial: false,
              quantity: 0,
              remarks: '',
              genericMaterialName: '',
              data: [],
              dataTotalCount: 0,
              dataTotalHidden: 0,
              isFavourite: false,
              isGimmick: false,
              manufactured: '',
              name: '',
              type: '',
              code: '',
              bundle: const BundleDto(
                  bundleName: '',
                  bundleCode: '',
                  bundleInformation: [],
                  materials: [],
                  conditions: '',
                  bonusEligible: false))
          : fields[0] as MaterialDto,
      quantity: fields[1] == null ? 1 : fields[1] as int,
      priceDto: fields[2] == null
          ? const PriceDto(
              additionalBonusEligible: false,
              bonuses: [],
              bundles: [],
              finalIndividualPrice: 0.0,
              finalTotalPrice: 0.0,
              isValid: false,
              listPrice: 0.0,
              materialNumber: '',
              overrideRulePresent: false,
              rules: [],
              tiers: [],
              zdp5MaxQuota: '',
              zdp5RemainingQuota: '',
              zmgDiscount: false,
              isPriceOverride: false,
              zdp8Override: 0.0,
              priceOverride: 0.0,
              comboDeal: PriceComboDealDto.empty,
              oldMaterialCode: '',
              exceedQty: false,
              overridenRules: [],
              overridenRuleTier: [])
          : fields[2] as PriceDto,
      salesOrganisationConfigsDto: fields[3] == null
          ? const SalesOrganisationConfigsDto(
              salesOrg: '',
              enableIRN: false,
              currency: '',
              disableBundles: false,
              disableOrderType: false,
              disablePrincipals: false,
              disableProcessingStatus: false,
              enableBatchNumber: false,
              enableCollectiveNumber: false,
              enableDefaultMD: false,
              enableFutureDeliveryDay: false,
              enableGMC: false,
              enableGimmickMaterial: false,
              enableListPrice: false,
              enableMobileNumber: false,
              enablePaymentTerms: false,
              enableReferenceNote: false,
              enableSpecialInstructions: false,
              enableTaxClassification: false,
              enableVat: false,
              enableTaxAtTotalLevelOnly: false,
              enableZDP5: false,
              futureDeliveryDay: '',
              hideCustomer: false,
              languageValue: '',
              languageFilter: false,
              materialWithoutPrice: false,
              principalList: [],
              vatValue: 0,
              priceOverride: false,
              disablePaymentTermsDisplay: false,
              disableDeliveryDate: false,
              enableBillTo: false,
              showPOAttachment: false,
              hideStockDisplay: false,
              expiryDateDisplay: false,
              addOosMaterials: false,
              oosValue: 0,
              enableRemarks: false,
              enableOHPrice: true,
              poNumberRequired: false,
              enableTaxDisplay: false,
              netPriceOverride: false,
              batchNumDisplay: false,
              displayOrderDiscount: false,
              minOrderAmount: '0',
              enableZDP8Override: false,
              disableReturnsAccessSR: false,
              disableReturnsAccess: false,
              enableGreenDelivery: false,
              greenDeliveryDelayInDays: 0,
              enableComboDeals: false,
              greenDeliveryUserRole: 0,
              comboDealsUserRole: 0,
              enableGMN: false)
          : fields[3] as SalesOrganisationConfigsDto,
      zmgMaterialCountOnCart: fields[4] == null ? 0 : fields[4] as int,
      bundleDto: fields[5] == null
          ? const BundleDto(
              bundleName: '',
              bundleCode: '',
              bundleInformation: [],
              materials: [],
              conditions: '',
              bonusEligible: false)
          : fields[5] as BundleDto,
      bonusItem: fields[6] == null
          ? []
          : (fields[6] as List).cast<MaterialItemBonusDto>(),
      stockInfoDto: fields[7] == null
          ? const StockInfoDto(
              batch: '',
              expiryDate: '',
              inStock: '',
              materialNumber: '',
              salesDistrict: '')
          : fields[7] as StockInfoDto,
      tenderContractDto: fields[8] == null
          ? const TenderContractDto(
              contractNumber: '',
              contractItemNumber: '',
              contractReference: '',
              tenderOrderReason: '',
              tenderVisaNumber: '',
              salesDistrict: '',
              tenderPackageDescription: '',
              tenderPrice: '',
              pricingUnit: 0,
              remainingTenderQuantity: 0,
              contractQuantity: 0,
              contractExpiryDate: '',
              announcementLetterNumber: '',
              isNearToExpire: false,
              contractPaymentTerm: '')
          : fields[8] as TenderContractDto,
      comboDealDto:
          fields[9] == null ? ComboDealDto.empty : fields[9] as ComboDealDto,
      isSpecialOrderType: fields[10] == null ? false : fields[10] as bool,
      stockInfoDtoList:
          fields[11] == null ? [] : (fields[11] as List).cast<StockInfoDto>(),
      bannerDto: fields[12] == null ? BannerDto.empty : fields[12] as BannerDto,
      exceedQty: fields[13] == null ? false : fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PriceAggregateDto obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.materialDto)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.priceDto)
      ..writeByte(3)
      ..write(obj.salesOrganisationConfigsDto)
      ..writeByte(4)
      ..write(obj.zmgMaterialCountOnCart)
      ..writeByte(5)
      ..write(obj.bundleDto)
      ..writeByte(7)
      ..write(obj.stockInfoDto)
      ..writeByte(8)
      ..write(obj.tenderContractDto)
      ..writeByte(9)
      ..write(obj.comboDealDto)
      ..writeByte(10)
      ..write(obj.isSpecialOrderType)
      ..writeByte(12)
      ..write(obj.bannerDto)
      ..writeByte(13)
      ..write(obj.exceedQty)
      ..writeByte(6)
      ..write(obj.bonusItem)
      ..writeByte(11)
      ..write(obj.stockInfoDtoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAggregateDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
