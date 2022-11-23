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
}

enum CartItemType { material, bundle }
