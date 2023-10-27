// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_deal_material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ComboDealMaterialSetDto _$$_ComboDealMaterialSetDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealMaterialSetDto(
      setNo: json['setNo'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) =>
                  ComboDealMaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ComboDealMaterialSetDtoToJson(
        _$_ComboDealMaterialSetDto instance) =>
    <String, dynamic>{
      'setNo': instance.setNo,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };

_$_ComboDealMaterialDto _$$_ComboDealMaterialDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ComboDealMaterialDto(
      minQty: _readValue(json, 'minQty') == null
          ? 0
          : const StringToIntConverter()
              .fromJson(_readValue(json, 'minQty') as String),
      materialNumber: json['materialNumber'] as String? ?? '',
      rate: json['rate'] == null
          ? 0
          : const StringToDoubleConverter().fromJson(json['rate'] as String),
      type: json['type'] as String? ?? '',
      conditionNumber: json['conditionNumber'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
      suffix: json['suffix'] as String? ?? '',
    );

Map<String, dynamic> _$$_ComboDealMaterialDtoToJson(
        _$_ComboDealMaterialDto instance) =>
    <String, dynamic>{
      'minQty': const StringToIntConverter().toJson(instance.minQty),
      'materialNumber': instance.materialNumber,
      'rate': const StringToDoubleConverter().toJson(instance.rate),
      'type': instance.type,
      'conditionNumber': instance.conditionNumber,
      'mandatory': instance.mandatory,
      'suffix': instance.suffix,
    };
