// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestInformationDto _$$_RequestInformationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_RequestInformationDto(
      requestHeader: RequestInformationHeaderDto.fromJson(
          json['requestHeader'] as Map<String, dynamic>),
      requestInformation: (json['requestInformationV2'] as List<dynamic>?)
              ?.map((e) => ReturnRequestInformationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_RequestInformationDtoToJson(
        _$_RequestInformationDto instance) =>
    <String, dynamic>{
      'requestHeader': instance.requestHeader.toJson(),
      'requestInformationV2':
          instance.requestInformation.map((e) => e.toJson()).toList(),
    };
