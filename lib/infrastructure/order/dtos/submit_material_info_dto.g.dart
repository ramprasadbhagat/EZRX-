// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_material_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitMaterialInfoDto _$$_SubmitMaterialInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitMaterialInfoDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: json['qty'] as int? ?? 0,
      tenderContract: SubmitTenderContractDto.fromJson(
          json['contract'] as Map<String, dynamic>),
      bonuses: (json['bonuses'] as List<dynamic>?)
              ?.map((e) =>
                  MaterialItemBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comment: json['comment'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      salesDistrict: json['salesDistrict'] as String? ?? '',
      materialItemOverride: MaterialItemOverrideDto.fromJson(
          materialItemOverrideread(json, 'override') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SubmitMaterialInfoDtoToJson(
    _$_SubmitMaterialInfoDto instance) {
  final val = <String, dynamic>{
    'materialNumber': instance.materialNumber,
    'qty': instance.qty,
    'contract': instance.tenderContract.toJson(),
    'bonuses': instance.bonuses.map((e) => e.toJson()).toList(),
    'comment': instance.comment,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('batch', overrideBatchJson(instance.batch));
  val['salesDistrict'] = instance.salesDistrict;
  writeNotNull('override', overrideTojson(instance.materialItemOverride));
  return val;
}
