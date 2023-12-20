import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_item_bonus_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

part 'price_aggregate.freezed.dart';
part 'price_aggregate_extension.dart';

@freezed
class PriceAggregate with _$PriceAggregate {
  const PriceAggregate._();

  const factory PriceAggregate({
    required Price price,
    required MaterialInfo materialInfo,
    required Bundle bundle,
    required EZReachBanner banner,
    required SalesOrganisationConfigs salesOrgConfig,
    required int quantity,
    @Default(0) int discountedMaterialCount,
    @Default(false) bool exceedQuantity,
    required StockInfo stockInfo,
    required TenderContract tenderContract,
    required ComboDeal comboDeal,
    @Default(false) bool isSpecialOrderType,
    @Default(<StockInfo>[]) List<StockInfo> stockInfoList,
    required List<BonusSampleItem> bonusSampleItems,
    required List<ComboMaterialItem> comboMaterials,
    required int maximumQty,
  }) = _PriceAggregate;

  factory PriceAggregate.empty() => PriceAggregate(
        price: Price.empty(),
        banner: EZReachBanner.empty(),
        materialInfo: MaterialInfo.empty(),
        bundle: Bundle.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        quantity: 1,
        discountedMaterialCount: 0,
        stockInfo: StockInfo.empty(),
        tenderContract: TenderContract.empty(),
        comboDeal: ComboDeal.empty(),
        bonusSampleItems: <BonusSampleItem>[],
        comboMaterials: <ComboMaterialItem>[],
        maximumQty: 0,
      );

  PriceAggregate get toCartProduct {
    var cartProduct = PriceAggregate.empty();
    if (materialInfo.type.typeBundle) {
      cartProduct = cartProduct.copyWith(
        materialInfo: materialInfo,
        bundle: bundle,
        salesOrgConfig: salesOrgConfig,
      );
    }
    if (materialInfo.type.typeMaterial) {
      cartProduct = cartProduct.copyWith(
        materialInfo: materialInfo,
        quantity: materialInfo.quantity.intValue,
        salesOrgConfig: salesOrgConfig,
        bonusSampleItems: bonusSampleItems,
      );
    }
    if (materialInfo.type.typeCombo) {
      cartProduct = cartProduct.copyWith(
        materialInfo: materialInfo,
        salesOrgConfig: salesOrgConfig,
        comboMaterials: comboMaterials,
      );
    }

    return cartProduct;
  }

  bool get _isStockQtyExceedsForId =>
      stockQuantity < quantity && stockQuantity != 0;

  bool get isMaxQtyExceedsForId =>
      maximumQty != 0 && maximumQty < quantity && stockQuantity >= quantity;

  bool get showErrorMessage =>
      salesOrgConfig.salesOrg.isID &&
      (_isStockQtyExceedsForId || isMaxQtyExceedsForId);

  List<MaterialInfo> get toStockListMaterials {
    final materialsInfo = <MaterialInfo>[];
    if (materialInfo.type.typeBundle) {
      materialsInfo.addAll(bundle.materials);
    }
    if (materialInfo.type.typeMaterial) {
      materialsInfo.add(materialInfo);
    }
    if (materialInfo.type.typeCombo) {
      materialsInfo.addAll(
        comboMaterials.map(
          (e) => MaterialInfo.empty().copyWith(materialNumber: e.productId),
        ),
      );
    }

    return materialsInfo;
  }

  SubmitMaterialInfo toSubmitMaterialInfo() {
    return SubmitMaterialInfo(
      batch:
          salesOrgConfig.enableBatchNumber ? stockInfo.batch : BatchNumber(''),
      bonuses: bonuses,
      comment: materialInfo.remarks,
      materialNumber: materialInfo.materialNumber,
      quantity: quantity,
      materialItemOverride:
          MaterialItemOverrideDto.fromPriceAggregate(this).toDomain(),
      price: materialInfo.type.typeBundle
          ? bundle.currentBundleInfo.rate
          : finalPrice,
      productType: materialInfo.type.getValue().toUpperCase(),
      parentID: materialInfo.type.typeBundle
          ? bundle.bundleCode
          : materialInfo.parentID,
      mrp: price.finalPrice.getValue() + individualItemTax,
      tax: salesOrgConfig.salesOrg.isID ? materialInfo.tax : individualItemTax,
      promoStatus: promoStatus,
      promoType: materialInfo.promoType,
      principalData: materialInfo.principalData,
    );
  }

