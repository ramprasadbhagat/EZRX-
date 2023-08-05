import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

part 'approval_limits_dto.freezed.dart';
part 'approval_limits_dto.g.dart';

@freezed
class ApprovalLimitsDto with _$ApprovalLimitsDto {
  const ApprovalLimitsDto._();

  const factory ApprovalLimitsDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'valueLowerLimit', defaultValue: 0)
        required int valueLowerLimit,
    @JsonKey(name: 'valueUpperLimit', defaultValue: 0)
        required int valueUpperLimit,
    @JsonKey(name: 'username', defaultValue: '') required String username,
    @JsonKey(name: 'uuid', defaultValue: '') required String uuid,
  }) = _ApprovalLimitsDto;

  ApprovalLimits toDomain() {
    return ApprovalLimits(
      userName: Username(username),
      salesOrg: SalesOrg(salesOrg),
      valueLowerLimit: ApprovalLimit(valueLowerLimit),
      valueUpperLimit: ApprovalLimit(valueUpperLimit),
      uuid: uuid,
    );
  }

  factory ApprovalLimitsDto.fromJson(Map<String, dynamic> json) =>
      _$ApprovalLimitsDtoFromJson(json);
}
