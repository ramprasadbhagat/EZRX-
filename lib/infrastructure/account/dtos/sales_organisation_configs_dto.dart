import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_configs_dto.freezed.dart';
part 'sales_organisation_configs_dto.g.dart';

@freezed
class SalesOrganisationConfigsDto with _$SalesOrganisationConfigsDto {
  const SalesOrganisationConfigsDto._();

  const factory SalesOrganisationConfigsDto({
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'hideCustomer') required bool hideCustomer,
  }) = _SalesOrganisationConfigsDto;

  factory SalesOrganisationConfigsDto.fromDomain(
    SalesOrganisationConfigs salesOrganisationConfigs,
  ) {
    return SalesOrganisationConfigsDto(
      currency: salesOrganisationConfigs.currency.getOrCrash(),
      hideCustomer: salesOrganisationConfigs.hideCustomer,
    );
  }

  SalesOrganisationConfigs toDomain() {
    return SalesOrganisationConfigs(
      currency: Currency(currency),
      hideCustomer: hideCustomer,
    );
  }

  factory SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrganisationConfigsDtoFromJson(json);
}
