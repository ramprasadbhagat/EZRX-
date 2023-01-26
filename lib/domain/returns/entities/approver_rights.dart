import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';




part 'approver_rights.freezed.dart';

@freezed
class ApproverRights with _$ApproverRights {
  const ApproverRights._();

  const factory ApproverRights({
    required Username userName,
    required List<ApproverRightsDetails> approverRightsList,
    
  }) = _ApproverRights;

   factory ApproverRights.empty() => ApproverRights(
       approverRightsList: <ApproverRightsDetails>[],
       userName: Username(''),
      );
}
