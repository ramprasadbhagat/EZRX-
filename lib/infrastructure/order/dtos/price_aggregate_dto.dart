import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:hive/hive.dart';

part 'price_aggregate_dto.g.dart';

@HiveType(typeId: 2, adapterName: 'PriceAggregateDtoAdapter')
class PriceAggregateDto {
  PriceAggregateDto({
    required this.materialDto,
    required this.quantity,
    required this.priceDto,
    required this.salesOrganisationConfigsDto,
    required this.zmgMaterialCountOnCart,
    required this.bundleDto,
    required this.bonusItem,
    required this.stockInfoDto,
  });

  @HiveField(0, defaultValue: _emptyConstMaterialDto)
  MaterialDto materialDto;
  @HiveField(1, defaultValue: 1)
  int quantity;
  @HiveField(2, defaultValue: _emptyPriceDto)
  PriceDto priceDto;
  @HiveField(3, defaultValue: _emptySalesOrganisationConfigsDto)
  SalesOrganisationConfigsDto salesOrganisationConfigsDto;
  @HiveField(4, defaultValue: 0)
  int zmgMaterialCountOnCart;
  @HiveField(5, defaultValue: _emptyBundleDto)
  BundleDto bundleDto;
  @HiveField(6, defaultValue: [])
  List<MaterialDto> bonusItem;
  @HiveField(7, defaultValue: _emptyStockInfoDto)
  StockInfoDto stockInfoDto;

  factory PriceAggregateDto.fromDomain(PriceAggregate cart) {
    return PriceAggregateDto(
      materialDto: MaterialDto.fromDomain(cart.materialInfo),
      quantity: cart.quantity,
      priceDto: PriceDto.fromDomain(cart.price),
      salesOrganisationConfigsDto: SalesOrganisationConfigsDto.fromDomain(
        cart.salesOrgConfig,
      ),
      zmgMaterialCountOnCart: cart.discountedMaterialCount,
      stockInfoDto: StockInfoDto.fromDomain(cart.stockInfo),
      bundleDto: BundleDto.fromDomain(cart.bundle),
      bonusItem: cart.addedBonusList
          .map(
            (e) => MaterialDto.fromDomain(e),
          )
          .toList(),
    );
  }

  PriceAggregate toDomain() {
    return PriceAggregate(
      materialInfo: materialDto.toDomain(),
      quantity: quantity,
      price: priceDto.toDomain(),
      // price: Price.empty(),
      salesOrgConfig: salesOrganisationConfigsDto.toDomain(),
      // salesOrgConfig: SalesOrganisationConfigs.empty(),
      discountedMaterialCount: zmgMaterialCountOnCart,
      bundle: bundleDto.toDomain(),
      addedBonusList: bonusItem.map((e) => e.toDomain()).toList(),
      stockInfo: stockInfoDto.toDomain(),
    );
  }
}

const MaterialDto _emptyConstMaterialDto = MaterialDto(
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
  remarks: '',
);

const PriceDto _emptyPriceDto = PriceDto(
  additionalBonusEligible: false,
  bonuses: [],
  bundles: [],
  finalIndividualPrice: 0,
  finalTotalPrice: 0,
  isValid: false,
  listPrice: 0,
  materialNumber: '',
  overrideRulePresent: false,
  rules: [],
  tiers: [],
  zdp5MaxQuota: '',
  zdp5RemainingQuota: '',
  zmgDiscount: false,
  isPriceOverride: false,
);

const SalesOrganisationConfigsDto _emptySalesOrganisationConfigsDto =
    SalesOrganisationConfigsDto(
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
);

const BundleDto _emptyBundleDto = BundleDto(
  bundleName: '',
  bundleCode: '',
  bundleInformation: [],
);

const StockInfoDto _emptyStockInfoDto = StockInfoDto(
  batch: '',
  expiryDate: '',
  inStock: '',
  materialNumber: '',
  salesDistrict: '',
);
