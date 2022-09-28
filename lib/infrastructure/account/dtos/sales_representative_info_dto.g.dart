// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_representative_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesRepresentativeInfoDto _$$_SalesRepresentativeInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SalesRepresentativeInfoDto(
      count: json['count'] as int,
      uniquePrincipalGroups: (json['uniquePrincipalGroup'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      uniquePrincipalNumbers: (json['uniquePrincipalNumber'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      uniqueSalesOrganisations:
          (json['uniqueSalesOrganisation'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$_SalesRepresentativeInfoDtoToJson(
        _$_SalesRepresentativeInfoDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'uniquePrincipalGroup': instance.uniquePrincipalGroups,
      'uniquePrincipalNumber': instance.uniquePrincipalNumbers,
      'uniqueSalesOrganisation': instance.uniqueSalesOrganisations,
    };
