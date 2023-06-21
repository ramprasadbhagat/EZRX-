import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_filter_dto.freezed.dart';
part 'order_history_filter_dto.g.dart';

@freezed
class OrderHistoryFilterDto with _$OrderHistoryFilterDto {
  const OrderHistoryFilterDto._();
  const factory OrderHistoryFilterDto({
    //TODO: will remove if it's not required in filter purpose

    // @JsonKey(
    //   name: 'orderNumber',
    //   defaultValue: '',
    //   toJson: valueTojson,
    // )
    // required String orderNumber,
    // @JsonKey(
    //   name: 'poReference',
    //   defaultValue: '',
    //   toJson: valueTojson,
    // )
    // required String poReference,
    // @JsonKey(
    //   name: 'materialSearch',
    //   defaultValue: '',
    //   toJson: valueTojson,
    // )
    // required String materialSearch,
    @JsonKey(
      name: 'orderStatus',
      defaultValue: [],
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
  }) = _OrderHistoryFilterDto;

  factory OrderHistoryFilterDto.fromDomain(
    OrderHistoryFilter orderHistoryFilter,
  ) {
    return OrderHistoryFilterDto(
      //TODO: will remove if it's not required in filter purpose

      // orderNumber: orderHistoryFilter.orderId.searchValueOrEmpty,
      // poReference: orderHistoryFilter.poNumber.searchValueOrEmpty,
      // materialSearch: orderHistoryFilter.materialSearch.searchValueOrEmpty,
      // principalSearch: orderHistoryFilter.principalSearch.searchValueOrEmpty,
      orderStatus: [],
      dateTo: orderHistoryFilter.toDate.apiDateTimeFormat,
      dateFrom: orderHistoryFilter.fromDate.apiDateTimeFormat,
    );
  }

  factory OrderHistoryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryFilterDtoFromJson(json);
}

// dynamic valueTojson(String value) => value.isNotEmpty ? value : null;
