import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late PriceAggregateDto data;
  group('Test bundleDto ', () {
    setUp(() async {
      data = PriceAggregateDto(
        bonusItem: [
          const MaterialItemBonusDto(
              materialNumber: '',
              qty: 10,
              comment: '',
              materialDescription: '',
              expiryDate: '',
              inStock: 'yes',
              remainingQty: 20,
              bonusOverrideFlag: false,
              additionalBonusFlag: false),
        ],
        bundleDto: const BundleDto(
            bundleCode: 'fake-code',
            bundleInformation: [],
            bundleName: 'fake-name',
            materials: <MaterialDto>[]),
        materialDto: const MaterialDto(
            bundles: [],
            defaultMaterialDescription: '',
            governmentMaterialCode: '',
            hasMandatoryTenderContract: false,
            hasValidTenderContract: false,
            hidePrice: false,
            isFOCMaterial: false,
            isSampleMaterial: false,
            itemBrand: '',
            itemRegistrationNumber: '',
            materialDescription: '',
            materialGroup2: '',
            materialGroup4: '',
            materialNumber: '',
            principalCode: '',
            principalName: '',
            quantity: 0,
            remarks: '',
            taxClassification: '',
            taxes: [],
            therapeuticClass: '',
            unitOfMeasurement: ''),
        priceDto: const PriceDto(
          additionalBonusEligible: false,
          bonuses: [],
          bundles: [],
          finalIndividualPrice: 0,
          finalTotalPrice: 0,
          isPriceOverride: false,
          isValid: true,
          listPrice: 10,
          materialNumber: '',
          overrideRulePresent: true,
          priceOverride: 10,
          rules: [],
          tiers: [],
          zdp5MaxQuota: '',
          zdp5RemainingQuota: '',
          zdp8Override: 0,
          zmgDiscount: false,
          comboDeal: PriceComboDealDto.empty,
        ),
        quantity: 10,
        salesOrganisationConfigsDto: SalesOrganisationConfigsDto.fromDomain(
            SalesOrganisationConfigs.empty().copyWith(
          salesOrg: SalesOrg('fake-salesorg'),
          currency: Currency('*'),
        )),
        stockInfoDto: const StockInfoDto(
            batch: '',
            expiryDate: '',
            inStock: 'Yes',
            materialNumber: '1234',
            salesDistrict: ''),
        tenderContractDto: const TenderContractDto(
            contractNumber: '',
            contractItemNumber: '1234',
            contractReference: '',
            tenderOrderReason: '',
            tenderVisaNumber: 'tenderVisaNumber',
            salesDistrict: 'salesDistrict',
            tenderPackageDescription: 'tenderPackageDescription',
            tenderPrice: '10',
            pricingUnit: 1,
            remainingTenderQuantity: 10,
            contractQuantity: 10,
            contractExpiryDate: 'contractExpiryDate',
            announcementLetterNumber: 'announcementLetterNumber',
            isNearToExpire: false,
            contractPaymentTerm: 'contractPaymentTerm'),
        zmgMaterialCountOnCart: 10,
        comboDealDto: ComboDealDto.empty,
      );
    });
    test('Test toDomain', () {
      final configs = data.toDomain();
      expect(configs.bundle.bundleCode, 'fake-code');
    });

    test('Test fromDomain', () {
      final configs = PriceAggregateDto.fromDomain(data.toDomain());
      expect(configs.bundleDto.bundleCode, 'fake-code');
    });
  });
}
