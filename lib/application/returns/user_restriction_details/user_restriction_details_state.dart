part of 'user_restriction_details_bloc.dart';

@freezed
class UserRestrictionDetailsState with _$UserRestrictionDetailsState {
  const UserRestrictionDetailsState._();
  factory UserRestrictionDetailsState({
    required bool isFetching,
    required ApprovalLimits approvalLimits,
    required List<ApproverRightsDetails> addedApproverRightsList,
    required ApproverRights approverRights,
    required UserRestrictionStatus userRestrictionStatus,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _UserRestrictionDetailsState;

  factory UserRestrictionDetailsState.initial() => UserRestrictionDetailsState(
        isFetching: false,
        approverRights: ApproverRights.empty(),
        addedApproverRightsList: <ApproverRightsDetails>[],
        userRestrictionStatus: UserRestrictionStatus.empty(),
        approvalLimits: ApprovalLimits.empty(),
        apiFailureOrSuccessOption: none(),
      );

  List<ApproverRightsDetails> get approverRightsList =>
      approverRights.approverRightsList;

  List<ApproverRightsDetails> get configurableApproverRightsList {
    if (approverRightsList.isEmpty) return addedApproverRightsList;

    return addedApproverRightsList.sublist(approverRightsList.length);
  }

  bool get isRestrictionAdded =>
      approverRightsList.length != addedApproverRightsList.length;
}
