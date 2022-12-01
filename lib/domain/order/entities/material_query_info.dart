import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order_material.dart';
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
    required SavedOrderMaterial orderMaterial,
  }) =>
      MaterialQueryInfo(
        qty: MaterialQty(orderMaterial.qty),
        value: orderMaterial.materialNumber,
        materialGroup2: orderMaterial.materialGroup2,
        materialGroup4: orderMaterial.materialGroup4,
      );

  factory MaterialQueryInfo.fromOrderTemplate({
    required OrderTemplateMaterial orderMaterial,
  }) =>
      MaterialQueryInfo(
        qty: MaterialQty(orderMaterial.qty),
        value: orderMaterial.materialNumber,
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
      );

  factory MaterialQueryInfo.fromFavorite({
    required Favourite material,
  }) =>
      MaterialQueryInfo(
        qty: MaterialQty(1),
        value: material.materialNumber,
        materialGroup2: MaterialGroup.two(''),
        materialGroup4:
            material.isFOC ? MaterialGroup.four('6A1') : MaterialGroup.four(''),
      );

  factory MaterialQueryInfo.fromBundles({
    required MaterialInfo materialInfo,
  }) =>
      MaterialQueryInfo(
        qty: MaterialQty(1),
        value: materialInfo.materialNumber,
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
      );

  factory MaterialQueryInfo.fromOrderHistory({
    required OrderHistoryItem orderHistoryItem,
  }) =>
      MaterialQueryInfo(
        value: orderHistoryItem.materialNumber,
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
        qty: MaterialQty(
          orderHistoryItem.qty,
        ),
      );

  factory MaterialQueryInfo.empty() => MaterialQueryInfo(
        value: MaterialNumber(''),
        qty: MaterialQty(0),
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four(''),
      );
}
