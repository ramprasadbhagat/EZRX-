import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

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

  factory CartItem.materialFromOrder({
    required Map<MaterialQueryInfo, MaterialPriceDetail> priceDetailMap,
    required MaterialItem material,
    required SalesOrganisationConfigs salesConfigs,
  }) {
    final itemInfo =
        priceDetailMap[material.queryInfo] ?? MaterialPriceDetail.empty();

    return CartItem.material(
      PriceAggregate(
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
        tenderContract: material.tenderContract,
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
    );

    return CartItem.bundle(validMaterials.map(
      (material) {
        final priceDetail =
            priceDetailMap[material.queryInfo] ?? MaterialPriceDetail.empty();

        return PriceAggregate(
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
        );
      },
    ).toList());
  }

  CartItem copyWithStockInfo({
    required Map<MaterialNumber, StockInfo> stockInfoMap,
  }) =>
      copyWith(
        materials: materials.map((material) {
          final stockInfo = stockInfoMap[material.getMaterialNumber];
          if (stockInfo != null) {
            return material.copyWith(stockInfo: stockInfo);
          }

          return material;
        }).toList(),
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

  CartItem get copyWithSelectSwitched => copyWith(isSelected: !isSelected);

  String get id {
    if (materials.isEmpty) return '';
    switch (itemType) {
      case CartItemType.material:
        return materials.first.materialNumberString;
      case CartItemType.bundle:
        return materials.first.bundle.bundleCode;
    }
  }

  double get unitPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        return materials.first.unitPrice;
      case CartItemType.bundle:
        return _bundleRate;
    }
  }

  double get listPrice {
    if (materials.isEmpty) return 0;

    return materials.first.listPrice;
  }

  double get subTotalPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        return materials.first.finalPriceTotal;
      case CartItemType.bundle:
        return _bundleRate * totalQty;
    }
  }

  double get grandTotalPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        return materials.first.unitPriceTotal;
      case CartItemType.bundle:
        return _bundleRate * totalQty;
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
          .where((e) =>
              e.price.zmgDiscount && e.materialInfo.materialGroup2 == group2)
          .fold(0, (sum, e) => sum + e.quantity);

  List<PriceAggregate> get allMaterials =>
      map((item) => item.materials).flattened.toList();
}
