import 'package:ezrxmobile/domain/returns/entities/approver_return_requests_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_return_requests_id_dto.freezed.dart';
part 'approver_return_requests_id_dto.g.dart';

@freezed
class ApproverReturnRequestsIdDto with _$ApproverReturnRequestsIdDto {
  ApproverReturnRequestsIdDto._();

  factory ApproverReturnRequestsIdDto({
    @JsonKey(name: 'requestId', defaultValue: '') required String requestId,
  }) = _ReturnRequestsApproverRequestIdDto;

  ApproverReturnRequestsId toDomain() {
    return ApproverReturnRequestsId(
      requestId: requestId,
    );
  }

  factory ApproverReturnRequestsIdDto.fromJson(Map<String, dynamic> json) =>
      _$ApproverReturnRequestsIdDtoFromJson(json);

  bool get isValidRequestId => requestId.isNotEmpty;
}
