// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDto _$$_NotificationDtoFromJson(Map<String, dynamic> json) =>
    _$_NotificationDto(
      pagination:
          PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
      notificationData: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  NotificationDataDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_NotificationDtoToJson(_$_NotificationDto instance) =>
    <String, dynamic>{
      'pagination': instance.pagination.toJson(),
      'data': instance.notificationData.map((e) => e.toJson()).toList(),
    };
