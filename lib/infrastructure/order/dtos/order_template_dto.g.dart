// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTemplateDto _$$_OrderTemplateDtoFromJson(Map<String, dynamic> json) =>
    _$_OrderTemplateDto(
      templateId: json['id'] as String,
      templateName: json['name'] as String? ?? '',
      user: json['user'] as Map<String, dynamic>? ?? {},
    );

Map<String, dynamic> _$$_OrderTemplateDtoToJson(_$_OrderTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.templateId,
      'name': instance.templateName,
      'user': instance.user,
    };
