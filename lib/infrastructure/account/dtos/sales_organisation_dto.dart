import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_organisation_dto.freezed.dart';
part 'sales_organisation_dto.g.dart';

@freezed
class SalesOrganisationDto with _$SalesOrganisationDto {
  const SalesOrganisationDto._();

  const factory SalesOrganisationDto({
    @JsonKey(name: 'salesOrg') required String salesOrg,
  }) = _SalesOrganisationDto;

  factory SalesOrganisationDto.fromDomain(SalesOrganisation salesOrganisation) {
    return SalesOrganisationDto(
      salesOrg: salesOrganisation.salesOrg.getOrCrash(),
    );
  }

  SalesOrganisation toDomain() {
    return SalesOrganisation(salesOrg: SalesOrg(salesOrg));
  }

  factory SalesOrganisationDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrganisationDtoFromJson(json);
}
