import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  final emptyPrice = Price.empty();
  final emptyMaterialInfo = MaterialInfo.empty();
  final emptyBundle = Bundle.empty();
  final emptySalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  const fakeQuantity = 7;
  const fakeDiscountedMaterialCount = 10;
  final emptyStockInfo = StockInfo.empty();
  final emptyTenderContract = TenderContract.empty();
  final emptyPriceAggregate = PriceAggregate.empty();
  final emptyComboDeal = ComboDeal.empty();
  late List<Price> materialPriceListFromLocal;
  final bonusMaterial = BonusMaterial.empty().copyWith(
    materialNumber: MaterialNumber('fake-number'),
    qualifyingQuantity: 2,
    bonusQuantity: 1,
  );
  final bonusPrice = Price.empty().copyWith(
    finalPrice: MaterialPrice(10),
    bonuses: [
      PriceBonus(
        items: [
          PriceBonusItem(
            calculation: BonusMaterialCalculation('915'),
            bonusMaterials: [bonusMaterial],
            qualifyingQuantity: 2,
          )
        ],
      )
    ],
  );

  final priceTiers = [
    PriceTier.empty().copyWith(
      tier: 'C',
      items: [
        PriceTierItem.empty().copyWith(
          rate: 41,
          quantity: 5,
        ),
        PriceTierItem.empty().copyWith(
          rate: 20,
          quantity: 10,
        )
      ],
    )
  ];
  group('Price Aggregate Test', () {
    test('should return correct price aggregate object', () {
      final priceAggregate = PriceAggregate(
        banner: EZReachBanner.empty(),
        price: emptyPrice,
        materialInfo: emptyMaterialInfo,
        bundle: emptyBundle,
        salesOrgConfig: emptySalesOrganisationConfigs,
        quantity: fakeQuantity,
        discountedMaterialCount: fakeDiscountedMaterialCount,
        stockInfo: emptyStockInfo,
        tenderContract: emptyTenderContract,
        comboDeal: emptyComboDeal,
        bonusSampleItems: [],
        comboMaterials: [],
        maximumQty: 0,
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
      expect(priceAggregate.stockInfo, emptyStockInfo);
      expect(priceAggregate.tenderContract, emptyTenderContract);
    });

    test('toSubmitMaterialInfo from PriceAggregate', () {
      final submitMaterialInfo = emptyPriceAggregate.toSubmitMaterialInfo();

      expect(submitMaterialInfo.batch, emptyPriceAggregate.stockInfo.batch);
      expect(submitMaterialInfo.bonuses, <MaterialItemBonus>[]);
      expect(submitMaterialInfo.comment, '');
      expect(
        submitMaterialInfo.materialNumber,
        emptyPriceAggregate.materialInfo.materialNumber,
      );
      expect(submitMaterialInfo.quantity, emptyPriceAggregate.quantity);
      expect(
        submitMaterialInfo.materialItemOverride,
        MaterialItemOverrideDto.fromPriceAggregate(emptyPriceAggregate)
            .toDomain(),
      );
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
      expect(
        submitMaterialInfo.materialNumber,
        emptyPriceAggregate.materialInfo.materialNumber,
      );
      expect(submitMaterialInfo.quantity, emptyPriceAggregate.quantity);
      expect(
        submitMaterialInfo.materialItemOverride,
        MaterialItemOverrideDto.fromPriceAggregate(emptyPriceAggregate)
            .toDomain(),
      );
    });

    test('toSubmitMaterialInfo from PriceAggregate should return price', () {
      const finalPrice = 88.0;
      const vatValue = 9;

      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: Price.empty().copyWith(finalPrice: MaterialPrice(finalPrice)),
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material'),
          taxClassification: MaterialTaxClassification('Product : Full Tax'),
        ),
        salesOrgConfig: emptySalesOrganisationConfigs.copyWith(
          enableBatchNumber: false,
          vatValue: vatValue,
          displayItemTaxBreakdown: true,
        ),
      );
      final submitMaterialInfo = customPriceAggregate.toSubmitMaterialInfo();

      expect(
        submitMaterialInfo.mrp,
        finalPrice + (finalPrice * vatValue) / 100,
      );
      expect(
        submitMaterialInfo.tax,
        (finalPrice * vatValue) / 100,
      );
    });

    test(
        'toSubmitMaterialInfo from PriceAggregate should return mrp value as list price if list price is greater than final price',
        () {
      const finalPrice = 88.0;
      const listPrice = 100.0;

      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(finalPrice),
          lastPrice: MaterialPrice(listPrice),
        ),
      );
      final submitMaterialInfo = customPriceAggregate.toSubmitMaterialInfo();

      expect(
        submitMaterialInfo.mrp,
        listPrice,
      );
    });

    test(
        'toSubmitMaterialInfo from PriceAggregate should return mrp value as final price if final price is greater than list price',
        () {
      const finalPrice = 88.0;
      const listPrice = 70.0;

      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(finalPrice),
          lastPrice: MaterialPrice(listPrice),
        ),
      );
      final submitMaterialInfo = customPriceAggregate.toSubmitMaterialInfo();

      expect(
        submitMaterialInfo.mrp,
        finalPrice,
      );
    });

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
            tax: 15,
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
          emptyPriceAggregate.listPrice,
          emptyPrice.lastPrice.getOrCrash(),
        );
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
            tax: 5,
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
            tax: 5,
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
          ),
        );
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
          'Price Not Available',
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
          'Price Not Available',
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
          'Price Not Available',
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
          'Price Not Available',
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.finalPrice',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.finalPrice),
          'Price Not Available'.tr(),
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
          'Price Not Available'.tr(),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.unitPrice',
      () async {
        expect(
          emptyPriceAggregate.display(PriceType.unitPrice),
          'Price Not Available'.tr(),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.finalPriceTotal',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.finalPriceTotal),
          'Price Not Available'.tr(),
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
          'Price Not Available'.tr(),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.unitPriceTotal',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.unitPriceTotal),
          'Price Not Available'.tr(),
        );
      },
    );

    test(
      'display from PriceAggregate for PriceType.listPrice',
      () {
        expect(
          emptyPriceAggregate.display(PriceType.listPrice),
          'Price Not Available'.tr(),
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

    group('id getter', () {
      test('returns combo id for combo deal', () {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          flexibleGroup: FlexibleGroup('fake-group'),
          salesDeal: SalesDealNumber('fake-sales-deal'),
        );
        final combo = emptyPriceAggregate.copyWith(
          materialInfo:
              MaterialInfo.empty().copyWith(type: MaterialInfoType.combo()),
          comboMaterials: [
            ComboMaterialItem.empty().copyWith(comboDeals: priceComboDeal)
          ],
        );

        expect(combo.id, MaterialNumber(priceComboDeal.id));
      });
      test('returns bundle code for bundle', () {
        final bundle = emptyPriceAggregate.copyWith(
          materialInfo:
              MaterialInfo.empty().copyWith(type: MaterialInfoType.bundle()),
          bundle: emptyBundle.copyWith(
            bundleCode: '123',
          ),
        );
        expect(bundle.id, MaterialNumber('123'));
      });

      test('returns material number for material', () {
        final bundle = emptyPriceAggregate.copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            type: MaterialInfoType.material(),
            materialNumber: MaterialNumber('fake'),
          ),
        );
        expect(bundle.id, MaterialNumber('fake'));
      });
    });

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
      'copyWithIncreasedQty from PriceAggregate',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(quantity: 3);
        expect(
          emptyPriceAggregate.copyWithIncreasedQty(qty: 2),
          customPriceAggregate,
        );
      },
    );

    group('calculateMaterialItemBonus (new bonus list) getter -', () {
      const qty = 3;
      final bonusMaterial1 = BonusMaterial.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-1'),
        qualifyingQuantity: qty,
        bonusQuantity: 1,
        bonusRatio: 2,
      );
      final bonusMaterial2 = BonusMaterial.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-2'),
        qualifyingQuantity: qty + 1,
        bonusQuantity: 2,
        bonusRatio: 1,
      );
      final priceBonusItem = PriceBonusItem(
        calculation: BonusMaterialCalculation(''),
        bonusMaterials: [bonusMaterial1, bonusMaterial2],
        qualifyingQuantity: qty - 1,
      );

      Price priceWithBonus(String calculation) => Price.empty().copyWith(
            bonuses: [
              PriceBonus(
                items: [
                  priceBonusItem.copyWith(
                    calculation: BonusMaterialCalculation(calculation),
                  ),
                ],
              ),
            ],
          );

      test('915 calculation', () {
        expect(
          emptyPriceAggregate
              .copyWith(
                price: priceWithBonus('915'),
                quantity: qty,
              )
              .calculateMaterialItemBonus,
          [bonusMaterial1, bonusMaterial2]
              .map(
                (e) => e.copyWith(
                  bonusQuantity:
                      (qty / priceBonusItem.qualifyingQuantity).truncate() *
                          e.bonusQuantity,
                ),
              )
              .toList(),
        );
      });

      test('914 calculation', () {
        expect(
          emptyPriceAggregate
              .copyWith(
                price: priceWithBonus('914'),
                quantity: qty,
              )
              .calculateMaterialItemBonus,
          [bonusMaterial1, bonusMaterial2]
              .map(
                (e) => e.copyWith(
                  bonusQuantity: (qty /
                          priceBonusItem.qualifyingQuantity *
                          e.bonusQuantity)
                      .truncate(),
                ),
              )
              .toList(),
        );
      });

      test('912 calculation', () {
        expect(
          emptyPriceAggregate
              .copyWith(
                price: priceWithBonus('912'),
                quantity: qty,
              )
              .calculateMaterialItemBonus,
          [bonusMaterial1, bonusMaterial2],
        );
      });

      test('911 calculation', () {
        expect(
          emptyPriceAggregate
              .copyWith(
                price: priceWithBonus('911'),
                quantity: qty,
              )
              .calculateMaterialItemBonus,
          [bonusMaterial1, bonusMaterial2]
              .map(
                (e) => e.copyWith(
                  bonusQuantity:
                      (qty / e.bonusRatio).truncate() * e.bonusQuantity,
                ),
              )
              .toList(),
        );
      });

      test('001 calculation', () {
        expect(
          emptyPriceAggregate
              .copyWith(
                price: priceWithBonus('001'),
                quantity: qty,
              )
              .calculateMaterialItemBonus,
          [bonusMaterial1, bonusMaterial2]
              .map(
                (e) => e.copyWith(
                  bonusQuantity:
                      (qty / e.bonusRatio).truncate() * e.bonusQuantity,
                ),
              )
              .toList(),
        );
      });

      test('002 calculation', () {
        expect(
          emptyPriceAggregate
              .copyWith(
                price: priceWithBonus('002'),
                quantity: qty,
              )
              .calculateMaterialItemBonus,
          [bonusMaterial1, bonusMaterial2]
              .map(
                (e) => e.copyWith(
                  bonusQuantity:
                      (qty / e.bonusRatio).truncate() * e.bonusQuantity,
                ),
              )
              .toList(),
        );
      });
    });
  });

  group('Combo Deal K1', () {
    final fakeMaterialNumber = MaterialNumber('fake-material');
    final fakeMaterialDeal = ComboDealMaterial.empty().copyWith(
      minQty: 4,
      materialNumber: fakeMaterialNumber,
      rate: -10,
    );
    final fakePercentMaterialDeal = fakeMaterialDeal.copyWith(
      type: DiscountType('%'),
    );
    final fakeAmountMaterialDeal = fakeMaterialDeal.copyWith(
      type: DiscountType('USD'),
    );
    final fakePercentComboDealDetail = ComboDeal.empty().copyWith(
      materialComboDeals: [
        ComboDealMaterialSet(
          materials: [fakePercentMaterialDeal],
          setNo: 'fake-set',
        )
      ],
    );
    final fakeAmountComboDealDetail = ComboDeal.empty().copyWith(
      materialComboDeals: [
        ComboDealMaterialSet(
          materials: [fakeAmountMaterialDeal],
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

    group('get self deal', () {
      test('percent discount type', () {
        final priceAggregate1 = fakePriceAggregate.copyWith(
          comboDeal: fakePercentComboDealDetail,
        );
        expect(priceAggregate1.selfComboDeal, fakePercentMaterialDeal);
        expect(priceAggregate1.selfComboDeal.minQty, 4);
        expect(priceAggregate1.selfComboDeal.discountInfo.rate, -10);
        expect(
          priceAggregate1.selfComboDeal.discountInfo.type,
          DiscountType('%'),
        );
        expect(priceAggregate1.comboDealUnitPrice(), 90);
        expect(priceAggregate1.comboDealTotalUnitPrice(), 270);
      });

      test('amount discount type', () {
        final priceAggregate2 = fakePriceAggregate.copyWith(
          comboDeal: fakeAmountComboDealDetail,
          quantity: 4,
        );

        expect(priceAggregate2.comboDealUnitPrice(), -10);
        expect(priceAggregate2.comboDealTotalUnitPrice(), -40);
        expect(priceAggregate2.selfComboDeal, fakeAmountMaterialDeal);
        expect(priceAggregate2.selfComboDeal.minQty, 4);
        expect(priceAggregate2.selfComboDeal.discountInfo.rate, -10);
        expect(
          priceAggregate2.selfComboDeal.discountInfo.type,
          DiscountType('USD'),
        );
      });

      test('discount type is empty', () {
        final fakeAmountComboDealDetail = ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [
                fakeAmountMaterialDeal.copyWith(
                  type: DiscountType(''),
                )
              ],
              setNo: 'fake-set',
            )
          ],
        );
        final priceAggregate2 = fakePriceAggregate.copyWith(
          comboDeal: fakeAmountComboDealDetail,
          quantity: 4,
        );

        expect(priceAggregate2.comboDealUnitPrice(), 100);
        expect(priceAggregate2.comboDealTotalUnitPrice(), 400);
      });
    });

    group('get price when provide rate,', () {
      final priceAggregate = fakePriceAggregate.copyWith(
        comboDeal: fakePercentComboDealDetail,
        quantity: 4,
      );
      test('percent discount type', () {
        expect(
          priceAggregate.comboDealUnitPrice(
            discount:
                DiscountInfo(type: DiscountType('%'), rate: -20, minQty: 2),
          ),
          80,
        );
        expect(
          priceAggregate.comboDealTotalUnitPrice(
            discount:
                DiscountInfo(type: DiscountType('%'), rate: -20, minQty: 2),
          ),
          320,
        );
      });
      test('amount discount type', () {
        expect(
          priceAggregate.comboDealUnitPrice(
            discount:
                DiscountInfo(type: DiscountType('USD'), rate: -20, minQty: 2),
          ),
          -20,
        );
        expect(
          priceAggregate.comboDealTotalUnitPrice(
            discount:
                DiscountInfo(type: DiscountType('USD'), rate: -20, minQty: 2),
          ),
          -80,
        );
      });

      test('empty discount type', () {
        expect(
          priceAggregate.comboDealUnitPrice(
            discount:
                DiscountInfo(type: DiscountType(''), rate: 100, minQty: 2),
          ),
          100,
        );
        expect(
          priceAggregate.comboDealTotalUnitPrice(
            discount:
                DiscountInfo(type: DiscountType(''), rate: 100, minQty: 2),
          ),
          400,
        );
      });
    });

    test(
      'get qty eligible',
      () {
        final priceAggregate = fakePriceAggregate.copyWith(
          comboDeal: fakePercentComboDealDetail,
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

    test(
      'PriceAggregate getTotalQuantityOfBundleProduct',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          bundle: emptyBundle.copyWith(
            bundleCode: '123',
            materials: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(1),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                quantity: MaterialQty(1),
              ),
            ],
          ),
        );
        expect(
          customPriceAggregate.getTotalQuantityOfBundleProduct,
          2,
        );
      },
    );

    test(
      'PriceAggregate isBundleMinimumQuantitySatisfies = true',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          bundle: emptyBundle.copyWith(
            bundleCode: '123',
            materials: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(1),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                quantity: MaterialQty(1),
              ),
            ],
            bundleInformation: [
              BundleInfo(
                sequence: 1,
                quantity: 2,
                type: DiscountType('%'),
                rate: 20,
              )
            ],
          ),
        );
        expect(
          customPriceAggregate.isBundleMinimumQuantitySatisfies,
          true,
        );
      },
    );

    test(
      'PriceAggregate isBundleMinimumQuantitySatisfies = false',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          bundle: emptyBundle.copyWith(
            bundleCode: '123',
            materials: [
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(1),
              ),
            ],
            bundleInformation: [
              BundleInfo(
                sequence: 1,
                quantity: 2,
                type: DiscountType('%'),
                rate: 20,
              )
            ],
          ),
        );
        expect(
          customPriceAggregate.isBundleMinimumQuantitySatisfies,
          false,
        );
      },
    );

    test(
      'PriceAggregate itemTaxPercent displayItemTaxBreakdown is not active',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100822'),
            ),
            tax: 5.0,
          ),
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: false,
            vatValue: 10,
          ),
        );
        expect(
          customPriceAggregate.itemTaxPercent,
          0.0,
        );
      },
    );

    test(
      'PriceAggregate itemTaxPercent material tax Classification full tax not applied',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100822'),
            ),
            tax: 5.0,
            taxClassification: MaterialTaxClassification('noTax'),
          ),
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 10,
          ),
        );
        expect(
          customPriceAggregate.itemTaxPercent,
          0.0,
        );
      },
    );

    test(
      'PriceAggregate itemTaxPercent material tax Classification full material level tax applied of vn',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100822'),
            ),
            tax: 5.0,
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 10,
            salesOrg: fakeVNSalesOrg,
          ),
        );
        expect(
          customPriceAggregate.itemTaxPercent,
          5.0,
        );
      },
    );

    test(
      'PriceAggregate itemTaxPercent material tax Classification full material level tax applied of ID',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100822'),
            ),
            tax: 5.0,
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 10,
            salesOrg: fakeIDSalesOrg,
          ),
        );
        expect(
          customPriceAggregate.itemTaxPercent,
          11.0,
        );
      },
    );

    test(
      'PriceAggregate itemTaxPercent material tax Classification full sales org level config tax applied for other then vn market',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          materialInfo: emptyMaterialInfo.copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipalCode('100822'),
            ),
            tax: 5.0,
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 10,
            currency: Currency('php'),
          ),
        );
        expect(
          customPriceAggregate.itemTaxPercent,
          10.0,
        );
      },
    );

    // test('toSubmitMaterialInfo from with bonus', () {
    //   final submitMaterialInfo = emptyPriceAggregate.copyWith(
    //     addedBonusList: [
    //       MaterialItemBonus.empty(),
    //     ],
    //   ).toSubmitMaterialInfo();

    //   expect(submitMaterialInfo.batch, emptyPriceAggregate.stockInfo.batch);
    //   expect(
    //     submitMaterialInfo.bonuses,
    //     <SubmitMaterialItemBonus>[
    //       SubmitMaterialItemBonusDto.fromMaterialItemBonus(
    //         BonusSampleItem.empty(),
    //       ).toDomain()
    //     ],
    //   );
    //   expect(submitMaterialInfo.comment, '');
    //   expect(
    //     submitMaterialInfo.materialNumber,
    //     emptyPriceAggregate.materialInfo.materialNumber,
    //   );
    //   expect(submitMaterialInfo.quantity, emptyPriceAggregate.quantity);
    //   expect(
    //     submitMaterialInfo.materialItemOverride,
    //     MaterialItemOverrideDto.fromPriceAggregate(emptyPriceAggregate)
    //         .toDomain(),
    //   );
    // });
  });

  group('PriceAggregate Bonus Deal Test', () {
    setUpAll(() async {
      //     var input = await File('assets/json/getMaterialPriceResponse.json').readAsString();
      // var map = jsonDecode(input);
      final data = json.decode(
        await File('assets/json/getMaterialPriceResponse.json').readAsString(),
      );
      final finalData = data['data']['price'];
      materialPriceListFromLocal =
          List.from(makeResponseCamelCase(jsonEncode(finalData)))
              .map((e) => PriceDto.fromJson(e).toDomain())
              .toList();
    });
    test('PriceAggregate single Bonus Deal', () {
      final price = materialPriceListFromLocal.firstWhere(
        (element) =>
            element.materialNumber == MaterialNumber('000000000021041768'),
        orElse: () => Price.empty(),
      );
      final singleBonusPriceAggregate = PriceAggregate.empty().copyWith(
        price: price,
      );
      expect(
        singleBonusPriceAggregate
            .copyWith(quantity: 5)
            .calculateMaterialItemBonus,
        [],
      );
      expect(
        singleBonusPriceAggregate
            .copyWith(quantity: 6)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.first.bonusMaterials.first.copyWith(
            bonusQuantity: 1,
          )
        ],
      );
      expect(
        singleBonusPriceAggregate
            .copyWith(quantity: 12)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.first.bonusMaterials.first.copyWith(
            bonusQuantity: 2,
          )
        ],
      );
    });

    test('PriceAggregate multiple Bonus Deal', () {
      final price = materialPriceListFromLocal.firstWhere(
        (element) =>
            element.materialNumber == MaterialNumber('000000000021041805'),
        orElse: () => Price.empty(),
      );
      final multipleBonusPriceAggregate = PriceAggregate.empty().copyWith(
        price: price,
      );
      expect(
        multipleBonusPriceAggregate
            .copyWith(quantity: 7)
            .calculateMaterialItemBonus,
        [],
      );
      expect(
        multipleBonusPriceAggregate
            .copyWith(quantity: 16)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.last.bonusMaterials.first.copyWith(
            bonusQuantity: 2,
          )
        ],
      );
      expect(
        multipleBonusPriceAggregate
            .copyWith(quantity: 24)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.first.bonusMaterials.first.copyWith(
            bonusQuantity: 3,
          )
        ],
      );
      expect(
        multipleBonusPriceAggregate
            .copyWith(quantity: 32)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.first.bonusMaterials.first.copyWith(
            bonusQuantity: 4,
          )
        ],
      );
      expect(
        multipleBonusPriceAggregate
            .copyWith(quantity: 40)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.first.bonusMaterials.first.copyWith(
            bonusQuantity: 5,
          )
        ],
      );
      expect(
        multipleBonusPriceAggregate
            .copyWith(quantity: 48)
            .calculateMaterialItemBonus,
        [
          price.priceBonusItem.first.bonusMaterials.first.copyWith(
            bonusQuantity: 6,
          )
        ],
      );
    });

    // test('PriceAggregate multiple Bonus Deal with multiple material', () {
    //   final price = materialPriceListFromLocal.firstWhere(
    //     (element) =>
    //         element.materialNumber == MaterialNumber('000000000021041779'),
    //     orElse: () => Price.empty(),
    //   );
    //   final multipleBonusPriceAggregate = PriceAggregate.empty().copyWith(
    //     price: price,
    //   );
    //   expect(
    //     multipleBonusPriceAggregate
    //         .copyWith(quantity: 1)
    //         .calculateMaterialItemBonus,
    //     [
    //       price.priceBonusItem.last.bonusMaterials.last.copyWith(
    //         bonusQuantity: 1,
    //       )
    //     ],
    //   );
    //   expect(
    //     multipleBonusPriceAggregate
    //         .copyWith(quantity: 11)
    //         .calculateMaterialItemBonus,
    //     [
    //       price.priceBonusItem.last.bonusMaterials.last.copyWith(
    //         bonusQuantity: 11,
    //       )
    //     ],
    //   );
    //   expect(
    //     multipleBonusPriceAggregate
    //         .copyWith(quantity: 12)
    //         .calculateMaterialItemBonus,
    //     [
    //       price.priceBonusItem.elementAt(3).bonusMaterials.first.copyWith(
    //             bonusQuantity: 2,
    //           ),
    //       price.priceBonusItem.elementAt(3).bonusMaterials.last.copyWith(
    //             bonusQuantity: 14,
    //           )
    //     ],
    //   );
    //   expect(
    //     multipleBonusPriceAggregate
    //         .copyWith(quantity: 20)
    //         .calculateMaterialItemBonus,
    //     [
    //       price.priceBonusItem.elementAt(3).bonusMaterials.first.copyWith(
    //             bonusQuantity: 2,
    //           ),
    //       price.priceBonusItem.elementAt(3).bonusMaterials.last.copyWith(
    //             bonusQuantity: 22,
    //           )
    //     ],
    //   );
    //   expect(
    //     multipleBonusPriceAggregate
    //         .copyWith(quantity: 24)
    //         .calculateMaterialItemBonus,
    //     [
    //       price.priceBonusItem.elementAt(2).bonusMaterials.first.copyWith(
    //             bonusQuantity: 5,
    //           ),
    //       price.priceBonusItem.elementAt(2).bonusMaterials.last.copyWith(
    //             bonusQuantity: 29,
    //           )
    //     ],
    //   );
    // });
  });

  group('PriceAggregate ZPO1', () {
    test(
      'PriceAggregate ZPO1 test on BonusOverrideFlag',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          quantity: 3,
          price: bonusPrice.copyWith(isPriceOverride: true),
          bonusSampleItems: [
            BonusSampleItem.empty().copyWith(
              qty: MaterialQty(2),
              materialNumber: MaterialNumber('fake-number'),
            )
          ],
          salesOrgConfig: SalesOrganisationConfigs.empty()
              .copyWith(salesOrg: SalesOrg('2001'), currency: Currency('MYR')),
        );
        expect(
          customPriceAggregate
              .toSubmitMaterialInfo()
              .materialItemOverride
              .valueOverride
              .first
              .price,
          10,
        );
        expect(
          customPriceAggregate
              .toSubmitMaterialInfo()
              .materialItemOverride
              .valueOverride
              .first
              .currency,
          Currency('MYR'),
        );
      },
    );

    test(
      'PriceAggregate ZPO1 test on additionalBonusFlag',
      () {
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          quantity: 3,
          price: Price.empty()
              .copyWith(finalPrice: MaterialPrice(10), isPriceOverride: true),
          bonusSampleItems: [
            BonusSampleItem.empty().copyWith(
              qty: MaterialQty(2),
              materialNumber: MaterialNumber('fake-number'),
            )
          ],
          salesOrgConfig: SalesOrganisationConfigs.empty()
              .copyWith(salesOrg: SalesOrg('2001'), currency: Currency('MYR')),
        );
        expect(
          customPriceAggregate
              .toSubmitMaterialInfo()
              .materialItemOverride
              .valueOverride
              .first
              .price,
          10,
        );
        expect(
          customPriceAggregate
              .toSubmitMaterialInfo()
              .materialItemOverride
              .valueOverride
              .first
              .currency,
          Currency('MYR'),
        );
      },
    );

    test(
      'Find final price with tiering bonus from toSubmitMaterialInfo',
      () {
        final priceTiers = [
          PriceTier.empty().copyWith(
            tier: 'C',
            items: [
              PriceTierItem.empty().copyWith(
                rate: 41,
                quantity: 5,
              ),
              PriceTierItem.empty().copyWith(
                rate: 20,
                quantity: 10,
              )
            ],
          )
        ];
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          quantity: 10,
          price: Price.empty()
              .copyWith(finalPrice: MaterialPrice(100), tiers: priceTiers),
          discountedMaterialCount: 10,
        );
        expect(
          customPriceAggregate.toSubmitMaterialInfo().price,
          20,
        );
      },
    );

    test(
      'Find exhausted deal bonus with quantity 0 from dealBonusList',
      () {
        final parentProduct = MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-product'),
          quantity: MaterialQty(7),
        );
        final emptyBonus = MaterialInfo.empty();
        final customPriceAggregate = emptyPriceAggregate.copyWith(
          quantity: 7,
          materialInfo: parentProduct,
          bonusSampleItems: [
            BonusSampleItem.empty().copyWith(
              itemId: StringValue('123'),
              materialNumber: MaterialNumber('fake-bonus1'),
              qty: MaterialQty(2),
              type: MaterialInfoType('Deals'),
            )
          ],
          price: Price.empty().copyWith(
            bonuses: [
              PriceBonus.empty().copyWith(
                items: [
                  PriceBonusItem.empty().copyWith(
                    calculation: BonusMaterialCalculation('913'),
                    qualifyingQuantity: 7,
                    bonusMaterials: [
                      BonusMaterial.empty().copyWith(
                        materialNumber: MaterialNumber('fake-bonus2'),
                        calculation: BonusMaterialCalculation('913'),
                        qualifyingQuantity: 7,
                        bonusQuantity: 1,
                        limitPerTransaction: 0,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
        expect(
          customPriceAggregate.dealBonusList,
          [
            emptyBonus.copyWith(
              materialNumber: MaterialNumber('fake-bonus2'),
              quantity: MaterialQty(1),
              type: MaterialInfoType('Deals'),
              parentID: 'fake-product',
            ),
            emptyBonus.copyWith(
              materialNumber: MaterialNumber('fake-bonus1'),
              quantity: MaterialQty(0),
              type: MaterialInfoType('Deals'),
              sampleBonusItemId: '123',
              parentID: 'fake-product',
            )
          ],
        );
      },
    );

    test('=> aplFinalPriceTotal', () {
      const finalPrice = 80.0;
      const quantity = 2;
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(finalPrice),
        ),
        quantity: quantity,
      );

      expect(
        customPriceAggregate.aplFinalPriceTotal,
        finalPrice * quantity,
      );
    });

    test('=> finalCheckoutTotalForAllMaterial for ID', () {
      const finalPrice = 80.0;
      const quantity = 5;
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: bonusPrice.copyWith(
          finalPrice: MaterialPrice(finalPrice),
          tiers: priceTiers,
        ),
        quantity: quantity,
        salesOrgConfig: fakeIDSalesOrgConfigs,
      );

      expect(
        customPriceAggregate.finalCheckoutTotalForAllMaterial,
        '${finalPrice * quantity}',
      );
    });

    test('=> finalCheckoutTotalForAllMaterial for Other market', () {
      const quantity = 5;
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: bonusPrice.copyWith(
          finalPrice: MaterialPrice(80.0),
          tiers: priceTiers,
        ),
        quantity: quantity,
        salesOrgConfig: fakeMYSalesOrgConfigs,
      );

      expect(
        customPriceAggregate.finalCheckoutTotalForAllMaterial,
        '${priceTiers.first.items.first.rate * quantity}',
      );
    });

    test('=> toSubmitMaterialInfo for Id market', () {
      const finalPrice = 80.0;
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: bonusPrice.copyWith(
          finalPrice: MaterialPrice(finalPrice),
          tiers: priceTiers,
        ),
        quantity: 5,
        salesOrgConfig: fakeIDSalesOrgConfigs,
      );

      expect(
        customPriceAggregate.toSubmitMaterialInfo().price,
        finalPrice,
      );
    });

    test('=> toSubmitMaterialInfo for Other market', () {
      final customPriceAggregate = emptyPriceAggregate.copyWith(
        price: bonusPrice.copyWith(
          finalPrice: MaterialPrice(80.0),
          tiers: priceTiers,
        ),
        quantity: 5,
        salesOrgConfig: fakeMYSalesOrgConfigs,
      );

      expect(
        customPriceAggregate.toSubmitMaterialInfo().price,
        priceTiers.first.items.first.rate,
      );
    });
  });
}
