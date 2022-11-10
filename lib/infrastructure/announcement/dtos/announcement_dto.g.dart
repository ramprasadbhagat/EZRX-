// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnouncementDto _$$_AnnouncementDtoFromJson(Map<String, dynamic> json) =>
    _$_AnnouncementDto(
      startTime:
          announcementDateTimeFormatCheck(json, 'startTime') as String? ?? '',
      endTime:
          announcementDateTimeFormatCheck(json, 'endTime') as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      active: json['active'] as bool? ?? false,
    );
