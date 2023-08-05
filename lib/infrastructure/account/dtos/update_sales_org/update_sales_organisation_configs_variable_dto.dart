import 'package:ezrxmobile/domain/account/entities/update_sales_org/sales_org_id.dart';
import 'package:ezrxmobile/domain/account/entities/update_sales_org/update_sales_organisation_configs.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/sales_org_id_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/update_sales_org/update_sales_organisation_configs_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_sales_organisation_configs_variable_dto.freezed.dart';
part 'update_sales_organisation_configs_variable_dto.g.dart';

@freezed
class UpdateSalesOrganisationConfigsVariableDto
    with _$UpdateSalesOrganisationConfigsVariableDto {
  const UpdateSalesOrganisationConfigsVariableDto._();

  const factory UpdateSalesOrganisationConfigsVariableDto({
    @JsonKey(name: 'where') required SalesOrgIdDto salesOrgIdDto,
    @JsonKey(name: 'data') required UpdateSalesOrganisationConfigsDto data,
  }) = _UpdateSalesOrganisationConfigsVariableDto;

  factory UpdateSalesOrganisationConfigsVariableDto.fromDomain(
    SalesOrgId salesOrgId,
    UpdateSalesOrganisationConfigs configs,
  ) {
    return UpdateSalesOrganisationConfigsVariableDto(
      salesOrgIdDto: SalesOrgIdDto.fromDomain(salesOrgId),
      data: UpdateSalesOrganisationConfigsDto.fromDomain(configs),
    );
  }

  factory UpdateSalesOrganisationConfigsVariableDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UpdateSalesOrganisationConfigsVariableDtoFromJson(json);
}
