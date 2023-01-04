import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_configuration.freezed.dart';

@freezed
class PolicyConfigurationList with _$PolicyConfigurationList {
  const PolicyConfigurationList._();

  const factory PolicyConfigurationList({
    required String salesOrg,
    required String principalCode,
    required String monthsBeforeExpiry,
    required String monthsAfterExpiry,
    required String uuid,
    required bool returnsAllowed,
    required String principalName,
  }) = _PolicyConfigurationList;
  factory PolicyConfigurationList.empty() => const PolicyConfigurationList(
        salesOrg: '',
        principalCode: '',
        monthsBeforeExpiry: '',
        monthsAfterExpiry: '',
        uuid: '',
        returnsAllowed: false,
        principalName: '',
      );
}
