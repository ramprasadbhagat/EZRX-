// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_licenseDto _$$_licenseDtoFromJson(Map<String, dynamic> json) =>
    _$_licenseDto(
      licenceType: json['licenceType'] as String? ?? '',
      licenseDescription: json['licenseDescription'] as String? ?? '',
      licenseNumber: json['licenseNumber'] as String? ?? '',
      validFrom: dateTimeStringFormatCheck(json, 'validFrom') as String? ?? '',
      validTo: dateTimeStringFormatCheck(json, 'validTo') as String? ?? '',
    );

Map<String, dynamic> _$$_licenseDtoToJson(_$_licenseDto instance) =>
    <String, dynamic>{
      'licenceType': instance.licenceType,
      'licenseDescription': instance.licenseDescription,
      'licenseNumber': instance.licenseNumber,
      'validFrom': instance.validFrom,
      'validTo': instance.validTo,
    };
