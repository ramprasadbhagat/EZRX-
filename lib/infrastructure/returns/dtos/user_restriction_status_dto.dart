import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';

part 'user_restriction_status_dto.freezed.dart';
part 'user_restriction_status_dto.g.dart';

@freezed
class UserRestrictionStatusDto with _$UserRestrictionStatusDto {
  const UserRestrictionStatusDto._();

  const factory UserRestrictionStatusDto({
    @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: _userRestrictionOverride,
    )
        required String userRestrictionStatus,
    @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: _userReturnApprovalLimitOverride,
    )
        required bool userReturnApprovalLimit,
  }) = _UserRestrictionStatusDto;

  UserRestrictionStatus toDomain() {
    return UserRestrictionStatus(
      approverRightsStatus: userRestrictionStatus,
      approvalLimitStatus: userReturnApprovalLimit,
    );
  }

  factory UserRestrictionStatusDto.fromJson(Map<String, dynamic> json) =>
      _$UserRestrictionStatusDtoFromJson(json);
}

String _userRestrictionOverride(Map json, String _) =>
    json['addRestriction']?['status'] ??
    json['deleteRestriction']?['status'] ??
    '';

bool _userReturnApprovalLimitOverride(Map json, String _) =>
    json['addReturnApprovalLimit']?['status'] ??
    json['deleteReturnApprovalLimit']?['status'] ??
    false;
