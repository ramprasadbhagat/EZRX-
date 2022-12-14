// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_aggregate_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAggregateDtoAdapter extends TypeAdapter<PriceAggregateDto> {
  @override
  final int typeId = 2;

  @override
  PriceAggregateDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceAggregateDto(
      materialDto: fields[0] == null
          ? const MaterialDto(
              bundles: [],
              governmentMaterialCode: '',
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
              remarks: '')
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
              isPriceOverride: false)
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
              ponRequired: false,
              enableTaxDisplay: false,
              netPriceOverride: false,
              batchNumDisplay: false,
              displayOrderDiscount: false,
              minOrderAmount: '0')
          : fields[3] as SalesOrganisationConfigsDto,
      zmgMaterialCountOnCart: fields[4] == null ? 0 : fields[4] as int,
      bundleDto: fields[5] == null
          ? const BundleDto(
              bundleName: '', bundleCode: '', bundleInformation: [])
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
    );
  }

  @override
  void write(BinaryWriter writer, PriceAggregateDto obj) {
    writer
      ..writeByte(9)
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
      ..writeByte(6)
      ..write(obj.bonusItem)
      ..writeByte(7)
      ..write(obj.stockInfoDto)
      ..writeByte(8)
      ..write(obj.tenderContractDto);
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
