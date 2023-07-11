import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_approval_and_approver_rights.freezed.dart';

@freezed
class UserRestrictions with _$UserRestrictions {
  const UserRestrictions._();

  const factory UserRestrictions({
    required List<ApprovalLimits> approverLimits,
    required ApproverRights approverRights,
  }) = _UserRestrictions;
  ApprovalLimits get approverLimitsDetails {
    return approverLimits.isNotEmpty
        ? approverLimits.first
        : ApprovalLimits.empty();
  }
}
