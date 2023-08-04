import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
      dateTo: returnFilter.returnDateTo.apiDateTimeString,
      dateFrom: returnFilter.returnDateFrom.apiDateTimeString,
      refundTotalFrom: returnFilter.amountValueFrom.apiParameterValue,
      refundTotalTo: returnFilter.amountValueTo.apiParameterValue,
    );
  }

  ReturnFilter toDomain() {
    return ReturnFilter(
      returnStatusList: statusList.map((e) => StatusType(e)).toList(),
      returnDateTo: DateTimeStringValue(dateTo),
      returnDateFrom: DateTimeStringValue(dateFrom),
      amountValueFrom: RangeValue(refundTotalFrom),
      amountValueTo: RangeValue(refundTotalTo),
    );
  }

  factory ReturnFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnFilterDtoFromJson(json);

  Map<String, dynamic> toMap() => toJson()
    ..removeWhere((key, value) =>
        (value is String && value.isEmpty) || (value is List && value.isEmpty));
}
