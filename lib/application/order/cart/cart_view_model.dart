import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_view_model.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required List<PriceAggregate> materials,
    required CartItemType itemType,
  }) = _CartItem;

  CartItem copyWithNewItem(PriceAggregate material) {
    final newMaterials = List<PriceAggregate>.from(materials)..add(material);

    return CartItem(materials: newMaterials, itemType: itemType);
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
    switch (itemType) {
      case CartItemType.material:
        return materials.first.listPrice;
      case CartItemType.bundle:
        return _bundleRate;
    }
  }

  double get subTotalPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        return materials.first.listPriceTotal;
      case CartItemType.bundle:
        return _bundleRate * _totalQty;
    }
  }

  double get grandTotalPrice {
    if (materials.isEmpty) return 0;
    switch (itemType) {
      case CartItemType.material:
        return materials.first.unitPriceTotal;
      case CartItemType.bundle:
        return _bundleRate * _totalQty;
    }
  }

  int get _totalQty =>
      materials.fold<int>(0, (sum, item) => sum + item.quantity);

  double get _bundleRate {
    var bundleRate = 0.0;
    for (final bundleInfo in materials.first.bundle.sortedBundleInformation) {
      if (_totalQty >= bundleInfo.quantity) {
        bundleRate = bundleInfo.type.isPercent() ? bundleInfo.rate * -1 : bundleInfo.rate;
      }
    }

    return bundleRate;
  }
}

enum CartItemType { material, bundle }
