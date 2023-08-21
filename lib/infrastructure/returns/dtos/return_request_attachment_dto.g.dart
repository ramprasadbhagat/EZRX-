// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnRequestAttachmentDto _$$_ReturnRequestAttachmentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnRequestAttachmentDto(
      path: json['path'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      size: json['size'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ReturnRequestAttachmentDtoToJson(
        _$_ReturnRequestAttachmentDto instance) =>
    <String, dynamic>{
      'path': instance.path,
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
    };
