import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_items_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_request_dto.freezed.dart';
part 'return_summary_request_dto.g.dart';

@freezed
class ReturnSummaryRequestDto with _$ReturnSummaryRequestDto {
  const ReturnSummaryRequestDto._();

  const factory ReturnSummaryRequestDto({
    @JsonKey(name: 'requestStatus', defaultValue: '')
        required String requestStatus,
    @JsonKey(name: 'submitDate', defaultValue: '') required String submitDate,
    @JsonKey(name: 'returnId', defaultValue: '') required String returnId,
    @JsonKey(name: 'refundTotal', defaultValue: '') required String refundTotal,
    @JsonKey(name: 'items', defaultValue: [])
        required List<ReturnSummaryRequestItemsDto> items,
  }) = _ReturnSummaryRequestDto;
  factory ReturnSummaryRequestDto.fromDomain(
    ReturnSummaryRequest returnSummaryRequest,
  ) {
    return ReturnSummaryRequestDto(
      requestStatus: returnSummaryRequest.requestStatus.getOrCrash(),
      submitDate: returnSummaryRequest.submitDate.getOrCrash(),
      returnId: returnSummaryRequest.returnId,
      refundTotal: returnSummaryRequest.refundTotal.toString(),
      items: List.from(returnSummaryRequest.items)
          .map((e) => ReturnSummaryRequestItemsDto.fromDomain(e))
          .toList(),
    );
  }
  ReturnSummaryRequest toDomain() {
    return ReturnSummaryRequest(
      requestStatus: StatusType(requestStatus),
      submitDate: DateTimeStringValue(submitDate),
      returnId: returnId,
      refundTotal: double.parse(refundTotal),
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  factory ReturnSummaryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnSummaryRequestDtoFromJson(json);
}
