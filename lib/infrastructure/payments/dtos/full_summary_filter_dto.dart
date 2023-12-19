import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'full_summary_filter_dto.freezed.dart';
part 'full_summary_filter_dto.g.dart';

@freezed
class FullSummaryFilterDto with _$FullSummaryFilterDto {
  const FullSummaryFilterDto._();
  const factory FullSummaryFilterDto({
    @JsonKey(
      name: 'dueDateFrom',
      defaultValue: '',
    )
        required String dueDateFrom,
    @JsonKey(
      name: 'dueDateTo',
      defaultValue: '',
    )
        required String dueDateTo,
    @JsonKey(
      name: 'documentDateFrom',
      defaultValue: '',
    )
        required String documentDateFrom,
    @JsonKey(
      name: 'documentDateTo',
      defaultValue: '',
    )
        required String documentDateTo,
    @JsonKey(
      name: 'amountValueFrom',
      defaultValue: '',
    )
        required String amountValueFrom,
    @JsonKey(
      name: 'amountValueTo',
      defaultValue: '',
    )
        required String amountValueTo,
    @JsonKey(
      name: 'filterStatuses',
      defaultValue: '',
    )
        required String filterStatuses,
    @JsonKey(
      name: 'accountingDocument',
      defaultValue: '',
    )
        required String searchKey,
  }) = _FullSummaryFilterDto;

  factory FullSummaryFilterDto.fromDomain(
    FullSummaryFilter tempFilter,
  ) {
    return FullSummaryFilterDto(
      dueDateFrom: tempFilter.dueDateFrom.apiDateWithDashString,
      dueDateTo: tempFilter.dueDateTo.apiDateWithDashString,
      documentDateTo: tempFilter.documentDateTo.apiDateWithDashString,
      documentDateFrom: tempFilter.documentDateFrom.apiDateWithDashString,
      amountValueFrom: tempFilter.amountValueFrom.apiParameterValue,
      amountValueTo: tempFilter.amountValueTo.apiParameterValue,
      filterStatuses: tempFilter.filterStatuses.join(','),
      searchKey: tempFilter.searchKey.getOrDefaultValue(''),
    );
  }

  factory FullSummaryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$FullSummaryFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList => <Map<String, String>>[];
}
