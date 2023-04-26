import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_item_bonus_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';

part 'price_aggregate.freezed.dart';
part 'price_aggregate_extension.dart';

@freezed
class PriceAggregate with _$PriceAggregate {
  const PriceAggregate._();

  const factory PriceAggregate({
    required Price price,
    required MaterialInfo materialInfo,
    required Bundle bundle,
    required BannerItem banner,
    required SalesOrganisationConfigs salesOrgConfig,
    required int quantity,
    @Default(0) int discountedMaterialCount,
    required List<MaterialItemBonus> addedBonusList,
    required StockInfo stockInfo,
    required TenderContract tenderContract,
    required ComboDeal comboDeal,
    @Default(false) bool isSpecialOrderType,
    @Default(<StockInfo>[]) List<StockInfo> stockInfoList,
  }) = _PriceAggregate;

  factory PriceAggregate.empty() => PriceAggregate(
        price: Price.empty(),
        banner: BannerItem.empty(),
        materialInfo: MaterialInfo.empty(),
        bundle: Bundle.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        quantity: 1,
        discountedMaterialCount: 0,
        addedBonusList: [],
        stockInfo: StockInfo.empty(),
        tenderContract: TenderContract.empty(),
        comboDeal: ComboDeal.empty(),
      );

  OrderTemplateMaterial toOrderTemplateMaterial() {
    return OrderTemplateMaterial(
      materialNumber: materialInfo.materialNumber,
      materialGroup4: materialInfo.materialGroup4,
      qty: quantity,
      principalName:
          materialInfo.principalData.principalName.getOrDefaultValue(''),
      materialDescription: materialInfo.materialDescription,
      hidePrice: materialInfo.hidePrice,
      hasValidTenderContract: materialInfo.hasValidTenderContract,
      taxClassification: materialInfo.taxClassification,
      type: '',
    );
  }

  SubmitMaterialInfo toSubmitMaterialInfo() {
    return SubmitMaterialInfo(
      batch:
          salesOrgConfig.enableBatchNumber ? stockInfo.batch : BatchNumber(''),
      bonuses: addedBonusList
          .map(
            (e) =>
                SubmitMaterialItemBonusDto.fromMaterialItemBonus(e).toDomain(),
          )
          .toList(),
      comment: materialInfo.remarks,
      materialNumber: materialInfo.materialNumber,
      quantity: quantity,
      salesDistrict: stockInfo.salesDistrict,
      materialItemOverride: MaterialItemOverrideDto.fromPrice(price).toDomain(),
      tenderContract: tenderContract,
    );
  }

  MaterialItem toSavedOrderMaterial() {
    return MaterialItem.empty().copyWith(
      banner: banner,
      materialNumber: materialInfo.materialNumber,
      qty: quantity,
      defaultMaterialDescription: materialInfo.materialDescription,
      type: MaterialItemType('Comm'),
      itemRegistrationNumber: materialInfo.itemRegistrationNumber,
      unitOfMeasurement: materialInfo.unitOfMeasurement,
      bonuses: addedBonusList
          .where((element) => element.additionalBonusFlag)
          .toList(),
      zdp8Override: price.zdp8Override,
      overridenPrice: price.priceOverride,
      hidePrice: materialInfo.hidePrice,
      materialGroup2: materialInfo.materialGroup2,
      materialGroup4: materialInfo.materialGroup4,
      tenderContract: tenderContract,
      hasValidTenderContract: !notHavingContract,
      tenderOrderReason: tenderContract.tenderOrderReason,
    );
  }

