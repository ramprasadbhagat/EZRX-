// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_district_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesDistrictDetailsDto _$$_SalesDistrictDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesDistrictDetailsDto(
      id: json['id'] as int? ?? 0,
      salesDistrict: json['salesDistrict'] as String? ?? '',
      salesDistrictLabel: json['salesDistrictLabel'] as String? ?? '',
    );

Map<String, dynamic> _$$_SalesDistrictDetailsDtoToJson(
        _$_SalesDistrictDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salesDistrict': instance.salesDistrict,
      'salesDistrictLabel': instance.salesDistrictLabel,
    };
