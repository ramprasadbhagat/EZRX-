import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_by_order_history_filter_dto.freezed.dart';
part 'view_by_order_history_filter_dto.g.dart';

@freezed
class ViewByOrderHistoryFilterDto with _$ViewByOrderHistoryFilterDto {
  const ViewByOrderHistoryFilterDto._();
  const factory ViewByOrderHistoryFilterDto({
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
  }) = _ViewByOrderHistoryFilterDto;

  factory ViewByOrderHistoryFilterDto.fromDomain(
    ViewByOrderHistoryFilter viewByOrderHistoryFilter,
  ) {
    return ViewByOrderHistoryFilterDto(
      dateTo: viewByOrderHistoryFilter.toDate.apiDateTimeFormat,
      dateFrom: viewByOrderHistoryFilter.fromDate.apiDateTimeFormat,
    );
  }

  factory ViewByOrderHistoryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByOrderHistoryFilterDtoFromJson(json);
}
