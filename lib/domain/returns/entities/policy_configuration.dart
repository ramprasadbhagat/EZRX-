import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'policy_configuration.freezed.dart';

@freezed
class PolicyConfiguration with _$PolicyConfiguration {
  const PolicyConfiguration._();

  const factory PolicyConfiguration({
    required SalesOrg salesOrg,
    required PrincipalCode principalCode,
    required MonthsBeforeExpiry monthsBeforeExpiry,
    required MonthsAfterExpiry monthsAfterExpiry,
    required String uuid,
    required ReturnsAllowed returnsAllowed,
    required PrincipalName principalName,
    required String status,
  }) = _PolicyConfiguration;
  factory PolicyConfiguration.empty() => PolicyConfiguration(
        salesOrg: SalesOrg(''),
        principalCode: PrincipalCode(''),
        monthsBeforeExpiry: MonthsBeforeExpiry.change(''),
        monthsAfterExpiry: MonthsAfterExpiry.change(''),
        uuid: '',
        returnsAllowed: ReturnsAllowed(false),
        principalName: PrincipalName(''),
        status: '',
      );

  String get getmonthsBeforeExpiryValue =>
      returnsAllowed.getOrDefaultValue(false)
          ? monthsBeforeExpiry.displayMonthsBeforeExpiry
          : '-';
  String get getmonthsAfterExpiryExpiryValue =>
      returnsAllowed.getOrDefaultValue(false)
          ? monthsAfterExpiry.displayMonthsAfterExpiry
          : '-';
}
