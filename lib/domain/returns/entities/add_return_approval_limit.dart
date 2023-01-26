import 'package:freezed_annotation/freezed_annotation.dart';


part 'add_return_approval_limit.freezed.dart';

@freezed
class AddConfigureUserRestrictionStatus with _$AddConfigureUserRestrictionStatus {
  const AddConfigureUserRestrictionStatus._();

  const factory AddConfigureUserRestrictionStatus({
    required String addRestrictionStatus,
    required bool addReturnApprovalLimit,
  }) = _AAddConfigureUserRestrictionStatus;

  factory AddConfigureUserRestrictionStatus.empty() =>
      const AddConfigureUserRestrictionStatus(
        addRestrictionStatus: '',
        addReturnApprovalLimit: false,
      );

  bool get ifUserAdded => addRestrictionStatus.isNotEmpty;
  bool get ifUserNotConfigured => addRestrictionStatus == '0 rows inserted';

}
