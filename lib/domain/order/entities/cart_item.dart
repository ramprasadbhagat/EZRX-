import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required MaterialInfo materialInfo,
    required int quantity,
  }) = _CartItem;

  factory CartItem.empty() => CartItem(
        materialInfo: MaterialInfo.empty(),
        quantity: 0,
      );
}
