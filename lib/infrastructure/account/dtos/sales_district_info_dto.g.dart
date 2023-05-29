// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_district_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesDistrictInfoDto _$$_SalesDistrictInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesDistrictInfoDto(
      id: json['id'] as int? ?? 0,
      salesDistrictHeader: json['salesDistrict'] as String? ?? '',
      salesDistrictLabel: json['salesDistrictLabel'] as String? ?? '',
    );

Map<String, dynamic> _$$_SalesDistrictInfoDtoToJson(
        _$_SalesDistrictInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salesDistrict': instance.salesDistrictHeader,
      'salesDistrictLabel': instance.salesDistrictLabel,
    };
