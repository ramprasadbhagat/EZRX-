import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/approver_rights_details_dto.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

part 'approver_rights_dto.freezed.dart';
part 'approver_rights_dto.g.dart';

@freezed
class ApproverRightsDto with _$ApproverRightsDto {
  const ApproverRightsDto._();

  const factory ApproverRightsDto({
    @JsonKey(name: 'rawMetaData', defaultValue: <String>[], readValue: rawMetaDataOverride)
        required List<String> usernames,
    @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
        required List<ApproverRightsDetailsDto> approverRights,
  }) = _AddReturnApprovalLimitDto;

  ApproverRights toDomain() {
    return ApproverRights(
        userName: Username(usernames.first),
        approverRightsList:
            approverRights.map((e) => e.toDomain()).toList(),);
  }

  factory ApproverRightsDto.fromJson(Map<String, dynamic> json) =>
      _$ApproverRightsDtoFromJson(json);
}

List<dynamic> rawMetaDataOverride(Map json, String key) => json[key]['usernames'] ?? [];
