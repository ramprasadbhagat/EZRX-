import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_by_user_return_summary_dto.freezed.dart';
part 'requests_by_user_return_summary_dto.g.dart';

@freezed
class ReturnSummaryRequestByUserDto with _$ReturnSummaryRequestByUserDto {
  const ReturnSummaryRequestByUserDto._();

  const factory ReturnSummaryRequestByUserDto({
    @JsonKey(name: 'requestIds', defaultValue: [])
        required List<String> requestIds,
    @JsonKey(name: 'requests', defaultValue: [])
        required List<ReturnSummaryRequestDto> requests,
  }) = _ReturnSummaryRequestByUserDto;

  factory ReturnSummaryRequestByUserDto.fromDomain(
    ReturnSummaryRequestByUser returnSummaryRequestByUser,
  ) {
    return ReturnSummaryRequestByUserDto(
      requestIds: returnSummaryRequestByUser.requestIds,
      requests: List.from(returnSummaryRequestByUser.requests)
          .map((e) => ReturnSummaryRequestDto.fromDomain(e))
          .toList(),
    );
  }

  ReturnSummaryRequestByUser toDomain() {
    return ReturnSummaryRequestByUser(
      requestIds: requestIds,
      requests: requests.map((e) => e.toDomain()).toList(),
    );
  }

  factory ReturnSummaryRequestByUserDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReturnSummaryRequestByUserDtoFromJson(json);
}
