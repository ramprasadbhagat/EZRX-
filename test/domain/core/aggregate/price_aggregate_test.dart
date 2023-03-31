import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_item_bonus_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final emptyPrice = Price.empty();
  final emptyMaterialInfo = MaterialInfo.empty();
  final emptyBundle = Bundle.empty();
  final emptySalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  const fakeQuantity = 7;
  const fakeDiscountedMaterialCount = 10;
  final fakeAddedBonusList = [
    MaterialItemBonus.empty(),
    MaterialItemBonus.empty(),
  ];
  final emptyStockInfo = StockInfo.empty();
  final emptyTenderContract = TenderContract.empty();
  final emptyPriceAggregate = PriceAggregate.empty();
  final emptyComboDeal = ComboDeal.empty();

  group('Price Aggregate Test', () {
    test('should return correct price aggregate object', () {
      final priceAggregate = PriceAggregate(
        price: emptyPrice,
        materialInfo: emptyMaterialInfo,
        bundle: emptyBundle,
        salesOrgConfig: emptySalesOrganisationConfigs,
        quantity: fakeQuantity,
        discountedMaterialCount: fakeDiscountedMaterialCount,
        addedBonusList: fakeAddedBonusList,
        stockInfo: emptyStockInfo,
        tenderContract: emptyTenderContract,
        comboDeal: emptyComboDeal,
      );

      expect(priceAggregate.price, emptyPrice);
      expect(priceAggregate.materialInfo, emptyMaterialInfo);
      expect(priceAggregate.bundle, emptyBundle);
      expect(priceAggregate.salesOrgConfig, emptySalesOrganisationConfigs);
      expect(priceAggregate.quantity, fakeQuantity);
      expect(
        priceAggregate.discountedMaterialCount,
        fakeDiscountedMaterialCount,
      );
      expect(priceAggregate.addedBonusList, fakeAddedBonusList);
      expect(priceAggregate.stockInfo, emptyStockInfo);
      expect(priceAggregate.tenderContract, emptyTenderContract);
    });

    test('Empty PriceAggregate', () {
      final priceAggregate = PriceAggregate.empty();
      expect(priceAggregate.price, emptyPrice);
      expect(priceAggregate.materialInfo, emptyMaterialInfo);
      expect(priceAggregate.bundle, emptyBundle);
      expect(priceAggregate.salesOrgConfig, emptySalesOrganisationConfigs);
      expect(priceAggregate.quantity, 1);
      expect(priceAggregate.discountedMaterialCount, 0);
      expect(priceAggregate.addedBonusList, []);
      expect(priceAggregate.stockInfo, emptyStockInfo);
      expect(priceAggregate.tenderContract, emptyTenderContract);
    });

    test(
      'toOrderTemplateMaterial from PriceAggregate',
      () {
        expect(
          emptyPriceAggregate.toOrderTemplateMaterial(),
          OrderTemplateMaterial(
            materialNumber: emptyPriceAggregate.getMaterialNumber,
            materialGroup4: emptyPriceAggregate.materialInfo.materialGroup4,
            qty: emptyPriceAggregate.quantity,
            principalName: emptyPriceAggregate
                .materialInfo.principalData.principalName
                .getOrDefaultValue(''),
            materialDescription:
                emptyPriceAggregate.materialInfo.materialDescription,
            hidePrice: emptyPriceAggregate.materialInfo.hidePrice,
            hasValidTenderContract:
                emptyPriceAggregate.materialInfo.hasValidTenderContract,
            taxClassification:
                emptyPriceAggregate.materialInfo.taxClassification,
            type: '',
          ),
        );
      },
    );

    test('toSubmitMaterialInfo from PriceAggregate', () {
      final submitMaterialInfo = emptyPriceAggregate.toSubmitMaterialInfo();

      expect(submitMaterialInfo.batch, emptyPriceAggregate.stockInfo.batch);
      expect(submitMaterialInfo.bonuses, <MaterialItemBonus>[]);
      expect(submitMaterialInfo.comment, '');
      expect(submitMaterialInfo.materialNumber,
          emptyPriceAggregate.materialInfo.materialNumber);
      expect(submitMaterialInfo.quantity, emptyPriceAggregate.quantity);
      expect(submitMaterialInfo.salesDistrict,
          emptyPriceAggregate.stockInfo.salesDistrict);
      expect(
          submitMaterialInfo.materialItemOverride,
          MaterialItemOverrideDto.fromPrice(emptyPriceAggregate.price)
              .toDomain());
      expect(submitMaterialInfo.tenderContract,
          emptyPriceAggregate.tenderContract);
    });

    test(
        'toSubmitMaterialInfo from PriceAggregate should return empty batch number',
        () {
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        salesOrgConfig:
            emptySalesOrganisationConfigs.copyWith(enableBatchNumber: false),
      );
      final submitMaterialInfo = customPriceAggregate.toSubmitMaterialInfo();
      expect(submitMaterialInfo.batch, BatchNumber(''));
      expect(submitMaterialInfo.bonuses, <MaterialItemBonus>[]);
      expect(submitMaterialInfo.comment, '');
      expect(submitMaterialInfo.materialNumber,
          emptyPriceAggregate.materialInfo.materialNumber);
      expect(submitMaterialInfo.quantity, emptyPriceAggregate.quantity);
      expect(submitMaterialInfo.salesDistrict,
          emptyPriceAggregate.stockInfo.salesDistrict);
      expect(
          submitMaterialInfo.materialItemOverride,
          MaterialItemOverrideDto.fromPrice(emptyPriceAggregate.price)
              .toDomain());
      expect(submitMaterialInfo.tenderContract,
          emptyPriceAggregate.tenderContract);
    });

    test(
      'toSavedOrderMaterial from PriceAggregate',
      () {
        final expectedResult = MaterialItem(
          materialNumber: emptyPriceAggregate.materialInfo.materialNumber,
          qty: emptyPriceAggregate.quantity,
          defaultMaterialDescription:
              emptyPriceAggregate.materialInfo.materialDescription,
          type: MaterialItemType('Comm'),
          itemRegistrationNumber:
              emptyPriceAggregate.materialInfo.itemRegistrationNumber,
          unitOfMeasurement: emptyPriceAggregate.materialInfo.unitOfMeasurement,
          bonuses: emptyPriceAggregate.addedBonusList
              .where((element) => element.additionalBonusFlag)
              .toList(),
          zdp8Override: emptyPriceAggregate.price.zdp8Override,
          overridenPrice: emptyPriceAggregate.price.priceOverride,
          hidePrice: emptyPriceAggregate.materialInfo.hidePrice,
          materialGroup2: emptyPriceAggregate.materialInfo.materialGroup2,
          materialGroup4: emptyPriceAggregate.materialInfo.materialGroup4,
          tenderContract: emptyPriceAggregate.tenderContract,
          bundleName: '',
          bundleCode: '',
          materials: <MaterialInfo>[],
          comment: '',
          batchNumber: '',
          materialDescription: '',
          remarks: '',
          bundleInformation: [],
          totalQuantity: 0,
          hasValidTenderContract: emptyPriceAggregate.tenderContract !=
                  TenderContract.empty() &&
              emptyPriceAggregate.tenderContract != TenderContract.noContract(),
          tenderOrderReason:
              emptyPriceAggregate.tenderContract.tenderOrderReason,
        );
        expect(
          emptyPriceAggregate.toSavedOrderMaterial(),
          expectedResult,
        );
      },
    );

    test(
      'vatCalculation from PriceAggregate',
      () {
        expect(emptyPriceAggregate.vatCalculation(100), 100);
      },
    );

    test(
      'vatCalculation from PriceAggregate for vn',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            currency: Currency('vnd'),
          ),
          materialInfo: emptyPriceAggregate.materialInfo.copyWith(
            taxes: ['15'],
          ),
        );
        expect(customPriceAggregate.vatCalculation(10), 11.5);
      },
    );

    test(
      'vatCalculation from PriceAggregate for vn when taxes is empty',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            currency: Currency('vnd'),
          ),
        );
        expect(customPriceAggregate.vatCalculation(10), 10);
      },
    );

    test(
      'vatCalculation from PriceAggregate for Non vn',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            vatValue: 5,
          ),
          materialInfo: emptyPriceAggregate.materialInfo.copyWith(
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
        );
        expect(customPriceAggregate.vatCalculation(20), 21.0);
      },
    );

    test(
      'listPrice from PriceAggregate',
      () {
        expect(
            emptyPriceAggregate.listPrice, emptyPrice.lastPrice.getOrCrash());
      },
    );

    test(
      'finalPrice from PriceAggregate for Discount Eligible & tender price is 0',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(
            zmgDiscount: true,
            tiers: [
              PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
            ],
          ),
        );
        expect(
          customPriceAggregate.finalPrice,
          NumUtils.roundToPlaces(customPriceAggregate.discountedListPrice),
        );
      },
    );

    test(
      'finalPrice from PriceAggregate for Discount Eligible & tender price is not 0',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          tenderContract: TenderContract.empty().copyWith(
            tenderPrice: TenderPrice('40'),
            pricingUnit: 2,
          ),
          price: emptyPrice.copyWith(
            zmgDiscount: true,
            tiers: [
              PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
            ],
          ),
        );
        expect(
          customPriceAggregate.finalPrice,
          NumUtils.roundToPlaces(20),
        );
      },
    );

    test(
      'finalPrice from PriceAggregate for Discount not Eligible & tender price is not 0',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          tenderContract: TenderContract.empty().copyWith(
            tenderPrice: TenderPrice('40'),
            pricingUnit: 2,
          ),
        );
        expect(
          customPriceAggregate.finalPrice,
          20.0,
        );
      },
    );

    test(
      'finalPrice from PriceAggregate for Discount not Eligible & tender price is 0',
      () {
        expect(
          emptyPriceAggregate.finalPrice,
          NumUtils.roundToPlaces(emptyPrice.finalPrice.getOrDefaultValue(0)),
        );
      },
    );

    test(
      'unitPrice from PriceAggregate',
      () {
        expect(
          emptyPriceAggregate.unitPrice,
          NumUtils.roundToPlaces(emptyPrice.finalPrice.getOrDefaultValue(0)),
        );
      },
    );

    test(
      'unitPriceForTotal from PriceAggregate',
      () {
        expect(
          emptyPriceAggregate.unitPriceForTotal,
          NumUtils.roundToPlaces(emptyPrice.finalPrice.getOrDefaultValue(0)),
        );
      },
    );

    test(
      'unitPriceForTotal from PriceAggregate for VN tax',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          tenderContract: TenderContract.empty().copyWith(
            tenderPrice: TenderPrice('40'),
            pricingUnit: 2,
          ),
          price: emptyPrice.copyWith(
            zmgDiscount: true,
            tiers: [
              PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
            ],
          ),
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            currency: Currency('vnd'),
          ),
          materialInfo: emptyMaterialInfo.copyWith(
            taxes: ['5'],
          ),
        );
        expect(customPriceAggregate.unitPriceForTotal, 21.0);
      },
    );

    test(
      'unitPriceForTotal from PriceAggregate for VN tax total',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          tenderContract: TenderContract.empty().copyWith(
            tenderPrice: TenderPrice('40'),
            pricingUnit: 2,
          ),
          price: emptyPrice.copyWith(
            zmgDiscount: true,
            tiers: [
              PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
            ],
          ),
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableTaxAtTotalLevelOnly: true,
            currency: Currency('vnd'),
          ),
          materialInfo: emptyMaterialInfo.copyWith(
            taxes: ['5'],
          ),
        );
        expect(customPriceAggregate.unitPriceForTotal, 21.0);
      },
    );

    test(
      'unitPriceForTotal from PriceAggregate for VN tax total when taxes is empty',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          tenderContract: TenderContract.empty().copyWith(
            tenderPrice: TenderPrice('40'),
            pricingUnit: 2,
          ),
          price: emptyPrice.copyWith(
            zmgDiscount: true,
            tiers: [
              PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
            ],
          ),
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableTaxAtTotalLevelOnly: true,
            currency: Currency('vnd'),
          ),
        );
        expect(customPriceAggregate.unitPriceForTotal, 20);
      },
    );

    test(
      'unitPriceForTotal from PriceAggregate for Non VN tax',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          tenderContract: TenderContract.empty().copyWith(
            tenderPrice: TenderPrice('20'),
            pricingUnit: 2,
          ),
          price: emptyPrice.copyWith(
            zmgDiscount: true,
            tiers: [
              PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
            ],
          ),
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            vatValue: 5,
          ),
          materialInfo: emptyPriceAggregate.materialInfo.copyWith(
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
        );
        expect(customPriceAggregate.unitPriceForTotal, 10.5);
      },
    );

    test('finalPriceTotal from PriceAggregate', () {
      expect(
        emptyPriceAggregate.finalPriceTotal,
        emptyPriceAggregate.finalPrice * emptyPriceAggregate.quantity,
      );
    });

    test(
      'unitPriceTotal from PriceAggregate for enableTaxAtTotalLevelOnly',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          customPriceAggregate.unitPriceTotal,
          customPriceAggregate.unitPriceForTotal *
              customPriceAggregate.quantity,
        );
      },
    );

    test(
      'unitPriceTotal from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          customPriceAggregate.unitPriceTotal,
          customPriceAggregate.unitPriceTotal * customPriceAggregate.quantity,
        );
      },
    );

    test(
      'discountedListPrice from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
            price: emptyPrice.copyWith(
          tiers: [
            PriceTier.empty().copyWith(
              items: [
                PriceTierItem.empty(),
              ],
            ),
          ],
        ));
        expect(
          customPriceAggregate.discountedListPrice,
          customPriceAggregate.price.priceTireItem.first.rate,
        );
      },
    );

    test(
      'getNewPrice from PriceAggregate for isExempt',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(finalPrice: MaterialPrice(20.0)),
          materialInfo: emptyMaterialInfo.copyWith(
            taxClassification: MaterialTaxClassification('Exempt'),
          ),
        );
        expect(
          customPriceAggregate.getNewPrice(),
          customPriceAggregate.price.finalPrice.getOrCrash(),
        );
      },
    );

    test(
      'getNewPrice from PriceAggregate for isNoTax',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(finalPrice: MaterialPrice(20.0)),
          materialInfo: emptyMaterialInfo.copyWith(
            taxClassification: MaterialTaxClassification('noTax'),
          ),
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            vatValue: 4,
          ),
        );
        expect(
          customPriceAggregate.getNewPrice(),
          customPriceAggregate.price.finalPrice.getOrCrash() /
              (1 + customPriceAggregate.salesOrgConfig.vatValue),
        );
      },
    );

    test(
      'getNewPrice from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(finalPrice: MaterialPrice(20.0)),
        );
        expect(
          customPriceAggregate.getNewPrice(),
          customPriceAggregate.price.finalPrice.getOrCrash() / 1,
        );
      },
    );

    test(
      'display from PriceAggregate for isFOC',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(
            isFOC: true,
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPriceTotal),
          'FOC',
        );
      },
    );

    test(
      'display from PriceAggregate for finalPrice isUnavailable',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            hidePrice: false,
          ),
          price: emptyPrice.copyWith(
            isValid: true,
            isValidMaterial: true,
            finalPrice: MaterialPrice.unavailable(),
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPriceTotal),
          'NA',
        );
      },
    );

    test(
      'display from PriceAggregate for materialInfo hidePrice',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            hidePrice: true,
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPriceTotal),
          'NA',
        );
      },
    );

    test(
      'display from PriceAggregate for price is not Valid',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(
            isValid: false,
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPriceTotal),
          'NA',
        );
      },
    );

    test(
      'display from PriceAggregate for price is not ValidMaterial',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(
            isValidMaterial: false,
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPriceTotal),
          'NA',
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.finalPrice',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.finalPrice),
          StringUtils.displayPrice(
            emptyPriceAggregate.salesOrgConfig,
            emptyPriceAggregate.finalPrice,
          ),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.unitPrice with salesOrgConfig.enableTaxAtTotalLevelOnly',
      () async {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPrice),
          StringUtils.displayPrice(
            emptySalesOrganisationConfigs.copyWith(
              enableTaxAtTotalLevelOnly: true,
            ),
            emptyPriceAggregate.finalPrice,
          ),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.unitPrice',
      () async {
        expect(
          emptyPriceAggregate.display(PriceType.unitPrice),
          StringUtils.displayPrice(
            emptySalesOrganisationConfigs,
            emptyPriceAggregate.unitPrice,
          ),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.finalPriceTotal',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.finalPriceTotal),
          StringUtils.displayPrice(
            emptyPriceAggregate.salesOrgConfig,
            emptyPriceAggregate.finalPriceTotal,
          ),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.unitPriceTotal with salesOrgConfig.enableTaxAtTotalLevelOnly',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          customPriceAggregate.display(PriceType.unitPriceTotal),
          StringUtils.displayPrice(
            emptySalesOrganisationConfigs.copyWith(
              enableTaxAtTotalLevelOnly: true,
            ),
            emptyPriceAggregate.finalPriceTotal,
          ),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.unitPriceTotal',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.unitPriceTotal),
          StringUtils.displayPrice(
            emptySalesOrganisationConfigs,
            emptyPriceAggregate.unitPriceTotal,
          ),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.listPrice',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.listPrice),
          StringUtils.displayPrice(
            emptySalesOrganisationConfigs,
            emptyPriceAggregate.listPrice,
          ),
        );
      },
    );

    test(
      'isDefaultMDEnabled from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            enableDefaultMD: true,
          ),
          materialInfo: emptyMaterialInfo.copyWith(
            defaultMaterialDescription: 'Mat Default Description',
          ),
        );
        expect(
          customPriceAggregate.isDefaultMDEnabled,
          true,
        );
      },
    );

    test(
      'isFromBundle from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          bundle: emptyBundle.copyWith(
            bundleCode: '123',
          ),
        );
        expect(
          customPriceAggregate.isFromBundle,
          true,
        );
      },
    );

    test(
      'materialNumberString from PriceAggregate for materialNumberFromPrice.isEmpty',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            materialNumber: MaterialNumber('10'),
          ),
        );
        expect(
          customPriceAggregate.materialNumberString,
          '10',
        );
      },
    );

    test(
      'materialNumberString from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          price: emptyPrice.copyWith(
            materialNumber: MaterialNumber('22'),
          ),
          materialInfo: emptyMaterialInfo.copyWith(
            materialNumber: MaterialNumber('22'),
          ),
        );
        expect(
          customPriceAggregate.materialNumberString,
          '22',
        );
      },
    );

    test(
      'getMaterialNumber from PriceAggregate',
      () {
        expect(
          emptyPriceAggregate.getMaterialNumber,
          emptyPriceAggregate.materialInfo.materialNumber,
        );
      },
    );

    test(
      'taxDetails from PriceAggregate for salesOrgConfig.currency.isVN',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            currency: Currency('vnd'),
          ),
        );
        expect(
          customPriceAggregate.taxDetails,
          customPriceAggregate.materialInfo.getTotalTax(
            emptySalesOrganisationConfigs
                .copyWith(
                  currency: Currency('vnd'),
                )
                .enableTaxDisplay,
          ),
        );
      },
    );

    test(
      'taxDetails from PriceAggregate',
      () {
        expect(
          emptyPriceAggregate.taxDetails,
          emptyPriceAggregate.materialInfo.getTaxClassification(
            emptySalesOrganisationConfigs.enableTaxDisplay,
            emptySalesOrganisationConfigs.enableTaxClassification,
          ),
        );
      },
    );

    test(
      'refreshAddedBonus from PriceAggregate for equal length',
      () {
        expect(
          emptyPriceAggregate.refreshAddedBonus,
          false,
        );
      },
    );

    test(
      'refreshAddedBonus from PriceAggregate for unEqual length',
      () {
        var customPriceAggregate = emptyPriceAggregate.copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              additionalBonusFlag: false,
              bonusOverrideFlag: true,
            ),
          ],
          quantity: 10,
          price: emptyPrice.copyWith(
            bonuses: [
              PriceBonus.empty().copyWith(
                items: [
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 10,
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 5,
                        qualifyingQuantity: 2,
                      ),
                    ],
                    calculation: BonusMaterialCalculation('915'),
                  ),
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 8,
                    calculation: BonusMaterialCalculation('914'),
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 4,
                        qualifyingQuantity: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        expect(
          customPriceAggregate.refreshAddedBonus,
          true,
        );

        //for 914
        customPriceAggregate = emptyPriceAggregate.copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              additionalBonusFlag: false,
              bonusOverrideFlag: true,
            ),
          ],
          quantity: 10,
          price: emptyPrice.copyWith(
            bonuses: [
              PriceBonus.empty().copyWith(
                items: [
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 10,
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 5,
                        qualifyingQuantity: 2,
                      ),
                    ],
                    calculation: BonusMaterialCalculation('914'),
                  ),
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 8,
                    calculation: BonusMaterialCalculation('913'),
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 4,
                        qualifyingQuantity: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        expect(
          customPriceAggregate.refreshAddedBonus,
          true,
        );

        //for 913
        customPriceAggregate = emptyPriceAggregate.copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              additionalBonusFlag: false,
              bonusOverrideFlag: true,
            ),
          ],
          quantity: 10,
          price: emptyPrice.copyWith(
            bonuses: [
              PriceBonus.empty().copyWith(
                items: [
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 10,
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 5,
                        qualifyingQuantity: 2,
                        materialNumber: MaterialNumber('12'),
                      ),
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 7,
                        qualifyingQuantity: 3,
                        materialNumber: MaterialNumber('12'),
                      ),
                    ],
                    calculation: BonusMaterialCalculation('913'),
                  ),
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 10,
                    calculation: BonusMaterialCalculation('913'),
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 5,
                        qualifyingQuantity: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        expect(
          customPriceAggregate.refreshAddedBonus,
          true,
        );

        //for 911
        customPriceAggregate = emptyPriceAggregate.copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              additionalBonusFlag: false,
              bonusOverrideFlag: true,
            ),
          ],
          quantity: 10,
          price: emptyPrice.copyWith(
            bonuses: [
              PriceBonus.empty().copyWith(
                items: [
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 10,
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 5,
                        qualifyingQuantity: 2,
                        bonusRatio: 2,
                      ),
                    ],
                    calculation: BonusMaterialCalculation('911'),
                  ),
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 8,
                    calculation: BonusMaterialCalculation('912'),
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 4,
                        bonusRatio: 2,
                        qualifyingQuantity: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        expect(
          customPriceAggregate.refreshAddedBonus,
          true,
        );

        //for else
        final customPriceAggregate2 = emptyPriceAggregate.copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              additionalBonusFlag: false,
              bonusOverrideFlag: true,
            ),
          ],
          quantity: 10,
          price: emptyPrice.copyWith(
            bonuses: [
              PriceBonus.empty().copyWith(
                items: [
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 10,
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 5,
                        qualifyingQuantity: 2,
                        materialNumber: MaterialNumber('1'),
                      ),
                    ],
                    calculation: BonusMaterialCalculation('914'),
                  ),
                  PriceBonusItem.empty().copyWith(
                    qualifyingQuantity: 8,
                    calculation: BonusMaterialCalculation('913'),
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        bonusQuantity: 4,
                        qualifyingQuantity: 3,
                        materialNumber: MaterialNumber('1'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        expect(
          customPriceAggregate2.refreshAddedBonus,
          true,
        );
      },
    );

    test('getMaterialItemBonus from PriceAggregate', () {
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        quantity: 10,
        price: emptyPrice.copyWith(
          bonuses: [
            PriceBonus.empty().copyWith(
              items: [
                PriceBonusItem.empty().copyWith(
                  bonusMaterials: [
                    BonusMaterial.empty().copyWith(
                      bonusQuantity: 5,
                      qualifyingQuantity: 2,
                    ),
                  ],
                ),
                PriceBonusItem.empty().copyWith(
                  bonusMaterials: [
                    BonusMaterial.empty().copyWith(
                      bonusQuantity: 4,
                      qualifyingQuantity: 3,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
      final materialItemBonuses = customPriceAggregate.getMaterialItemBonus;
      expect(materialItemBonuses.length, 1);
      expect(materialItemBonuses[0].remainingQty, 0);
      expect(materialItemBonuses[0].additionalBonusFlag, false);
      expect(materialItemBonuses[0].bonusOverrideFlag, true);
    });

    test(
      'isEligibleAddAdditionBonus from PriceAggregate for materialInfo.materialGroup4.isFOC is true',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            materialGroup4: MaterialGroup.four('6A1'),
          ),
        );
        expect(
          customPriceAggregate.isEligibleAddAdditionBonus,
          false,
        );
      },
    );

    test(
      'isEligibleAddAdditionBonus from PriceAggregate for materialInfo.hidePrice is true',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            hidePrice: true,
          ),
        );
        expect(
          customPriceAggregate.isEligibleAddAdditionBonus,
          false,
        );
      },
    );

    test(
      'isEligibleAddAdditionBonus from PriceAggregate for salesOrgConfig.netPriceOverride & '
      'price.additionalBonusEligible is false',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            netPriceOverride: false,
          ),
          price: emptyPrice.copyWith(
            additionalBonusEligible: false,
          ),
        );
        expect(
          customPriceAggregate.isEligibleAddAdditionBonus,
          false,
        );
      },
    );

    test(
      'isEligibleAddAdditionBonus from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
            netPriceOverride: true,
          ),
          materialInfo: emptyMaterialInfo.copyWith(
            hidePrice: false,
            materialGroup4: MaterialGroup.four(''),
          ),
          price: emptyPrice.copyWith(
            additionalBonusEligible: true,
          ),
        );
        expect(
          customPriceAggregate.isEligibleAddAdditionBonus,
          true,
        );
      },
    );

    test(
      'hasSalesRepPrincipal from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100225'),
            ),
          ),
        );
        expect(
          customPriceAggregate.hasSalesRepPrincipal,
          true,
        );
      },
    );

    test(
      'hasClientPrincipal from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100822'),
            ),
          ),
        );
        expect(
          customPriceAggregate.hasClientPrincipal,
          true,
        );
      },
    );

    test(
      'getAddedBonusList from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(additionalBonusFlag: true),
            MaterialItemBonus.empty().copyWith(additionalBonusFlag: false),
            MaterialItemBonus.empty().copyWith(additionalBonusFlag: true),
          ],
        );
        final expectedList = customPriceAggregate.getAddedBonusList;
        expect(expectedList[0].additionalBonusFlag, false);
        expect(expectedList[1].additionalBonusFlag, true);
        expect(expectedList[2].additionalBonusFlag, true);
      },
    );

    test(
      'copyWithIncreasedQty from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(quantity: 3);
        expect(
          emptyPriceAggregate.copyWithIncreasedQty(qty: 2),
          customPriceAggregate,
        );
      },
    );
  });

  group('Combo Deal K1', () {
    final fakeMaterialNumber = MaterialNumber('fake-material');
    final fakeMaterialDeal = ComboDealMaterial.empty().copyWith(
      minQty: 4,
      materialNumber: fakeMaterialNumber,
      rate: -10,
    );
    final fakeComboDealDetail = ComboDeal.empty().copyWith(
      materialComboDeals: [
        ComboDealMaterialSet(
          materials: [fakeMaterialDeal],
          setNo: 'fake-set',
        )
      ],
    );
    final fakePriceAggregate = emptyPriceAggregate.copyWith(
      materialInfo:
          MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      quantity: 3,
    );
    test(
      'get self deal',
      () {
        final priceAggregate =
            fakePriceAggregate.copyWith(comboDeal: fakeComboDealDetail);
        expect(priceAggregate.selfComboDeal, fakeMaterialDeal);
        expect(priceAggregate.selfComboDeal.minQty, 4);
      },
    );

    test(
      'get self deal for price when not provide rate',
      () {
        final nonEligiblepPriceAggregate = fakePriceAggregate.copyWith(
          comboDeal: fakeComboDealDetail,
        );
        final eligiblepPriceAggregate = fakePriceAggregate.copyWith(
          comboDeal: fakeComboDealDetail,
          quantity: 4,
        );
        expect(nonEligiblepPriceAggregate.comboDealUnitPrice(), 90);
        expect(nonEligiblepPriceAggregate.comboDealTotalUnitPrice(), 270);
        expect(eligiblepPriceAggregate.comboDealUnitPrice(), 90);
        expect(eligiblepPriceAggregate.comboDealTotalUnitPrice(), 360);
      },
    );

    test(
      'get price when provide rate',
      () {
        final priceAggregate = fakePriceAggregate.copyWith(
          comboDeal: fakeComboDealDetail,
          quantity: 4,
        );
        expect(priceAggregate.comboDealUnitPrice(rate: -20), 80);
        expect(priceAggregate.comboDealTotalUnitPrice(rate: -20), 320);
      },
    );

    test(
      'get qty eligible',
      () {
        final priceAggregate = fakePriceAggregate.copyWith(
          comboDeal: fakeComboDealDetail,
        );

        expect(
          priceAggregate.selfComboDealEligible,
          false,
        );
        expect(
          priceAggregate.copyWith(quantity: 4).selfComboDealEligible,
          true,
        );
      },
    );
  });

  group('PriceAggregate list extension test', () {
    test('Map by material number', () {
      final list = [
        PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-1'),
          ),
        ),
        PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-2'),
          ),
        ),
      ];
      expect(list.mapByMaterialNumber, {
        MaterialNumber('fake-1'): PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-1'),
          ),
        ),
        MaterialNumber('fake-2'): PriceAggregate.empty().copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-2'),
          ),
        ),
      });
    });

    test('First ComboDeal', () {
      final list = [
        PriceAggregate.empty().copyWith(
          comboDeal: ComboDeal.empty().copyWith(
            flexiTierRule: [ComboDealTierRule.empty()],
          ),
        ),
        PriceAggregate.empty().copyWith(
          comboDeal: ComboDeal.empty(),
        ),
      ];
      expect(
        list.firstComboDeal,
        ComboDeal.empty().copyWith(
          flexiTierRule: [ComboDealTierRule.empty()],
        ),
      );
    });

    test('First PriceComboDeal', () {
      final list = [
        PriceAggregate.empty().copyWith(
          price: Price.empty().copyWith(
            comboDeal: PriceComboDeal.empty().copyWith(
              category: PriceComboDealCategory(
                type: ComboDealCategoryType('fake-type'),
                values: [],
              ),
            ),
          ),
        ),
        PriceAggregate.empty(),
      ];
      expect(
        list.firstPriceComboDeal,
        PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory(
            type: ComboDealCategoryType('fake-type'),
            values: [],
          ),
        ),
      );
    });
    test('toSubmitMaterialInfo from with bonus', () {
      final submitMaterialInfo = emptyPriceAggregate.copyWith(
        addedBonusList: [
          MaterialItemBonus.empty(),
        ],
      ).toSubmitMaterialInfo();

      expect(submitMaterialInfo.batch, emptyPriceAggregate.stockInfo.batch);
      expect(
        submitMaterialInfo.bonuses,
        <SubmitMaterialItemBonus>[
          SubmitMaterialItemBonusDto.fromMaterialItemBonus(
                  MaterialItemBonus.empty())
              .toDomain()
        ],
      );
      expect(submitMaterialInfo.comment, '');
      expect(submitMaterialInfo.materialNumber,
          emptyPriceAggregate.materialInfo.materialNumber);
      expect(submitMaterialInfo.quantity, emptyPriceAggregate.quantity);
      expect(submitMaterialInfo.salesDistrict,
          emptyPriceAggregate.stockInfo.salesDistrict);
      expect(
          submitMaterialInfo.materialItemOverride,
          MaterialItemOverrideDto.fromPrice(emptyPriceAggregate.price)
              .toDomain());
      expect(submitMaterialInfo.tenderContract,
          emptyPriceAggregate.tenderContract);
    });
  });
}
