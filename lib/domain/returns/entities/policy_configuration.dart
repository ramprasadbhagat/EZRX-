import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_configuration.freezed.dart';

@freezed
class PolicyConfiguration with _$PolicyConfiguration {
  const PolicyConfiguration._();

  const factory PolicyConfiguration({
    required String salesOrg,
    required PrincipalCode principalCode,
    required String monthsBeforeExpiry,
    required String monthsAfterExpiry,
    required String uuid,
    required ReturnsAllowed returnsAllowed,
    required PrincipalName principalName,
    required String status,

  }) = _PolicyConfiguration;
  factory PolicyConfiguration.empty() => PolicyConfiguration(
        salesOrg: '',
        principalCode: PrincipalCode(''),
        monthsBeforeExpiry: '',
        monthsAfterExpiry: '',
        uuid: '',
        returnsAllowed: ReturnsAllowed(false),
        principalName: PrincipalName(''),
        status: '',
      );
}
