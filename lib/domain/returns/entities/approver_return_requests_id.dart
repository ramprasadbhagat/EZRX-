import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_return_requests_id.freezed.dart';

@freezed
class ApproverReturnRequestsId with _$ApproverReturnRequestsId {
  ApproverReturnRequestsId._();
  factory ApproverReturnRequestsId({
    required String requestId,
  }) = _ApproverReturnRequestsId;

  bool get isValidRequestId => requestId.isNotEmpty;
}
