import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_configuration.freezed.dart';

@freezed
class PolicyConfigurationList with _$PolicyConfigurationList {
  const PolicyConfigurationList._();

  const factory PolicyConfigurationList({
    required String salesOrg,
    required PrincipalCode principalCode,
    required String monthsBeforeExpiry,
    required String monthsAfterExpiry,
    required String uuid,
    required ReturnsAllowed returnsAllowed,
    required PrincipalName principalName,
  }) = _PolicyConfigurationList;
  factory PolicyConfigurationList.empty() => PolicyConfigurationList(
        salesOrg: '',
        principalCode: PrincipalCode(''),
        monthsBeforeExpiry: '',
        monthsAfterExpiry: '',
        uuid: '',
        returnsAllowed: ReturnsAllowed(false),
        principalName: PrincipalName(''),
      );
}
