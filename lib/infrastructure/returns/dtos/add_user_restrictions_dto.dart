import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/add_return_approval_limit.dart';



part 'add_user_restrictions_dto.freezed.dart';
part 'add_user_restrictions_dto.g.dart';

@freezed
class AddConfigureUserRestrictionDto with _$AddConfigureUserRestrictionDto {
  const AddConfigureUserRestrictionDto._();

  const factory AddConfigureUserRestrictionDto({
    @JsonKey(name: 'addRestriction', defaultValue: '', readValue: addRestrictionOverride) required String addRestrictionStatus,
    @JsonKey(name: 'addReturnApprovalLimit', defaultValue: false, readValue: addReturnApprovalLimitOverride) required bool addReturnApprovalLimit,
  }) = _AddConfigureUserRestrictionDto;

  AddConfigureUserRestrictionStatus toDomain() {
    return AddConfigureUserRestrictionStatus(
      addRestrictionStatus: addRestrictionStatus,
      addReturnApprovalLimit: addReturnApprovalLimit,
    );
  }

  factory AddConfigureUserRestrictionDto.fromJson(Map<String, dynamic> json) =>
      _$AddConfigureUserRestrictionDtoFromJson(json);
}

String addRestrictionOverride(Map json, String key) =>
    json[key]?['status'] ?? '';

bool addReturnApprovalLimitOverride(Map json, String key) =>
    json[key]?['status'] ?? false;
