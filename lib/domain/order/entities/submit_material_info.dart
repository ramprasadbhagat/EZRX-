import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_info.freezed.dart';

@freezed
class SubmitMaterialInfo with _$SubmitMaterialInfo {
  const SubmitMaterialInfo._();
  const factory SubmitMaterialInfo({
    required MaterialNumber materialNumber,
    required int quantity,
    required List<MaterialItemBonus> bonuses,
    required String comment,
    required String batch,
    required String salesDistrict,
  }) = _SubmitMaterialInfo;

  factory SubmitMaterialInfo.empty() => SubmitMaterialInfo(
        materialNumber: MaterialNumber(''),
        quantity: 0,
        bonuses: <MaterialItemBonus>[],
        comment: '',
        batch: '',
        salesDistrict: '',
      );
}