  double vatCalculation(double value) {
    // VN Tax
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (double.parse(materialInfo.taxes.first) / 100));
    }

    // Non VN VAT
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        materialInfo.taxClassification.isFullTax) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    return value;
  }

  double get listPrice {
    return NumUtils.roundToPlaces(vatCalculation(price.lastPrice.getOrCrash()));
  }

  bool get isSpecialOrderTypeNotTH =>
      isSpecialOrderType && !salesOrgConfig.salesOrg.isTH;

  bool get isSpecialMaterial =>
      !materialInfo.isFOCMaterial || !materialInfo.isSampleMaterial;

  double get finalPrice {
    var finalPrice = 0.0;

    finalPrice = tenderContract.tenderPrice.tenderPrice != 0
        ? tenderContract.tenderPrice
            .tenderPriceByPricingUnit(tenderContract.pricingUnit)
        : isSpecialOrderTypeNotTH
            ? 0.0
            : (price.isDiscountEligible && !isSpecialOrderType)
                ? discountedListPrice
                : price.finalPrice.getOrDefaultValue(0);

    return NumUtils.roundToPlaces(finalPrice);
  }

  double get unitPrice {
    return NumUtils.roundToPlaces(vatCalculation(finalPrice));
  }

  double get unitPriceForTotal {
    final value = finalPrice;

    // VN Tax
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (double.parse(materialInfo.taxes.first) / 100));
    }

    // VN Tax total
    if (salesOrgConfig.enableTaxAtTotalLevelOnly &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (double.parse(materialInfo.taxes.first) / 100));
    }

    // Non VN VAT
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        materialInfo.taxClassification.isFullTax) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    // Non VN Total
    if (salesOrgConfig.enableTaxAtTotalLevelOnly &&
        !salesOrgConfig.currency.isVN) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    return value;
  }

  double get finalPriceTotal {
    return finalPrice * quantity;
  }

  double get totalVatForBundle =>
      salesOrgConfig.shouldShowTax ? salesOrgConfig.vatValue / 100 : 0.0;

  double get unitPriceTotal {
    return salesOrgConfig.enableTaxAtTotalLevelOnly
        ? unitPriceForTotal * quantity
        : unitPrice * quantity;
  }

  double get discountedListPrice => price.priceTireItem
      .firstWhere(
        (element) => discountedMaterialCount >= element.quantity,
        orElse: () => price.priceTireItem.last,
      )
      .rate;

  double getNewPrice() {
    final newPrice = materialInfo.taxClassification.isExempt
        ? price.finalPrice.getOrCrash()
        : ((price.finalPrice.getOrCrash()) /
            (1 +
                (materialInfo.taxClassification.isNoTax
                    ? salesOrgConfig.vatValue
                    : 0)));

    return newPrice;
  }

  String display(PriceType priceType) {
    if (price.isFOC) return 'FOC';
    if (price.finalPrice.isUnavailable ||
        materialInfo.hidePrice ||
        !price.isValid ||
        !price.isValidMaterial) return 'NA';

    double result;
    switch (priceType) {
      case PriceType.finalPrice:
        result = finalPrice;
        break;
      case PriceType.unitPrice:
        result =
            salesOrgConfig.enableTaxAtTotalLevelOnly ? finalPrice : unitPrice;
        break;

      case PriceType.finalPriceTotal:
        result = finalPriceTotal;
        break;
      case PriceType.unitPriceTotal:
        result = salesOrgConfig.enableTaxAtTotalLevelOnly
            ? finalPriceTotal
            : unitPriceTotal;
        break;
      case PriceType.listPrice:
      default:
        result = listPrice;
        break;
    }

    return StringUtils.displayPrice(salesOrgConfig, result);
  }

  bool get isDefaultMDEnabled {
    return salesOrgConfig.enableDefaultMD &&
        materialInfo.defaultMaterialDescription.isNotEmpty;
  }

  bool get isFromBundle => bundle != Bundle.empty();

  String get materialNumberString {
    final materialNumberFromPrice = price.materialNumber.getOrDefaultValue('');
    final materialNumberFromInfo =
        materialInfo.materialNumber.getOrDefaultValue('');

    return materialNumberFromPrice.isEmpty
        ? materialNumberFromInfo
        : materialNumberFromPrice;
  }

  MaterialNumber get getMaterialNumber => materialInfo.materialNumber;

  String get taxDetails {
    return salesOrgConfig.currency.isVN
        ? materialInfo.getTotalTax(salesOrgConfig.enableTaxDisplay)
        : materialInfo.getTaxClassification(
            salesOrgConfig.enableTaxDisplay,
            salesOrgConfig.enableTaxClassification,
          );
  }

  bool get refreshAddedBonus =>
      calculateMaterialItemBonus.length != addedDealBonusMaterial.length ||
      calculateMaterialItemBonus.any((BonusMaterial calculatedBonus) =>
          calculatedBonus.bonusQuantity !=
          addedDealBonusMaterial
              .firstWhere(
                (MaterialItemBonus availableBonus) =>
                    availableBonus.materialNumber ==
                    calculatedBonus.materialNumber,
                orElse: () => MaterialItemBonus.empty(),
              )
              .qty);

  PriceBonusItem get _bonusItem => price.priceBonusItem.firstWhere(
        (PriceBonusItem element) => quantity >= element.qualifyingQuantity,
        orElse: () => PriceBonusItem.empty(),
      );

  Iterable<MaterialItemBonus> get addedDealBonusMaterial =>
      addedBonusList.where(
        (MaterialItemBonus element) =>
            !element.additionalBonusFlag && element.bonusOverrideFlag,
      );

  List<BonusMaterial> get calculateMaterialItemBonus {
    switch (_bonusItem.calculation.getCalculationEnum) {
      case BonusMaterialCalculationEnum.calculation915:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity:
                    (quantity / _bonusItem.qualifyingQuantity).truncate() *
                        element.bonusQuantity,
              ),
            )
            .toList();
      case BonusMaterialCalculationEnum.calculation914:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity: ((quantity / _bonusItem.qualifyingQuantity) *
                        element.bonusQuantity)
                    .truncate(),
              ),
            )
            .toList();
      case BonusMaterialCalculationEnum.calculation913:
        final bonusMaterial = <MaterialNumber, BonusMaterial>{};
        price.priceBonusItem.fold<int>(quantity, (remainQty, element) {
          if (remainQty >= element.qualifyingQuantity) {
            final ratio = (remainQty / element.qualifyingQuantity).truncate();
            for (final newBonus in element.bonusMaterials) {
              bonusMaterial.update(
                newBonus.materialNumber,
                (BonusMaterial oldBonus) => oldBonus.copyWith(
                  bonusQuantity:
                      oldBonus.bonusQuantity + (newBonus.bonusQuantity * ratio),
                ),
                ifAbsent: () => newBonus.copyWith(
                  bonusQuantity: newBonus.bonusQuantity * ratio,
                ),
              );
            }

            return remainQty - (ratio * element.qualifyingQuantity);
          } else {
            return remainQty;
          }
        });
        return bonusMaterial.values.toList();

      case BonusMaterialCalculationEnum.calculation911:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity: (quantity / element.bonusRatio).truncate() *
                    element.bonusQuantity,
              ),
            )
            .toList();

      case BonusMaterialCalculationEnum.calculation912:
      default:
        return _bonusItem.bonusMaterials;
    }
  }

  List<MaterialItemBonus> get getMaterialItemBonus {
    return calculateMaterialItemBonus.map((BonusMaterial element) {
      final ratio = (quantity / element.qualifyingQuantity).floor();
      final remainingQty = quantity - (element.qualifyingQuantity * ratio);

      return MaterialItemBonus.fromBonusMaterial(element).copyWith(
        remainingQty: remainingQty,
        additionalBonusFlag: false,
        bonusOverrideFlag: true,
      );
    }).toList();
  }

  bool get isEligibleAddAdditionBonus =>
      !materialInfo.materialGroup4.isFOC &&
      !materialInfo.hidePrice &&
      (salesOrgConfig.netPriceOverride || price.additionalBonusEligible);

  bool get hasSalesRepPrincipal {
    return materialInfo.principalData.principalCode.isSubmitAllowedForSalesRep;
  }

  bool get hasClientPrincipal {
    return materialInfo.principalData.principalCode.isSubmitAllowedForClient();
  }

  bool get displayGenericMaterialName =>
      salesOrgConfig.enableGMN && materialInfo.genericMaterialName.isNotEmpty;

  bool get notHavingContract =>
      tenderContract == TenderContract.empty() ||
      tenderContract == TenderContract.noContract();

  bool get isPnGPrinciple =>
      materialInfo.principalData.principalCode.isPnGPrinciple;

  List<MaterialItemBonus> get getAddedBonusList =>
      List<MaterialItemBonus>.from(addedBonusList)
        ..sort(
          (
            MaterialItemBonus a,
            MaterialItemBonus b,
          ) =>
              a.additionalBonusFlag
                  ? 1
                  : 0.compareTo(b.additionalBonusFlag ? 0 : 1),
        );

  PriceAggregate copyWithIncreasedQty({required int qty}) => copyWith(
        quantity: quantity + qty,
      );

  List<StockInfo> get batchNumbers => List<StockInfo>.from(stockInfoList)
      .where((StockInfo element) => element.batch.isValid())
      .toList();

  bool get checkSalesCutOff {
    final salesOrgPrincipal = salesOrgConfig.checkIsPrincipalCodeForAllMaterial;
    if (salesOrgPrincipal != SalesOrganisationConfigsPrincipal.empty()) {
      return salesOrgPrincipal.date.isBefore(DateTime.now());
    }
    for (final salesOrgPrincipal in salesOrgConfig.principalList) {
      if (materialInfo.principalData.principalCode ==
          salesOrgPrincipal.principalCode) {
        return salesOrgPrincipal.date.isBefore(DateTime.now());
      }
    }

    return false;
  }
}

enum PriceType {
  listPrice,
  unitPrice,
  finalPrice,
  finalPriceTotal,
  unitPriceTotal,
}
