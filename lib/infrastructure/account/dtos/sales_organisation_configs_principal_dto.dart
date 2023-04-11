import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'sales_organisation_configs_principal_dto.freezed.dart';
part 'sales_organisation_configs_principal_dto.g.dart';

@freezed
class SalesOrganisationConfigsPrincipalDto with _$SalesOrganisationConfigsPrincipalDto {
  const SalesOrganisationConfigsPrincipalDto._();

  @HiveType(typeId: 33, adapterName: 'SalesOrganisationConfigsPrincipalDtoAdapter')
  const factory SalesOrganisationConfigsPrincipalDto({
    //The date is not been used anywhere and
    //it is not in proper format
    //e.g - YYYYMMDD00 (extra two zero at the end)
    @HiveField(1, defaultValue: 0)
    @JsonKey(name: 'date', defaultValue: 0)
        required int date,
    @HiveField(2, defaultValue: '')
    @JsonKey(name: 'principal')
        required String principalCode,
  }) = _SalesOrganisationConfigsPrincipalDto;
  factory SalesOrganisationConfigsPrincipalDto.fromDomain(
    SalesOrganisationConfigsPrincipal salesOrganisationConfigsPrincipal,
  ) {
    return SalesOrganisationConfigsPrincipalDto(
      date: salesOrganisationConfigsPrincipal.date.dateTimeIntValue,
      principalCode: salesOrganisationConfigsPrincipal.principalCode.getOrDefaultValue(''),
    );
  }

  SalesOrganisationConfigsPrincipal toDomain() {
    return SalesOrganisationConfigsPrincipal(
      date: DateTimeStringValue(date.toString()),
      principalCode: PrincipalCode(principalCode),
    );
  }

  factory SalesOrganisationConfigsPrincipalDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrganisationConfigsPrincipalDtoFromJson(json);

}

