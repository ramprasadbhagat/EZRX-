import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_filter_dto.freezed.dart';
part 'return_summary_filter_dto.g.dart';

@freezed
class ReturnSummaryFilterDto with _$ReturnSummaryFilterDto {
  const ReturnSummaryFilterDto._();
  const factory ReturnSummaryFilterDto({
    @JsonKey(
      name: 'requestId',
      defaultValue: '',
      toJson: valueTojson,
    )
        required String requestId,
    @JsonKey(
      name: 'refundTotalTo',
      defaultValue: '',
      toJson: valueTojson,
    )
        required String refundTotalTo,
    @JsonKey(
      name: 'refundTotalFrom',
      defaultValue: '',
      toJson: valueTojson,
    )
        required String refundTotalFrom,
    @JsonKey(
      name: 'dateTo',
      defaultValue: '',
    )
        required String dateTo,
    @JsonKey(
      name: 'dateFrom',
      defaultValue: '',
    )
        required String dateFrom,
    @JsonKey(
      name: 'status',
      defaultValue: '',
    )
        required String status,
  }) = _ReturnSummaryFilterDto;

  factory ReturnSummaryFilterDto.fromDomain(
    ReturnSummaryFilter returnSummaryFilter,
  ) {
    return ReturnSummaryFilterDto(
      requestId: returnSummaryFilter.requestId.searchValueOrEmpty,
      refundTotalFrom: returnSummaryFilter.refundTotalFrom.apiParameterValue,
      refundTotalTo: returnSummaryFilter.refundTotalTo.apiParameterValue,
      dateTo: returnSummaryFilter.dateTo.apiDateTimeFormat,
      dateFrom: returnSummaryFilter.dateFrom.apiDateTimeFormat,
      status: returnSummaryFilter.sortBy.label,
    );
  }

  factory ReturnSummaryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnSummaryFilterDtoFromJson(json);
}

dynamic valueTojson(String value) => value.isNotEmpty ? value : null;
