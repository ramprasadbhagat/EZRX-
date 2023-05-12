// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnItemDetailsDto _$$_ReturnItemDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnItemDetailsDto(
      returnQuantity: json['returnQuantity'] as int? ?? 0,
      materialNumber: json['materialNumber'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      returnReason: json['returnReason'] as String? ?? '',
      url: (json['url'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      returnType: json['returnType'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnItemDetailsDtoToJson(
        _$_ReturnItemDetailsDto instance) =>
    <String, dynamic>{
      'returnQuantity': instance.returnQuantity,
      'materialNumber': instance.materialNumber,
      'lineNumber': instance.lineNumber,
      'batch': instance.batch,
      'returnReason': instance.returnReason,
      'url': instance.url,
      'returnType': instance.returnType,
    };
