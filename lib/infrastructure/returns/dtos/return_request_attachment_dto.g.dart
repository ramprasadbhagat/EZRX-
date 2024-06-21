// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReturnRequestAttachmentDtoImpl _$$ReturnRequestAttachmentDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReturnRequestAttachmentDtoImpl(
      path: json['url'] as String? ?? '',
      name: json['filename'] as String? ?? '',
    );

Map<String, dynamic> _$$ReturnRequestAttachmentDtoImplToJson(
        _$ReturnRequestAttachmentDtoImpl instance) =>
    <String, dynamic>{
      'url': instance.path,
      'filename': instance.name,
    };
