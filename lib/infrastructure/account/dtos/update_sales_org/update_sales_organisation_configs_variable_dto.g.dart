// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_sales_organisation_configs_variable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateSalesOrganisationConfigsVariableDto
    _$$_UpdateSalesOrganisationConfigsVariableDtoFromJson(
            Map<String, dynamic> json) =>
        _$_UpdateSalesOrganisationConfigsVariableDto(
          salesOrgIdDto:
              SalesOrgIdDto.fromJson(json['where'] as Map<String, dynamic>),
          data: UpdateSalesOrganisationConfigsDto.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UpdateSalesOrganisationConfigsVariableDtoToJson(
        _$_UpdateSalesOrganisationConfigsVariableDto instance) =>
    <String, dynamic>{
      'where': instance.salesOrgIdDto.toJson(),
      'data': instance.data.toJson(),
    };
