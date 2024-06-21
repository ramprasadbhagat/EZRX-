// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sales_organisation_configs_variable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateSalesOrganisationConfigsVariableDtoImpl
    _$$UpdateSalesOrganisationConfigsVariableDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$UpdateSalesOrganisationConfigsVariableDtoImpl(
          salesOrgIdDto:
              SalesOrgIdDto.fromJson(json['where'] as Map<String, dynamic>),
          data: UpdateSalesOrganisationConfigsDto.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$UpdateSalesOrganisationConfigsVariableDtoImplToJson(
        _$UpdateSalesOrganisationConfigsVariableDtoImpl instance) =>
    <String, dynamic>{
      'where': instance.salesOrgIdDto.toJson(),
      'data': instance.data.toJson(),
    };
