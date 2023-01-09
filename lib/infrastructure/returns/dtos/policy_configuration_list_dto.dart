import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_configuration_list_dto.freezed.dart';
part 'policy_configuration_list_dto.g.dart';

@freezed
class PolicyConfigurationListDto with _$PolicyConfigurationListDto {
  const PolicyConfigurationListDto._();

  const factory PolicyConfigurationListDto({
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
  }) = _PolicyConfigurationListDto;

  factory PolicyConfigurationListDto.fromDomain(
    PolicyConfigurationList policy,
  ) {
    return PolicyConfigurationListDto(
      salesOrg: policy.salesOrg,
      principalCode: policy.principalCode.getOrCrash(),
      monthsBeforeExpiry: policy.monthsBeforeExpiry,
      monthsAfterExpiry: policy.monthsAfterExpiry,
      principalName: policy.principalName.name,
      returnsAllowed: policy.returnsAllowed.getOrCrash(),
      uuid: policy.uuid,
    );
  }

  PolicyConfigurationList toDomain() {
    return PolicyConfigurationList(
      salesOrg: salesOrg,
      uuid: uuid,
      monthsAfterExpiry: monthsAfterExpiry,
      monthsBeforeExpiry: monthsBeforeExpiry,
      principalCode: PrincipalCode(principalCode),
      principalName: PrincipalName(principalName),
      returnsAllowed: ReturnsAllowed(returnsAllowed),
    );
  }

  factory PolicyConfigurationListDto.fromJson(Map<String, dynamic> json) =>
      _$PolicyConfigurationListDtoFromJson(json);
}
