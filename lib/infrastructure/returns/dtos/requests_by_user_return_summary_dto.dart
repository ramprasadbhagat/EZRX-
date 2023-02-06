import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_by_user_return_summary_dto.freezed.dart';

part 'requests_by_user_return_summary_dto.g.dart';

@freezed
class ReturnSummaryRequestByUserDto with _$ReturnSummaryRequestByUserDto {
  const ReturnSummaryRequestByUserDto._();

  const factory ReturnSummaryRequestByUserDto({
    @JsonKey(name: 'requestID', defaultValue: '') required String requestID,
  }) = _ReturnSummaryRequestByUserDto;

  factory ReturnSummaryRequestByUserDto.fromDomain(
      ReturnSummaryRequestByUser returnSummaryRequestByUser,) {
    return ReturnSummaryRequestByUserDto(
      requestID: returnSummaryRequestByUser.requestID,
    );
  }

  ReturnSummaryRequestByUser toDomain() {
    return ReturnSummaryRequestByUser(
      requestID: requestID,
    );
  }

  factory ReturnSummaryRequestByUserDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReturnSummaryRequestByUserDtoFromJson(json);
}
