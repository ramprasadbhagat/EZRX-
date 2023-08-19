import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_by_order_filter_dto.freezed.dart';
part 'view_by_order_filter_dto.g.dart';

@freezed
class ViewByOrdersFilterDto with _$ViewByOrdersFilterDto {
  const ViewByOrdersFilterDto._();
  const factory ViewByOrdersFilterDto({
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
  }) = _ViewByOrdersFilterDto;

  factory ViewByOrdersFilterDto.fromDomain(
    ViewByOrdersFilter viewByOrdersFilter,
  ) {
    return ViewByOrdersFilterDto(
      dateTo: viewByOrdersFilter.toDate.apiDateTimeString,
      dateFrom: viewByOrdersFilter.fromDate.apiDateTimeString,
    );
  }

  factory ViewByOrdersFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByOrdersFilterDtoFromJson(json);
}
