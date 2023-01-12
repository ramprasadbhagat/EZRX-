import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_configuration_dto.freezed.dart';
part 'policy_configuration_dto.g.dart';

@freezed
class PolicyConfigurationDto with _$PolicyConfigurationDto {
  const PolicyConfigurationDto._();

  const factory PolicyConfigurationDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
        required String monthsBeforeExpiry,
    @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
        required String monthsAfterExpiry,
    @JsonKey(name: 'uuid', defaultValue: '') required String uuid,
    @JsonKey(name: 'returnsAllowed', defaultValue: false)
        required bool returnsAllowed,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'status', defaultValue: '') required String status,


  }) = _PolicyConfigurationDto;

  factory PolicyConfigurationDto.fromDomain(
    PolicyConfiguration policy,
  ) {
    return PolicyConfigurationDto(
      salesOrg: policy.salesOrg,
      principalCode: policy.principalCode.getOrCrash(),
      monthsBeforeExpiry: policy.monthsBeforeExpiry,
      monthsAfterExpiry: policy.monthsAfterExpiry,
      principalName: policy.principalName.name,
      returnsAllowed: policy.returnsAllowed.getOrCrash(),
      uuid: policy.uuid,
      status: policy.status,
    );
  }

  PolicyConfiguration toDomain() {
    return PolicyConfiguration(
      salesOrg: salesOrg,
      uuid: uuid,
      monthsAfterExpiry: monthsAfterExpiry,
      monthsBeforeExpiry: monthsBeforeExpiry,
      principalCode: PrincipalCode(principalCode),
      principalName: PrincipalName(principalName),
      returnsAllowed: ReturnsAllowed(returnsAllowed),
      status: status,
    );
  }

  factory PolicyConfigurationDto.fromJson(Map<String, dynamic> json) =>
      _$PolicyConfigurationDtoFromJson(json);
}
