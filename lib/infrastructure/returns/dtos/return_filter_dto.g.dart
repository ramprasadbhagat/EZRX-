// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnFilterDto _$$_ReturnFilterDtoFromJson(Map<String, dynamic> json) =>
    _$_ReturnFilterDto(
      dateFrom: json['dateFrom'] as String? ?? '',
      dateTo: json['dateTo'] as String? ?? '',
      refundTotalFrom: json['refundTotalFrom'] as String? ?? '',
      refundTotalTo: json['refundTotalTo'] as String? ?? '',
      statusList: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnFilterDtoToJson(_$_ReturnFilterDto instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'refundTotalFrom': instance.refundTotalFrom,
      'refundTotalTo': instance.refundTotalTo,
      'status': instance.statusList,
    };
