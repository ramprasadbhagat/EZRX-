import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_restriction_status.freezed.dart';

@freezed
class UserRestrictionStatus with _$UserRestrictionStatus {
  const UserRestrictionStatus._();

  const factory UserRestrictionStatus({
    required String approverRightsStatus,
    required bool approvalLimitStatus,
  }) = _UserRestrictionStatus;

  factory UserRestrictionStatus.empty() => const UserRestrictionStatus(
        approverRightsStatus: '',
        approvalLimitStatus: false,
      );

  bool get ifUserAdded =>
      approverRightsStatus.isNotEmpty || approvalLimitStatus;
  bool get ifUserNotConfigured => approverRightsStatus == '0 rows inserted';
}
