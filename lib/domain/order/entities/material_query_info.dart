import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_query_info.freezed.dart';

@freezed
class MaterialQueryInfo with _$MaterialQueryInfo {
  const MaterialQueryInfo._();
  const factory MaterialQueryInfo({
    required MaterialNumber value,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required MaterialQty qty,
  }) = _MaterialQueryInfo;

  factory MaterialQueryInfo.fromSavedOrder({
    required MaterialItem orderMaterial,
  }) =>
      MaterialQueryInfo(
        qty: MaterialQty(orderMaterial.qty),
        value: orderMaterial.materialNumber,
        materialGroup2: orderMaterial.materialGroup2,
        materialGroup4: orderMaterial.materialGroup4,
      );

  factory MaterialQueryInfo.fromOrderTemplate({
    required CartItem orderMaterial,
  }) =>
      MaterialQueryInfo(
        qty: MaterialQty(orderMaterial.materialQuantity),
        value: orderMaterial.materialNumber,
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
      );

  factory MaterialQueryInfo.empty() => MaterialQueryInfo(
        value: MaterialNumber(''),
        qty: MaterialQty(0),
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
      );
}
