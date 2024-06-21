// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactUsDetailsDtoImpl _$$ContactUsDetailsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactUsDetailsDtoImpl(
      content: readValue(json, 'content') as String? ?? '',
      preloginSendToEmail:
          readValue(json, 'preloginSendToEmail') as String? ?? '',
      postloginSendToEmail:
          readValue(json, 'postloginSendToEmail') as String? ?? '',
    );

Map<String, dynamic> _$$ContactUsDetailsDtoImplToJson(
        _$ContactUsDetailsDtoImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'preloginSendToEmail': instance.preloginSendToEmail,
      'postloginSendToEmail': instance.postloginSendToEmail,
    };
