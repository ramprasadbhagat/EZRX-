import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_info.freezed.dart';

@freezed
class SubmitMaterialInfo with _$SubmitMaterialInfo {
  const SubmitMaterialInfo._();
  const factory SubmitMaterialInfo({
    required MaterialNumber materialNumber,
    required int quantity,
    required List<SubmitMaterialItemBonus> bonuses,
    required String productType,
    required String parentID,
    required String comment,
    required MaterialItemOverride materialItemOverride,
    required double price,

    ///Todo: consider to delete it
    required BatchNumber batch,
  }) = _SubmitMaterialInfo;

  factory SubmitMaterialInfo.empty() => SubmitMaterialInfo(
        materialNumber: MaterialNumber(''),
        quantity: 0,
        bonuses: <SubmitMaterialItemBonus>[],
        comment: '',
        productType: '',
        parentID: '',
        batch: BatchNumber(''),
        materialItemOverride: MaterialItemOverride.empty(),
        price: 0,
      );
}
