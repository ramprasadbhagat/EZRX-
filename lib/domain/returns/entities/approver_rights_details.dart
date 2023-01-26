import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

part 'approver_rights_details.freezed.dart';

@freezed
class ApproverRightsDetails with _$ApproverRightsDetails {
  const ApproverRightsDetails._();

  const factory ApproverRightsDetails({
    required SalesOrg salesOrg,
    required String principal,
    required String industryCode1,
    required String industryCode2,
    required String industryCode3,
    required String industryCode4,
    required String industryCode5,
    required String plant,
    required MaterialNumber materialNumber,
    
  }) = _ApproverRightsDetails;
  factory ApproverRightsDetails.empty() => ApproverRightsDetails(
        industryCode1: '',
        industryCode2: '',
        industryCode3: '',
        industryCode4: '',
        industryCode5: '',
        materialNumber: MaterialNumber(''),
        plant: '',
        principal: '',
        salesOrg: SalesOrg(''),
      );
}
