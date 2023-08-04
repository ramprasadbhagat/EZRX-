// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactUsDto _$$_ContactUsDtoFromJson(Map<String, dynamic> json) =>
    _$_ContactUsDto(
      name: json['name'] as String? ?? '',
      contactNumber: json['contactNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_ContactUsDtoToJson(_$_ContactUsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'message': instance.message,
    };
