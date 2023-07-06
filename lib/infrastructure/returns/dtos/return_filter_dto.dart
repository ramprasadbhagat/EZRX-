import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_filter_dto.freezed.dart';
part 'return_filter_dto.g.dart';

@freezed
class ReturnFilterDto with _$ReturnFilterDto {
  const ReturnFilterDto._();
  const factory ReturnFilterDto({
    @JsonKey(
      name: 'dateFrom',
      defaultValue: '',
    )
        required String dateFrom,
    @JsonKey(
      name: 'dateTo',
      defaultValue: '',
    )
        required String dateTo,
    @JsonKey(
      name: 'refundTotalFrom',
      defaultValue: '',
    )
        required String refundTotalFrom,
    @JsonKey(
      name: 'refundTotalTo',
      defaultValue: '',
    )
        required String refundTotalTo,
    @JsonKey(
      name: 'status',
      defaultValue: <String>[],
    )
        required List<String> statusList,
  }) = _ReturnFilterDto;

  factory ReturnFilterDto.fromDomain(
    ReturnFilter returnFilter,
  ) {
    return ReturnFilterDto(
      statusList:
          returnFilter.returnStatusList.map((e) => e.getOrCrash()).toList(),
      dateTo: returnFilter.returnDateTo.apiDateTimeFormat,
      dateFrom: returnFilter.returnDateFrom.apiDateTimeFormat,
      refundTotalFrom: returnFilter.amountValueFrom.apiParameterValue,
      refundTotalTo: returnFilter.amountValueTo.apiParameterValue,
    );
  }

  factory ReturnFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnFilterDtoFromJson(json);

  Map<String, dynamic> get toMapList {
    final filterMap = <String, dynamic>{};
    dateFrom.isNotEmpty
        ? filterMap.putIfAbsent('dateFrom', () => dateFrom)
        : null;
    dateTo.isNotEmpty ? filterMap.putIfAbsent('dateTo', () => dateTo) : null;
    refundTotalFrom.isNotEmpty
        ? filterMap.putIfAbsent('refundTotalFrom', () => refundTotalFrom)
        : null;
    refundTotalTo.isNotEmpty
        ? filterMap.putIfAbsent('refundTotalTo', () => refundTotalTo)
        : null;
    statusList.isNotEmpty
        ? filterMap.putIfAbsent('status', () => statusList)
        : null;

    return filterMap;
  }
}
