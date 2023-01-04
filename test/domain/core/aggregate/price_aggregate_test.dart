import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const priceTierItem1 = PriceTierItem(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 1,
    rate: 800,
  );
  const priceTierItem2 = PriceTierItem(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 3,
    rate: 850,
  );
  const priceTierItem3 = PriceTierItem(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 5,
    rate: 900,
  );
  final mockPriceAggregateList = [
    PriceAggregate.empty().copyWith(
        quantity: 1,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: '台灣拜耳股份有限公司',
          ),
          remarks: '',
        ),
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(750),
        ),
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('8949542'),
          inStock: MaterialInStock('Yes'),
          expiryDate: ExpiryDate('NA'),
          salesDistrict: '',
          batch: '',
        )),
    PriceAggregate.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168459'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
      ),
      price: Price.empty().copyWith(
        finalPrice: MaterialPrice(750),
        materialNumber: MaterialNumber('000000000023168459'),
        zmgDiscount: true,
        tiers: [
          PriceTier.empty().copyWith(
            tier: 'c',
            items: [
              priceTierItem1,
              priceTierItem2,
              priceTierItem3,
            ],
          ),
        ],
      ),
    ),
  ];
  group('Price Aggregate Test', () {
    test(
      'OrderTemplate from PriceAggregate test ',
      () async {
        final priceAggregate = mockPriceAggregateList.first;
        final priceAggregateMaterialInfo = priceAggregate.materialInfo;
        expect(
          mockPriceAggregateList.first.toOrderTemplateMaterial(),
          OrderTemplateMaterial(
            materialNumber: priceAggregate.getMaterialNumber,
            materialGroup4: priceAggregateMaterialInfo.materialGroup4,
            qty: priceAggregate.quantity,
            principalName:
                priceAggregateMaterialInfo.principalData.principalName,
            materialDescription: priceAggregateMaterialInfo.materialDescription,
            hidePrice: priceAggregateMaterialInfo.hidePrice,
            hasValidTenderContract:
                priceAggregateMaterialInfo.hasValidTenderContract,
            taxClassification: priceAggregateMaterialInfo.taxClassification,
            type: '',
          ),
        );
      },
    );

    test(
      'OrderTemplate from PriceAggregate test ',
      () async {
        final priceAggregate = mockPriceAggregateList.first;
        final stockInfo = priceAggregate.stockInfo;
        expect(
          priceAggregate.toSubmitMaterialInfo(),
          SubmitMaterialInfo(
            materialNumber: priceAggregate.getMaterialNumber,
            batch: stockInfo.batch,
            bonuses: <MaterialItemBonus>[],
            comment: '',
            materialItemOverride:
                MaterialItemOverrideDto.fromPrice(priceAggregate.price)
                    .toDomain(),
            quantity: priceAggregate.quantity,
            salesDistrict: stockInfo.salesDistrict, tenderContract: priceAggregate.tenderContract,
          ),
        );
      },
    );

    test(
      'PriceAggregate test vatCalculation ',
      () async {
        final priceAggregate = mockPriceAggregateList.first;
        expect(priceAggregate.vatCalculation(10), 10);
      },
    );
    test(
      'PriceAggregate test vatCalculation for vn',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            currency: Currency('vnd'),
          ),
          materialInfo: mockPriceAggregateList.first.materialInfo.copyWith(
            taxes: ['5'],
          ),
        );
        expect(priceAggregate.vatCalculation(10), 10.5);
      },
    );

    test(
      'PriceAggregate test vatCalculation for Non vn',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            vatValue: 10,
          ),
          materialInfo: mockPriceAggregateList.first.materialInfo.copyWith(
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
        );
        expect(priceAggregate.vatCalculation(10), 11);
      },
    );

    test(
      'PriceAggregate test final Price Discount Eligible',
      () async {
        final priceAggregate = mockPriceAggregateList.elementAt(1).copyWith(
              quantity: 3,
              discountedMaterialCount: 3,
            );
        expect(
          priceAggregate.finalPrice,
          priceAggregate.price.priceTireItem.elementAt(1).rate,
        );
      },
    );

    test(
      'PriceAggregate test final Price Discount Eligible & Tender Contract',
      () async {
        final priceAggregate = mockPriceAggregateList.elementAt(1).copyWith(
              tenderContract: TenderContract.empty()
                  .copyWith(tenderPrice: TenderPrice('10'), pricingUnit: 2),
              quantity: 3,
              discountedMaterialCount: 3,
            );
        expect(
          priceAggregate.finalPrice,
          5,
        );
      },
    );

    test(
      'PriceAggregate test final Price Tender Contract',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          tenderContract: TenderContract.empty()
              .copyWith(tenderPrice: TenderPrice('10'), pricingUnit: 2),
          quantity: 3,
          discountedMaterialCount: 3,
        );
        expect(
          priceAggregate.finalPrice,
          5,
        );
      },
    );

    test(
      'PriceAggregate UnitPriceForTotal VN tax test ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            currency: Currency('vnd'),
          ),
          materialInfo: mockPriceAggregateList.first.materialInfo.copyWith(
            taxes: ['5'],
          ),
        );
        expect(priceAggregate.unitPriceForTotal, 787.50);
      },
    );

    test(
      'PriceAggregate UnitPriceForTotal VN tax total test ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableTaxAtTotalLevelOnly: true,
            currency: Currency('vnd'),
          ),
          materialInfo: mockPriceAggregateList.first.materialInfo.copyWith(
            taxes: ['5'],
          ),
        );
        expect(priceAggregate.unitPriceForTotal, 787.50);
      },
    );

    test(
      'PriceAggregate UnitPriceForTotal Non VN tax test ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableTaxAtTotalLevelOnly: true,
            currency: Currency('none'),
            vatValue: 10,
          ),
        );
        expect(priceAggregate.unitPriceForTotal, 825);
      },
    );

    test(
      'PriceAggregate UnitPriceForTotal Non VN tax total test ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableVat: true,
            enableTaxClassification: true,
            currency: Currency('none'),
            vatValue: 10,
          ),
          materialInfo: mockPriceAggregateList.first.materialInfo.copyWith(
            taxClassification: MaterialTaxClassification('Product : Full Tax'),
          ),
        );
        expect(priceAggregate.unitPriceForTotal, 825);
      },
    );

    test(
      'PriceAggregate UnitPrice with enableTaxAtTotalLevelOnly',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          priceAggregate.unitPriceTotal,
          priceAggregate.unitPriceForTotal * 3,
        );
      },
    );
    test(
      'PriceAggregate UnitPrice ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
        );
        expect(
          priceAggregate.unitPriceTotal,
          priceAggregate.unitPrice * 3,
        );
      },
    );

    test(
      'PriceAggregate display UnitPriceTotal ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
        );
        expect(
          priceAggregate.display(PriceType.unitPriceTotal),
          StringUtils.displayPrice(mockPriceAggregateList.first.salesOrgConfig,
              priceAggregate.unitPriceTotal),
        );
      },
    );

    test(
      'PriceAggregate display UnitPriceTotal with enableTaxAtTotalLevelOnly',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          priceAggregate.display(PriceType.unitPriceTotal),
          StringUtils.displayPrice(
            mockPriceAggregateList.first.salesOrgConfig.copyWith(
              enableTaxAtTotalLevelOnly: true,
            ),
            priceAggregate.finalPriceTotal,
          ),
        );
      },
    );

    test(
      'PriceAggregate display UnitPrice',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
        );
        expect(
          priceAggregate.display(PriceType.unitPrice),
          StringUtils.displayPrice(mockPriceAggregateList.first.salesOrgConfig,
              priceAggregate.finalPrice),
        );
      },
    );
    test(
      'PriceAggregate display UnitPrice with enableTaxAtTotalLevelOnly ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          priceAggregate.display(PriceType.unitPrice),
          StringUtils.displayPrice(
              mockPriceAggregateList.first.salesOrgConfig.copyWith(
                enableTaxAtTotalLevelOnly: true,
              ),
              priceAggregate.unitPrice),
        );
      },
    );

    test(
      'PriceAggregate display listPrice ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          quantity: 3,
          salesOrgConfig: mockPriceAggregateList.first.salesOrgConfig.copyWith(
            enableTaxAtTotalLevelOnly: true,
          ),
        );
        expect(
          priceAggregate.display(PriceType.listPrice),
          StringUtils.displayPrice(
              mockPriceAggregateList.first.salesOrgConfig.copyWith(
                enableTaxAtTotalLevelOnly: true,
              ),
              priceAggregate.listPrice),
        );
      },
    );

    test(
      'PriceAggregate hasClientPrinciple ',
      () async {
        final priceAggregate = mockPriceAggregateList.first.copyWith(
          materialInfo: MaterialInfo.empty().copyWith(
            principalData: PrincipalData.empty().copyWith(
              principalCode: PrincipleCode('100822'),
            ),
          ),
        );
        expect(
          priceAggregate.hasClientPrinciple,
          true,
        );
      },
    );
  });
}
