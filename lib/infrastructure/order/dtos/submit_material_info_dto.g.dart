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
      bonuses: (json['bonuses'] as List<dynamic>?)
              ?.map((e) =>
                  MaterialItemBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comment: json['comment'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      salesDistrict: json['salesDistrict'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubmitMaterialInfoDtoToJson(
        _$_SubmitMaterialInfoDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'qty': instance.qty,
      'bonuses': instance.bonuses,
      'comment': instance.comment,
      'batch': instance.batch,
      'salesDistrict': instance.salesDistrict,
    };