  double vatCalculation(double value) {
    // VN Tax
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (materialInfo.tax / 100));
    }

    // Non VN VAT
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        materialInfo.taxClassification.isFullTax) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    }

    return value;
  }

  bool get promoStatus =>
      materialInfo.promoStatus ||
      price.tiers.isNotEmpty ||
      price.bonuses.isNotEmpty;

  bool get showStrikeThrough => !salesOrgConfig.salesOrg.isID;

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
        ? tenderContract.tenderPriceByPricingUnit
        : isSpecialOrderTypeNotTH
            ? 0.0
            : (price.isDiscountEligible && !isSpecialOrderType)
                ? discountedListPrice
                : price.finalPrice.getOrDefaultValue(0);

    return NumUtils.roundToPlaces(finalPrice);
  }

  double getComboOfferPriceWithDiscount({double comboDealRate = 0}) {
    var comboOfferPrice = 0.0;

    comboOfferPrice = comboDealRate != 0
        ? listPrice - NumUtils.roundToPlaces((listPrice * comboDealRate / 100))
        : listPrice;

    return NumUtils.roundToPlaces(comboOfferPrice);
  }

  double get unitPrice {
    return NumUtils.roundToPlaces(vatCalculation(finalPrice));
  }

  int get totalComboQuantity {
    final scheme = comboMaterials.firstOrNull?.getScheme(comboMaterials) ??
        ComboDealScheme.k1;
    if (scheme == ComboDealScheme.k3) {
      return comboMaterials.length;
    }

    return comboMaterials.fold(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );
  }

  double get comboOriginalSubTotal {
    var comboOriginalTotal = 0.0;

    comboOriginalTotal = comboMaterials.fold(
      0,
      (previousValue, element) => previousValue + element.originalSubTotal,
    );

    return NumUtils.roundToPlaces(comboOriginalTotal);
  }

  double get comboSubTotalExclTax {
    var comboSubTotalExclTax = 0.0;

    comboSubTotalExclTax = comboMaterials.fold(
      0,
      (previousValue, element) => previousValue + element.discountedSubTotal,
    );

    return NumUtils.roundToPlaces(comboSubTotalExclTax);
  }

  double get unitPriceForTotal {
    final value = finalPrice;

    // VN Tax
    if (salesOrgConfig.enableVat &&
        salesOrgConfig.enableTaxClassification &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (materialInfo.tax / 100));
    }

    // VN Tax total
    if (salesOrgConfig.enableTaxAtTotalLevelOnly &&
        salesOrgConfig.currency.isVN) {
      return value + (value * (materialInfo.tax / 100));
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

  double get listPriceTotal {
    return listPrice * quantity;
  }

  double get finalPriceTotal {
    return finalPrice * quantity;
  }

  double get savingAmount =>
      (price.lastPrice.getOrDefaultValue(0) -
          price.finalPrice.getOrDefaultValue(0)) *
      quantity;

  double getComboOfferPriceSubTotal(double comboDealRate) {
    return getComboOfferPriceWithDiscount(comboDealRate: comboDealRate) *
        quantity;
  }

  String get finalPriceTotalForAllMaterial {
    return materialInfo.isFOCMaterial
        ? 'Price not available'
        : display(PriceType.finalPriceTotal);
  }

  double get finalPriceTotalWithTax => finalPriceTotal + itemTax;

  double get itemTaxPercent {
    if (!salesOrgConfig.displayItemTaxBreakdown ||
        !materialInfo.taxClassification.isFullTax) {
      return 0.0;
    }
    final salesOrg = salesOrgConfig.salesOrg;

    if (salesOrg.isID) {
      return salesOrg.orderTaxValue.toDouble();
    }
    if (salesOrg.isVN) {
      return materialInfo.tax;
    }

    return salesOrgConfig.vatValue.toDouble();
  }

  String get itemTaxPercentPadded =>
      itemTaxPercent.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

  double get itemTax {
    return (finalPriceTotal * itemTaxPercent) / 100;
  }

  double get individualItemTax => (finalPrice * itemTaxPercent) / 100;

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

  double getNewPrice() => materialInfo.taxClassification.isExempt
      ? price.finalPrice.getOrCrash()
      : ((price.finalPrice.getOrCrash()) /
          (1 +
              (materialInfo.taxClassification.isNoTax
                  ? salesOrgConfig.vatValue
                  : 0)));

  String get displayZdp5Price {
    return price.priceTireItem
        .firstWhere(
          (element) => materialInfo.quantity.intValue >= element.quantity,
          orElse: () => PriceTierItem.empty(),
        )
        .rate
        .toString();
  }

  String display(PriceType priceType) {
    /**
     * TODO: Need to revisit while implementing special Order case if needed or else will remove it was for displaying FOC tag for FOC materials
    / */
    if (price.isFOC) return 'FOC';
    if (invalidPrice ||
        price.finalPrice.isUnavailable ||
        !price.isValid ||
        !price.isValidMaterial) return 'Price Not Available';

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
      case PriceType.listPriceTotal:
        result = listPriceTotal;
        break;
      case PriceType.listPrice:
      default:
        result = listPrice;
        break;
    }

    return result.toString();
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
      calculateMaterialItemBonus.length != bonusSampleItems.length ||
      calculateMaterialItemBonus.any(
        (BonusMaterial calculatedBonus) =>
            calculatedBonus.bonusQuantity !=
            bonusSampleItems
                .firstWhere(
                  (availableBonus) =>
                      availableBonus.materialNumber ==
                      calculatedBonus.materialNumber,
                  orElse: () => BonusSampleItem.empty(),
                )
                .qty
                .intValue,
      );

  PriceBonusItem get _bonusItem => price.priceBonusItem.firstWhere(
        (PriceBonusItem element) => quantity >= element.qualifyingQuantity,
        orElse: () => PriceBonusItem.empty(),
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
      case BonusMaterialCalculationEnum.apl001:
      case BonusMaterialCalculationEnum.apl002:
        return _bonusItem.bonusMaterials
            .map(
              (BonusMaterial element) => element.copyWith(
                bonusQuantity: (quantity / element.bonusRatio).truncate() *
                    element.bonusQuantity,
              ),
            )
            .toList();

      case BonusMaterialCalculationEnum.calculation912:
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

  List<MaterialInfo> get existingProductDealBonus => bonusSampleItems
      .where(
        (element) => element.type.typeDealBonus,
      )
      .map(
        (e) => MaterialInfo.empty().copyWith(
          materialNumber: e.materialNumber,
          quantity: e.qty,
          type: e.type,
          parentID: materialInfo.materialNumber.getValue(),
          sampleBonusItemId: e.itemId.getValue(),
        ),
      )
      .toList();

  List<MaterialInfo> get dealBonusList {
    final inValidDeal =
        existingProductDealBonus.isNotEmpty && getMaterialItemBonus.isEmpty;

    final existingBonus = existingProductDealBonus.firstWhere(
      (element) => element.quantity.isValid(),
      orElse: () => MaterialInfo.empty(),
    );

    final applicableBonus = _applicableProductDealBonus.firstWhere(
      (element) => element.quantity.isValid(),
      orElse: () => MaterialInfo.empty(),
    );

    if (existingBonus.quantity == applicableBonus.quantity) {
      return <MaterialInfo>[];
    }

    return inValidDeal
        ? existingProductDealBonus
            .map((e) => e.copyWith(quantity: MaterialQty(0)))
            .toList()
        : _applicableProductDealBonus;
  }

  List<MaterialInfo> get _applicableProductDealBonus => getMaterialItemBonus
      .map(
        (e) => e.materialInfo.copyWith(
          quantity: MaterialQty(e.qty),
          type: MaterialInfoType('Deals'),
          parentID: materialInfo.materialNumber.getValue(),
          sampleBonusItemId: existingProductDealBonus
              .firstWhere(
                (element) => element.materialNumber == e.materialNumber,
                orElse: () => MaterialInfo.empty(),
              )
              .sampleBonusItemId,
        ),
      )
      .toList();

  PriceAggregate copyWithPrice({
    required Price newPrice,
    required bool exceedQty,
  }) =>
      copyWith(
        price: newPrice,
        exceedQuantity: exceedQty,
      );

  bool get isEligibleAddAdditionBonus =>
      !materialInfo.materialGroup4.isFOC &&
      !materialInfo.hidePrice &&
      (salesOrgConfig.netPriceOverride || price.additionalBonusEligible);

  bool get hasSalesRepPrincipal =>
      materialInfo.principalData.principalCode.salesRepSubmitAllowed;

  bool get hasClientPrincipal =>
      materialInfo.principalData.principalCode.clientSubmitAllowed;

  bool get displayGenericMaterialName =>
      salesOrgConfig.enableGMN && materialInfo.genericMaterialName.isNotEmpty;

  bool get notHavingContract =>
      tenderContract == TenderContract.empty() ||
      tenderContract == TenderContract.noContract();

  bool get isPnGPrinciple => materialInfo.principalData.principalCode.isPnG;

  PriceAggregate copyWithIncreasedQty({required int qty}) => copyWith(
        quantity: quantity + qty,
      );

  List<StockInfo> get batchNumbers => List<StockInfo>.from(stockInfoList)
      .where((StockInfo element) => element.batch.isValid())
      .toList();

  bool get checkSalesCutOff {
    final salesOrgPrincipal = salesOrgConfig.checkIsPrincipalCodeForAllMaterial;
    if (salesOrgPrincipal != SalesOrganisationConfigsPrincipal.empty()) {
      return salesOrgPrincipal.date.dateTime.isBefore(DateTime.now());
    }
    for (final salesOrgPrincipal in salesOrgConfig.principalList) {
      if (materialInfo.principalData.principalCode ==
          salesOrgPrincipal.principalCode) {
        return salesOrgPrincipal.date.dateTime.isBefore(DateTime.now());
      }
    }

    return false;
  }

  MaterialQty totalCartProductBonusQty(
    StringValue bonusItemId,
    MaterialQty qty,
  ) {
    final totalQuantity = bonusSampleItems
            .firstWhere(
              (element) => element.itemId == bonusItemId,
              orElse: () => BonusSampleItem.empty(),
            )
            .qty
            .intValue +
        qty.intValue;

    return MaterialQty(totalQuantity);
  }

  StringValue bonusMaterialItemId(MaterialNumber bonusMatNumber) =>
      bonusSampleItems
          .firstWhere(
            (element) => element.materialNumber == bonusMatNumber,
            orElse: () => BonusSampleItem.empty(),
          )
          .itemId;

  bool get isZdp5DiscountEligible =>
      salesOrgConfig.salesOrg.isVN && salesOrgConfig.enableZDP5;

  bool get hasZdp5Validation =>
      isZdp5DiscountEligible && quantity > price.zdp5RemainingQuota.intValue;

  bool get isRemainingQuantityExceeded =>
      !exceedQuantity && quantity > price.zdp5RemainingQuota.intValue;

  bool get isRemainingQuantityNotExceeded =>
      exceedQuantity && quantity <= price.zdp5RemainingQuota.intValue;

  bool get hasRemainingQuotaReached =>
      isRemainingQuantityNotExceeded || isRemainingQuantityExceeded;

  bool get isPriceUpdateAvailable =>
      isZdp5DiscountEligible && hasRemainingQuotaReached;

  bool get isPreOrder =>
      !inStock &&
      salesOrgConfig.addOosMaterials.getOrDefaultValue(false) &&
      !salesOrgConfig.hideStockDisplay;

  StatusType productTag(bool isUserValidToProcess) =>
      !stockInfoList.any((e) => e.inStock.isMaterialInStock)
          ? isUserValidToProcess
              ? StatusType(salesOrgConfig.addOosMaterials.oosMaterialTag)
              : StatusType(salesOrgConfig.addOosMaterials.oosTag)
          : StatusType('');

  bool get inStock =>
      stockInfoList.any((element) => element.inStock.isMaterialInStock);

  bool get isOOSProduct =>
      !inStock && !salesOrgConfig.addOosMaterials.getOrDefaultValue(true);

  // getter to check if there is any item present in cart which is out of stock
  bool get isAnyOOSItemPresentInCart {
    if (materialInfo.type.typeBundle) {
      return anyBundleOos;
    } else if (materialInfo.type.typeCombo) {
      return anyComboOos;
    } else {
      return anyMaterialOos;
    }
  }

  bool get anyBundleOos {
    return bundle.materials.any(
      (material) => isMaterialOutOfStock(material.stockInfos),
    );
  }

  bool get anyComboOos {
    return comboMaterials.any(
      (material) => isMaterialOutOfStock(material.materialInfo.stockInfos),
    );
  }

  bool get anyMaterialOos {
    return isMaterialOutOfStock(stockInfoList);
  }

  bool isMaterialOutOfStock(List<StockInfo> stockInfos) {
    return stockInfos.isEmpty ||
        stockInfos.any((stock) => !stock.inStock.isMaterialInStock);
  }

  List<PriceAggregate> get bundleMaterialsPriceAggregate => bundle.materials
      .map(
        (e) => PriceAggregate.empty().copyWith(
          materialInfo: e,
          stockInfoList: e.stockInfos,
          quantity: e.quantity.intValue,
          salesOrgConfig: salesOrgConfig,
        ),
      )
      .toList();

  List<BonusSampleItem> getNewlyAddedItems(List<BonusSampleItem> oldBonusList) {
    final oldOverrideBonusIds = oldBonusList
        .where((element) => !element.type.typeDealBonus)
        .map((e) => e.itemId)
        .toSet();

    return bonusSampleItems
        .where((element) => !element.type.typeDealBonus)
        .where((e) => !oldOverrideBonusIds.contains(e.itemId))
        .toList();
  }

  bool get showTaxBreakDown =>
      salesOrgConfig.displayItemTaxBreakdown && !materialInfo.hidePrice;

  List<MaterialInfo> get convertedSampleBonusList {
    return bonusSampleItems
        .where((element) => !element.type.typeDealBonus)
        .map(
          (e) => MaterialInfo.empty().copyWith(
            materialNumber: e.materialNumber,
            parentID: materialInfo.materialNumber.getValue(),
            quantity: MaterialQty(0),
            sampleBonusItemId: bonusMaterialItemId(e.materialNumber).getValue(),
          ),
        )
        .toList();
  }

  List<SubmitMaterialItemBonus> get bonuses => bonusSampleItems
      .map(
        (e) => SubmitMaterialItemBonusDto.fromBonusOvveride(e).toDomain(),
      )
      .toList();

  bool get invalidPrice =>
      price.finalPrice.isEmpty ||
      materialInfo.hidePrice ||
      materialInfo.isFOCMaterial;

  bool get displayCutOffListPrice =>
      (price.isCounterOfferRequested && !materialInfo.hidePrice) ||
      (price.zdp5MaxQuota.isValidValue &&
          price.zdp5RemainingQuota.isValidValue &&
          materialInfo.quantity.intValue >= 2) ||
      showMaterialListPrice;

  int get stockQuantity => stockInfoList
      .firstWhere(
        (element) => element.materialNumber == materialInfo.materialNumber,
        orElse: () => StockInfo.empty(),
      )
      .stockQuantity;

  bool get zdp5PriceDisplay =>
      price.priceTireItem.isNotEmpty &&
      price.zdp5MaxQuota.isValidValue &&
      materialInfo.quantity.intValue >= 2;

  int get getTotalQuantityOfBundleProduct => bundle.materials.fold(
        0,
        (previousValue, element) => (previousValue) + element.quantity.intValue,
      );

  bool get isBundleMinimumQuantitySatisfies =>
      getTotalQuantityOfBundleProduct >=
      bundle.minimumQuantityBundleMaterial.quantity;

  bool get showMaterialListPrice {
    final regex = RegExp(r'[a-zA-Z]');
    final listPrice = display(PriceType.listPrice);
    final finalPrice = display(PriceType.finalPrice);

    return !(regex.hasMatch(listPrice) || regex.hasMatch(finalPrice)) &&
        double.parse(listPrice) > double.parse(finalPrice);
  }

  List<MaterialInfo> get bonusListToMaterialInfo => bonusSampleItems
      .map(
        (e) => MaterialInfo.empty().copyWith(
          materialNumber: e.materialNumber,
          quantity: e.qty,
        ),
      )
      .toList();

  List<BonusSampleItem> get sortedBonusList =>
      List<BonusSampleItem>.from(bonusSampleItems)
        ..sort(
          (a, b) => a.itemId
              .getOrDefaultValue('')
              .compareTo(b.itemId.getOrDefaultValue('')),
        );
}

enum PriceType {
  listPrice,
  unitPrice,
  finalPrice,
  finalPriceTotal,
  unitPriceTotal,
  listPriceTotal,
}
