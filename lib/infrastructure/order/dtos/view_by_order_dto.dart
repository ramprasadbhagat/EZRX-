import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_header_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_dto.freezed.dart';
part 'view_by_order_dto.g.dart';

@freezed
class ViewByOrderHistoryDto with _$ViewByOrderHistoryDto {
  const ViewByOrderHistoryDto._();
  const factory ViewByOrderHistoryDto({
    @JsonKey(name: 'orderCount', defaultValue: 0)
        required int orderCount,
    @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
        required List<String> creatingOrderIds,
    @JsonKey(
      name: 'orderHeaders',
      defaultValue: <OrderHistoryDetailsOrderHeadersDto>[],
    )
        required List<OrderHistoryDetailsOrderHeadersDto> orderHeaders,
  }) = _ViewByOrderHistoryDto;
  factory ViewByOrderHistoryDto.fromDomain(
    ViewByOrderHistory viewByOrderHistory,
  ) {
    return ViewByOrderHistoryDto(
      creatingOrderIds: viewByOrderHistory.creatingOrderIds,
      orderHeaders: List.from(viewByOrderHistory.orderHeaders)
          .map((e) => OrderHistoryDetailsOrderHeadersDto.fromDomain(e))
          .toList(),
      orderCount: viewByOrderHistory.orderCount,
    );
  }
  ViewByOrderHistory toDomain() {
    return ViewByOrderHistory(
      orderCount: orderCount,
      creatingOrderIds: creatingOrderIds,
      orderHeaders: orderHeaders.map((e) => e.toDomain()).toList(),
    );
  }

  factory ViewByOrderHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$ViewByOrderHistoryDtoFromJson(json);
}
