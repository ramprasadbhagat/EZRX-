import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_info_dto.freezed.dart';
part 'submit_material_info_dto.g.dart';

@freezed
class SubmitMaterialInfoDto with _$SubmitMaterialInfoDto {
  const SubmitMaterialInfoDto._();
  const factory SubmitMaterialInfoDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'bonuses', defaultValue: <MaterialItemBonusDto>[])
        required List<MaterialItemBonusDto> bonuses,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
    @JsonKey(name: 'batch', defaultValue: '') required String batch,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
  }) = _SubmitMaterialInfoDto;

  SubmitMaterialInfo toDomain() {
    return SubmitMaterialInfo(
      materialNumber: MaterialNumber(materialNumber),
      quantity: qty,
      bonuses: bonuses.map((e) => e.toDomain()).toList(),
      comment: comment,
      batch: batch,
      salesDistrict: salesDistrict,
    );
  }

  factory SubmitMaterialInfoDto.fromDomain(
    SubmitMaterialInfo submitMaterialInfo,
  ) {
    return SubmitMaterialInfoDto(
      materialNumber: submitMaterialInfo.materialNumber.getOrCrash(),
      qty: submitMaterialInfo.quantity,
      bonuses: submitMaterialInfo.bonuses
          .map((e) => MaterialItemBonusDto.fromDomain(e))
          .toList(),
      comment: submitMaterialInfo.comment,
      batch: submitMaterialInfo.batch,
      salesDistrict: submitMaterialInfo.salesDistrict,
    );
  }

  factory SubmitMaterialInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitMaterialInfoDtoFromJson(json);
}
