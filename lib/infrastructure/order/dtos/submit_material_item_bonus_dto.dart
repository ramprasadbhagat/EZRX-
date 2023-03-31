import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_item_bonus_dto.freezed.dart';
part 'submit_material_item_bonus_dto.g.dart';

@freezed
class SubmitMaterialItemBonusDto with _$SubmitMaterialItemBonusDto {
  const SubmitMaterialItemBonusDto._();

  factory SubmitMaterialItemBonusDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
  }) = _SubmitMaterialItemBonusDto;

  factory SubmitMaterialItemBonusDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitMaterialItemBonusDtoFromJson(json);

  factory SubmitMaterialItemBonusDto.fromMaterialItemBonus(
    MaterialItemBonus bonus,
  ) {
    return SubmitMaterialItemBonusDto(
      materialNumber: bonus.materialInfo.materialNumber.getOrDefaultValue(''),
      qty: bonus.qty,
      comment: bonus.comment,
    );
  }

  factory SubmitMaterialItemBonusDto.fromDomain(
    SubmitMaterialItemBonus bonus,
  ) {
    return SubmitMaterialItemBonusDto(
      materialNumber: bonus.materialNumber.getOrDefaultValue(''),
      qty: bonus.qty,
      comment: bonus.comment,
    );
  }

  SubmitMaterialItemBonus toDomain() {
    return SubmitMaterialItemBonus(
      materialNumber: MaterialNumber(materialNumber),
      qty: qty,
      comment: comment,
    );
  }
}
