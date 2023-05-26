// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_district_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesDistrictDto _$$_SalesDistrictDtoFromJson(Map<String, dynamic> json) =>
    _$_SalesDistrictDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      salesDistrictInfo: (json['salesDistricts'] as List<dynamic>?)
              ?.map((e) =>
                  SalesDistrictInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_SalesDistrictDtoToJson(_$_SalesDistrictDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'salesDistricts':
          instance.salesDistrictInfo.map((e) => e.toJson()).toList(),
    };
