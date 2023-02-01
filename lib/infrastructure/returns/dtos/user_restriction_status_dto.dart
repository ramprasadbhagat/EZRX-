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
      readValue: userRestrictionOverride,
    )
        required String userRestrictionStatus,
    @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: userReturnApprovalLimitOverride,
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

String userRestrictionOverride(Map json, String key) =>
    json['addRestriction']?['status'] ??
    json['deleteRestriction']?['status'] ??
    '';

bool userReturnApprovalLimitOverride(Map json, String key) =>
    json['addReturnApprovalLimit']?['status'] ??
    json['deleteReturnApprovalLimit']?['status'] ??
    false;
