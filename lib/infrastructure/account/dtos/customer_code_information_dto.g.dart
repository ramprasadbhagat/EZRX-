// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_code_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerInformationDTO _$$_CustomerInformationDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerInformationDTO(
      shipToCount: json['shipToCount'] as int? ?? 0,
      soldToInformation: (json['SoldToInformation'] as List<dynamic>?)
              ?.map((e) => CustomerCodeDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CustomerInformationDTOToJson(
        _$_CustomerInformationDTO instance) =>
    <String, dynamic>{
      'shipToCount': instance.shipToCount,
      'SoldToInformation':
          instance.soldToInformation.map((e) => e.toJson()).toList(),
    };
