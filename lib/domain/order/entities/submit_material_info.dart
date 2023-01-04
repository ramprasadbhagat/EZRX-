import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_info.freezed.dart';

@freezed
class SubmitMaterialInfo with _$SubmitMaterialInfo {
  const SubmitMaterialInfo._();
  const factory SubmitMaterialInfo({
    required MaterialNumber materialNumber,
    required int quantity,
    required TenderContract tenderContract,
    required List<MaterialItemBonus> bonuses,
    required String comment,
    required String batch,
    required String salesDistrict,
    required MaterialItemOverride materialItemOverride,
  }) = _SubmitMaterialInfo;

  factory SubmitMaterialInfo.empty() => SubmitMaterialInfo(
        materialNumber: MaterialNumber(''),
        quantity: 0,
        tenderContract: TenderContract.empty(),
        bonuses: <MaterialItemBonus>[],
        comment: '',
        batch: '',
        salesDistrict: '',
        materialItemOverride: MaterialItemOverride.empty(),
      );
}
