import 'package:ezrxmobile/infrastructure/returns/dtos/approval_limits_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/approver_rights_dto.dart';

import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';

part 'user_restrictions_dto.freezed.dart';
part 'user_restrictions_dto.g.dart';

@freezed
class UserRestrictionsDto with _$UserRestrictionsDto {
  const UserRestrictionsDto._();

  const factory UserRestrictionsDto({
    @JsonKey(name: 'approverRights') required ApproverRightsDto approverRights,
    @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
        required List<ApprovalLimitsDto> approverLimits,
  }) = _UserRestrictionsDto;

  UserRestrictions toDomain() {
    return UserRestrictions(
      approverRights: approverRights.toDomain(),
      approverLimits: approverLimits.map((e) => e.toDomain()).toList(),
    );
  }

  factory UserRestrictionsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserRestrictionsDtoFromJson(json);
}
