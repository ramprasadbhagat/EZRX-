import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

part 'return_approval_limit_details.freezed.dart';

@freezed
class ApprovalLimits with _$ApprovalLimits {
  const ApprovalLimits._();

  const factory ApprovalLimits({
    required SalesOrg salesOrg,
    required Username userName,
    required ApprovalLimit valueUpperLimit,
    required ApprovalLimit valueLowerLimit,
    required String uuid,
  }) = _ApprovalLimits;
  factory ApprovalLimits.empty() => ApprovalLimits(
        userName: Username(''),
        valueLowerLimit: ApprovalLimit(0),
        valueUpperLimit: ApprovalLimit(0),
        salesOrg: SalesOrg(''),
        uuid: '',
      );

  bool get isValidReturnLimitValue {
    return valueUpperLimit.getValue() > valueLowerLimit.getValue();
  }

  bool get isNotValidApprovalLimit => !salesOrg.isValid();
}
