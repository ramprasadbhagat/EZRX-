import 'package:ezrxmobile/domain/order/entities/view_by_item_history_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_history_filter_dto.freezed.dart';
part 'view_by_item_history_filter_dto.g.dart';

@freezed
class ViewByItemHistoryFilterDto with _$ViewByItemHistoryFilterDto {
  const ViewByItemHistoryFilterDto._();
  const factory ViewByItemHistoryFilterDto({
    @JsonKey(
      name: 'orderStatus',
      defaultValue: <String>[],
    )
        required List<String> orderStatus,
    @JsonKey(
      name: 'toDate',
      defaultValue: '',
    )
        required String dateTo,
    @JsonKey(
      name: 'fromDate',
      defaultValue: '',
    )
        required String dateFrom,
  }) = _ViewByItemHistoryFilterDto;

  factory ViewByItemHistoryFilterDto.fromDomain(
    ViewByItemHistoryFilter viewByItemHistoryFilter,
  ) {
    return ViewByItemHistoryFilterDto(
      orderStatus: viewByItemHistoryFilter.orderStatusList
          .map((e) => e.getOrCrash())
          .toList(),
      dateTo: viewByItemHistoryFilter.toDate.apiDateTimeFormat,
      dateFrom: viewByItemHistoryFilter.fromDate.apiDateTimeFormat,
    );
  }

  factory ViewByItemHistoryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByItemHistoryFilterDtoFromJson(json);
}
