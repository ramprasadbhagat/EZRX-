import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
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
  }) = _FavouriteDto;

  factory PolicyConfigurationListDto.fromDomain(
    PolicyConfigurationList policy,
  ) {
    return PolicyConfigurationListDto(
      salesOrg: policy.salesOrg,
      principalCode: policy.principalCode,
      monthsBeforeExpiry: policy.monthsBeforeExpiry,
      monthsAfterExpiry: policy.monthsAfterExpiry,
      principalName: policy.principalName,
      returnsAllowed: policy.returnsAllowed,
      uuid: policy.uuid,
    );
  }

  PolicyConfigurationList toDomain() {
    return PolicyConfigurationList(
      salesOrg: salesOrg,
      uuid: uuid,
      monthsAfterExpiry: monthsAfterExpiry,
      monthsBeforeExpiry: monthsBeforeExpiry,
      principalCode: principalCode,
      principalName: principalName,
      returnsAllowed: returnsAllowed,
    );
  }

  factory PolicyConfigurationListDto.fromJson(Map<String, dynamic> json) =>
      _$PolicyConfigurationListDtoFromJson(json);
}
