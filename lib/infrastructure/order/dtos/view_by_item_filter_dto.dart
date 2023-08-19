import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_filter_dto.freezed.dart';
part 'view_by_item_filter_dto.g.dart';

@freezed
class ViewByItemFilterDto with _$ViewByItemFilterDto {
  const ViewByItemFilterDto._();
  const factory ViewByItemFilterDto({
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
  }) = _ViewByItemFilterDto;

  factory ViewByItemFilterDto.fromDomain(
    ViewByItemFilter viewByItemFilter,
  ) {
    return ViewByItemFilterDto(
      orderStatus: viewByItemFilter.orderStatusList
          .map((e) => e.getOrCrash())
          .toList(),
      dateTo: viewByItemFilter.toDate.apiDateTimeString,
      dateFrom: viewByItemFilter.fromDate.apiDateTimeString,
    );
  }

  factory ViewByItemFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByItemFilterDtoFromJson(json);
}
