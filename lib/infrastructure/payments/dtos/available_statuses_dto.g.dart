// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_statuses_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AvailableStatusesDto _$$_AvailableStatusesDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AvailableStatusesDto(
      statuses: (json['statuses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_AvailableStatusesDtoToJson(
        _$_AvailableStatusesDto instance) =>
    <String, dynamic>{
      'statuses': instance.statuses,
    };
