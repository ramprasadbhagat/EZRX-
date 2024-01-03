// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnRequestAttachmentDto _$$_ReturnRequestAttachmentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnRequestAttachmentDto(
      path: json['url'] as String? ?? '',
      name: json['filename'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnRequestAttachmentDtoToJson(
        _$_ReturnRequestAttachmentDto instance) =>
    <String, dynamic>{
      'url': instance.path,
      'filename': instance.name,
    };
