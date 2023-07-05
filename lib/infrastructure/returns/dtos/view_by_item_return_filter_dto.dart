import 'package:ezrxmobile/domain/returns/entities/view_by_item_return_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_return_filter_dto.freezed.dart';
part 'view_by_item_return_filter_dto.g.dart';

@freezed
class ViewByItemReturnFilterDto with _$ViewByItemReturnFilterDto {
  const ViewByItemReturnFilterDto._();
  const factory ViewByItemReturnFilterDto({
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
  }) = _ViewByItemReturnFilterDto;

  factory ViewByItemReturnFilterDto.fromDomain(
    ViewByItemReturnFilter viewByItemReturnFilter,
  ) {
    return ViewByItemReturnFilterDto(
      statusList: viewByItemReturnFilter.returnStatusList
          .map((e) => e.getOrCrash())
          .toList(),
      dateTo: viewByItemReturnFilter.returnDateTo.apiDateTimeFormat,
      dateFrom: viewByItemReturnFilter.returnDateFrom.apiDateTimeFormat,
      refundTotalFrom: viewByItemReturnFilter.amountValueFrom.apiParameterValue,
      refundTotalTo: viewByItemReturnFilter.amountValueTo.apiParameterValue,
    );
  }

  factory ViewByItemReturnFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByItemReturnFilterDtoFromJson(json);

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
