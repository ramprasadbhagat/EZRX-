import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_item_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_tender_contract_dto.dart';
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
    @JsonKey(name: 'contract') required SubmitTenderContractDto tenderContract,
    @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
        required List<SubmitMaterialItemBonusDto> bonuses,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
    @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
        required String batch,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
    @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
        required MaterialItemOverrideDto materialItemOverride,
  }) = _SubmitMaterialInfoDto;

  SubmitMaterialInfo toDomain() {
    return SubmitMaterialInfo(
      materialNumber: MaterialNumber(materialNumber),
      quantity: qty,
      tenderContract: TenderContract.empty(),
      bonuses: bonuses.map((e) => e.toDomain()).toList(),
      comment: comment,
      batch: BatchNumber(batch),
      salesDistrict: salesDistrict,
      materialItemOverride: MaterialItemOverride.empty(),
    );
  }

  factory SubmitMaterialInfoDto.fromDomain(
    SubmitMaterialInfo submitMaterialInfo,
    String currency,
  ) {
    return SubmitMaterialInfoDto(
      materialNumber: submitMaterialInfo.materialNumber.getOrCrash(),
      qty: submitMaterialInfo.quantity,
      tenderContract: SubmitTenderContractDto.fromDomain(
        submitMaterialInfo.tenderContract,
        currency,
      ),
      bonuses: submitMaterialInfo.bonuses
          .map(
            (e) => SubmitMaterialItemBonusDto.fromDomain(e),
          )
          .toList(),
      comment: submitMaterialInfo.comment,
      batch: submitMaterialInfo.batch.getOrDefaultValue(''),
      salesDistrict:
          submitMaterialInfo.tenderContract.salesDistrict.getOrCrash(),
      materialItemOverride: MaterialItemOverrideDto.fromDomain(
        submitMaterialInfo.materialItemOverride,
      ),
    );
  }

  factory SubmitMaterialInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitMaterialInfoDtoFromJson(json);
}

Map materialItemOverrideread(Map json, String key) => json[key] ?? {};

dynamic overrideTojson(MaterialItemOverrideDto value) {
  if (value.percentageOverride.isEmpty &&
      value.valueOverride.isEmpty &&
      value.reference.isEmpty) {
    return null;
  }

  return value.toJson();
}

String? overrideBatchJson(String batch) {
  if (batch.isEmpty) {
    return null;
  }

  return batch;
}
