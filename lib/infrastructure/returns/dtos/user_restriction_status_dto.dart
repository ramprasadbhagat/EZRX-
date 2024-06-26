import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
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
      readValue: JsonReadValueHelper.readUserRestrictionOverride,
    )
    required String userRestrictionStatus,
    @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride,
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
