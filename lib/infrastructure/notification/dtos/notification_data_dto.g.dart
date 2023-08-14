// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDataDto _$$_NotificationDataDtoFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationDataDto(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$_NotificationDataDtoToJson(
        _$_NotificationDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
    };
