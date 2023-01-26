part of 'user_restriction_details_bloc.dart';

@freezed
class UserRestrictionDetailsEvent with _$UserRestrictionDetailsEvent {
  const factory UserRestrictionDetailsEvent.initialized(
    {required SalesOrganisation salesOrganisation,}
  ) = _Initialized;
  const factory UserRestrictionDetailsEvent.fetchUserRestrictionDetails({
    required SalesOrganisation salesOrganisation,
    required Username userName,
  }) = _fetchUserRestrictionDetails;
  const factory UserRestrictionDetailsEvent.updateTextField({
    required String value,
    required UserRestrictionLabel label,
    required int index,
  }) = _updateTextField;
  const factory UserRestrictionDetailsEvent.addApproverRights(
      {required SalesOrg salesOrg,}) = _addApproverRights;
  const factory UserRestrictionDetailsEvent.deleteApproverRights(
      {required ApproverRightsDetails approverRightsDetails,}) = _deleteApproverRights;
  const factory UserRestrictionDetailsEvent.addUserRestriction() = _addUserRestriction;
  const factory UserRestrictionDetailsEvent.configureUserRestriction() = _configureUserRestriction;
}

enum UserRestrictionLabel {
  userName,
  returnUpperLimit,
  returnLowerLimit,
  salesOrg,
  principal,
  industryCode1,
  industryCode2,
  industryCode3,
  industryCode4,
  industryCode5,
  plant,
  materialNumber,
}
