import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_rights_details_dto.freezed.dart';
part 'approver_rights_details_dto.g.dart';

@freezed
class ApproverRightsDetailsDto with _$ApproverRightsDetailsDto {
  const ApproverRightsDetailsDto._();

  const factory ApproverRightsDetailsDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'principal', defaultValue: '') required String principal,
    @JsonKey(name: 'industryCode1', defaultValue: '')
        required String industryCode1,
    @JsonKey(name: 'industryCode2', defaultValue: '')
        required String industryCode2,
    @JsonKey(name: 'industryCode3', defaultValue: '')
        required String industryCode3,
    @JsonKey(name: 'industryCode4', defaultValue: '')
        required String industryCode4,
    @JsonKey(name: 'industryCode5', defaultValue: '')
        required String industryCode5,
    @JsonKey(name: 'plant', defaultValue: '') required String plant,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'uuid', defaultValue: '') required String uuid,
  }) = _ApproverRightsDetailsDto;

  ApproverRightsDetails toDomain() {
    return ApproverRightsDetails(
      industryCode1: industryCode1,
      industryCode2: industryCode2,
      industryCode3: industryCode3,
      industryCode4: industryCode4,
      industryCode5: industryCode5,
      materialNumber: MaterialNumber(materialNumber),
      plant: plant,
      principal: principal,
      salesOrg: SalesOrg(salesOrg),
      uuid: uuid,
    );
  }

  factory ApproverRightsDetailsDto.fromDomain(
    ApproverRightsDetails approverRightsDetails,
  ) {
    return ApproverRightsDetailsDto(
      industryCode1: approverRightsDetails.industryCode1,
      industryCode2: approverRightsDetails.industryCode2,
      industryCode3: approverRightsDetails.industryCode3,
      industryCode4: approverRightsDetails.industryCode4,
      industryCode5: approverRightsDetails.industryCode5,
      materialNumber: approverRightsDetails.materialNumber.getValue(),
      plant: approverRightsDetails.plant,
      principal: approverRightsDetails.principal,
      salesOrg: approverRightsDetails.salesOrg.getValue(),
      uuid: approverRightsDetails.uuid,
    );
  }

  factory ApproverRightsDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ApproverRightsDetailsDtoFromJson(json);
}

Map<String, dynamic> getConfigurableApproverRights(
  ApproverRightsDetails approverRightsDetails,
) {
  final approverRights =
      ApproverRightsDetailsDto.fromDomain(approverRightsDetails).toJson();
  approverRights.remove('uuid');

  return approverRights;
}
