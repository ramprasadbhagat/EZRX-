import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/discount_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

//We don't need this anymore so we need a ticket for delete the file and it's usages
@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required List<PriceAggregate> materials,
    required CartItemType itemType,
    @Default(true) bool isSelected,
  }) = _CartItem;

  factory CartItem.material(PriceAggregate material) => CartItem(
        materials: [material],
        itemType: CartItemType.material,
      );

  factory CartItem.materialEmpty() => CartItem.material(
        PriceAggregate.empty(),
      );

  factory CartItem.bundle(List<PriceAggregate> materials) => CartItem(
        materials: materials,
        itemType: CartItemType.bundle,
      );

  factory CartItem.comboDeal(
    List<PriceAggregate> materials,
  ) =>
      CartItem(
        materials: materials,
        itemType: CartItemType.comboDeal,
      );

  factory CartItem.materialFromOrder({
    required Map<MaterialQueryInfo, MaterialPriceDetail> priceDetailMap,
    required Map<MaterialNumber, List<TenderContract>> tenderContractMap,
    required MaterialItem material,
    required SalesOrganisationConfigs salesConfigs,
  }) {
    final itemInfo =
        priceDetailMap[material.queryInfo] ?? MaterialPriceDetail.empty();
    final tenderContractList = tenderContractMap[material.materialNumber] ?? [];

    return CartItem.material(
      PriceAggregate(
        banner: material.banner,
        price: itemInfo.price.copyWith(
          isPriceOverride: material.overridenPrice.isValid(),
          zdp8Override: material.zdp8Override,
          priceOverride: material.overridenPrice,
        ),
        materialInfo: itemInfo.info,
        bundle: Bundle.empty(),
        salesOrgConfig: salesConfigs,
        quantity: material.qty,
        discountedMaterialCount: 0,
        addedBonusList: material.bonuses,
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: itemInfo.info.materialNumber,
        ),
        comboDeal: ComboDeal.empty(),
        tenderContract: itemInfo.info.hasValidTenderContract
            ? tenderContractList.withNoContractItem.getDefaultSelected(
                currentTenderContract: material.tenderContract,
              )
            : TenderContract.empty(),
        bonusSampleItems: <BonusSampleItem>[],
      ),
    );
  }

  factory CartItem.bundleFromOrder({
    required Map<MaterialQueryInfo, MaterialPriceDetail> priceDetailMap,
    required MaterialItem savedItem,
    required SalesOrganisationConfigs salesConfigs,
  }) {
    final validMaterials = savedItem.materials.where((item) {
      final itemDetails = priceDetailMap[item.queryInfo];

      return itemDetails != null && itemDetails.price.isValidMaterial;
    }).toList();

    final bundle = Bundle(
      bundleName: BundleName(savedItem.bundleName),
      bundleCode: savedItem.bundleCode,
      bundleInformation: savedItem.bundleInformation,
      materials: validMaterials,
      conditions: '',
      bonusEligible: false,
    );

    return CartItem.bundle(
      validMaterials.map(
        (material) {
          final priceDetail =
              priceDetailMap[material.queryInfo] ?? MaterialPriceDetail.empty();

          return PriceAggregate(
            banner: BannerItem.empty(),
            price: priceDetail.price,
            materialInfo: priceDetail.info,
            bundle: bundle,
            salesOrgConfig: salesConfigs,
            quantity: material.quantity,
            discountedMaterialCount: 0,
            addedBonusList: savedItem.bonuses,
            stockInfo: StockInfo.empty().copyWith(
              materialNumber: priceDetail.info.materialNumber,
            ),
            tenderContract: savedItem.tenderContract,
            comboDeal: ComboDeal.empty(),
            bonusSampleItems: <BonusSampleItem>[],
          );
        },
      ).toList(),
    );
  }

  CartItem copyWithStockInfo({
    required Map<MaterialNumber, List<StockInfo>> stockInfoMap,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) =>
      copyWith(
        materials: materials.map((material) {
          final stockInfoList = stockInfoMap[material.getMaterialNumber] ?? [];
          final stockInfo = stockInfoList.isEmpty
              ? StockInfo.empty()
              : stockInfoList.firstWhere(
                  (element) =>
                      element.materialNumber ==
                      material.materialInfo.materialNumber,
                  orElse: () => StockInfo.empty(),
                );

          return material.copyWith(
            stockInfo: stockInfo,
            stockInfoList: stockInfoList,
            salesOrgConfig: salesOrganisationConfigs,
          );
        }).toList(),
      );

  CartItem copyWithPrice({
    required Price newPrice,
    required bool exceedQty,
  }) =>
      copyWith(
        materials: materials
            .map(
              (material) => material.copyWith(
                price: newPrice,
                exceedQuantity: exceedQty,
              ),
            )
            .toList(),
      );

  CartItem copyWithBatch({
    required StockInfo stockInfo,
  }) =>
      copyWith(
        materials: materials
            .map(
              (material) => material.copyWith(
                stockInfo: stockInfo,
              ),
            )
            .toList(),
      );

  CartItem copyWithInStockOnly({required bool allowOutOfStock}) => copyWith(
        materials: materials
            .where(
              (material) =>
                  material.stockInfo.inStock.isMaterialInStock ||
                  allowOutOfStock,
            )
            .toList(),
      );

  CartItem commercialToSpecial({required Price price}) => copyWith(
        materials: materials
            .map(
              (e) => e.copyWith(
                price: price,
                addedBonusList: [],
                isSpecialOrderType: true,
              ),
            )
            .toList(),
      );

  CartItem get copyWithSelectSwitched => copyWith(isSelected: !isSelected);

  String get id {
    if (materials.isEmpty) return '';
    switch (itemType) {
      case CartItemType.material:
        return materials.first.materialNumberString;
      case CartItemType.bundle:
        return materials.first.bundle.bundleCode;
      case CartItemType.comboDeal:
        return materials.first.comboDealId;
    }
  }

  double get unitPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        return materials.first.unitPrice;
      case CartItemType.bundle:
        return _bundleRate;
      case CartItemType.comboDeal:
        return _comboDealDiscountTotal;
    }
  }

  double get listPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
      case CartItemType.bundle:
        return materials.first.unitPrice;
      case CartItemType.comboDeal:
        return _comboDealTotal;
    }
  }

  double subTotalPrice({
    bool isSpecialOrderType = false,
    bool isMYMarketSalesRep = false,
  }) {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        final material = materials.first;
        final isPnG = isMYMarketSalesRep && material.materialInfo.hidePrice;

        return (isSpecialOrderType || isPnG) ? 0 : material.finalPriceTotal;
      case CartItemType.bundle:
        return _bundleRate * totalQty;
      case CartItemType.comboDeal:
        return _comboDealDiscountTotal;
    }
  }

  double grandTotalPrice({
    bool isSpecialOrderType = false,
    bool isMYMarketSalesRep = false,
  }) {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        final material = materials.first;
        final isPnG = isMYMarketSalesRep && material.materialInfo.hidePrice;

        return (isSpecialOrderType || isPnG) ? 0 : material.unitPriceTotal;
      case CartItemType.bundle:
        var totalWithoutVat = _bundleRate * totalQty;
        totalWithoutVat += materials.first.totalVatForBundle * totalWithoutVat;
        return totalWithoutVat;
      case CartItemType.comboDeal:
        return _comboDealDiscountTotal;
    }
  }

  int get totalQty =>
      materials.fold<int>(0, (sum, item) => sum + item.quantity);

  double get _bundleRate {
    var bundleRate = 0.0;
    for (final bundleInfo in materials.first.bundle.sortedBundleInformation) {
      if (totalQty >= bundleInfo.quantity) {
        bundleRate = bundleInfo.rate;
      }
    }

    return bundleRate;
  }

  DiscountInfo? comboDealRate({
    required PriceAggregate material,
  }) {
    final comboDeal = materials.firstComboDeal;
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return null;
      case ComboDealScheme.k2:
        return comboDeal.groupDeal != ComboDealGroupDeal.empty()
            ? comboDeal.groupDeal.discountInfo
            : eligibleComboDealQtyTier.discountInfo;
      case ComboDealScheme.k3:
        return eligibleComboDealSKUTier.discountInfo;
      case ComboDealScheme.k4:
        return eligibleComboDealQtyTier.discountInfo;
      case ComboDealScheme.k5:
        return eligibleComboDealTierRule.discountInfo;
      case ComboDealScheme.kWithSuffix:
        final selectedSuffix = comboDeal.selectedSuffix(
          material: material,
          eligibleComboDealQtyTier: eligibleComboDealQtyTier,
        );
        return selectedSuffix.discountInfo;
    }
  }

  double get _comboDealTotal => materials.fold<double>(
        0,
        (sum, item) => sum + item.comboDealTotalListPrice,
      );

  double get _comboDealDiscountTotal => materials.fold<double>(
        0,
        (sum, item) =>
            sum +
            item.comboDealTotalUnitPrice(
              discount: comboDealRate(material: item),
            ),
      );

  bool get isComboDealEligible {
    final comboDeal = materials.firstComboDeal;

    if (materials.any((item) => !item.selfComboDealEligible)) return false;

    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return true;
      case ComboDealScheme.k2:
        return comboDeal.groupDeal != ComboDealGroupDeal.empty()
            ? comboDeal.materialComboDeals.every(
                (setItem) {
                  final totalSetQty = materials
                      .where(
                        (material) => setItem.materialNumbers
                            .contains(material.getMaterialNumber),
                      )
                      .fold<int>(0, (sum, item) => sum + item.quantity);

                  return totalSetQty != 0;
                },
              )
            : eligibleComboDealQtyTier != ComboDealQtyTier.empty();

      case ComboDealScheme.k3:
        return eligibleComboDealSKUTier != ComboDealSKUTier.empty();
      case ComboDealScheme.k4:
      case ComboDealScheme.kWithSuffix:
        return eligibleComboDealQtyTier != ComboDealQtyTier.empty();
      case ComboDealScheme.k5:
        return eligibleComboDealTierRule != ComboDealTierRule.empty();
    }
  }

  ComboDealQtyTier get eligibleComboDealQtyTier {
    if (materials.isEmpty) return ComboDealQtyTier.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedQtyTiers.firstWhere(
      (tier) => totalQty >= tier.minQty,
      orElse: () => ComboDealQtyTier.empty(),
    );
  }

  ComboDealTierRule get eligibleComboDealTierRule {
    if (materials.isEmpty) return ComboDealTierRule.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedMinAmountTiers.firstWhere(
      (tier) => tier.minTotalAmount <= _comboDealTotal,
      orElse: () => ComboDealTierRule.empty(),
    );
  }

  ComboDealSKUTier get eligibleComboDealSKUTier {
    if (materials.isEmpty) return ComboDealSKUTier.empty();
    final comboDeal = materials.first.comboDeal;

    return comboDeal.descendingSortedSKUTier.firstWhere(
      (tier) => materials.length >= tier.minQty,
      orElse: () => ComboDealSKUTier.empty(),
    );
  }

  List<MaterialItem> toSavedOrderMaterial() {
    final saveOrderItems = <MaterialItem>[];

    if (itemType == CartItemType.bundle) {
      final bundleItems = materials
          .map(
            (cartItemData) => cartItemData.materialInfo.copyWith(
              quantity: cartItemData.quantity,
            ),
          )
          .toList();

      if (bundleItems.isNotEmpty) {
        saveOrderItems.add(
          MaterialItem.empty().copyWith(
            bundleName: materials.first.bundle.bundleName.getValue(),
            bundleCode: materials.first.bundle.bundleCode,
            bundleInformation: materials.first.bundle.bundleInformation,
            totalQuantity: totalQty,
            materials: bundleItems,
            type: MaterialItemType('Bundle'),
          ),
        );
      }
    } else {
      saveOrderItems.addAll(
        materials
            .map((cartItemData) => cartItemData.toSavedOrderMaterial())
            .toList(),
      );
    }

    return saveOrderItems;
  }
}

@HiveType(typeId: 22)
enum CartItemType {
  @HiveField(0)
  material,
  @HiveField(1)
  bundle,
  @HiveField(3)
  comboDeal,
}

extension CartItemListExtension on List<CartItem> {
  bool allOutOfStock({
    required bool allowOutOfStock,
  }) =>
      _inStockOnly(
        allowOutOfStock: allowOutOfStock,
      ).allMaterials.isEmpty;

  List<CartItem> _inStockOnly({
    required bool allowOutOfStock,
  }) =>
      map(
        (item) => item.copyWithInStockOnly(
          allowOutOfStock: allowOutOfStock,
        ),
      ).toList();

  int zmgMaterialsQty(MaterialGroup group2) =>
      where((e) => e.itemType == CartItemType.material)
          .toList()
          .allMaterials
          .where(
            (e) =>
                e.price.zmgDiscount && e.materialInfo.materialGroup2 == group2,
          )
          .fold(0, (sum, e) => sum + e.quantity);

  List<PriceAggregate> get allMaterials =>
      map((item) => item.materials).flattened.toList();

  List<PriceAggregate> get validMaterials =>
      allMaterials.where((e) => e.quantity > 0).toList();
}
