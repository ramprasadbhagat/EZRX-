// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactUsDetailsDto _$$_ContactUsDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ContactUsDetailsDto(
      content: readValue(json, 'content') as String? ?? '',
      preloginSendToEmail:
          readValue(json, 'preloginSendToEmail') as String? ?? '',
      postloginSendToEmail:
          readValue(json, 'postloginSendToEmail') as String? ?? '',
    );

Map<String, dynamic> _$$_ContactUsDetailsDtoToJson(
        _$_ContactUsDetailsDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'preloginSendToEmail': instance.preloginSendToEmail,
      'postloginSendToEmail': instance.postloginSendToEmail,
    };
