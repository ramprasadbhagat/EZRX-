import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_group.freezed.dart';

@freezed
class ViewByOrderHistoryGroup with _$ViewByOrderHistoryGroup {
  factory ViewByOrderHistoryGroup({
    required DateTimeStringValue createdDate,
    required List<OrderHistoryDetailsOrderHeader> orderHeaders,
  }) = _ViewByOrderHistoryGroup;

  factory ViewByOrderHistoryGroup.empty() => ViewByOrderHistoryGroup(
        createdDate: DateTimeStringValue(''),
        orderHeaders: <OrderHistoryDetailsOrderHeader>[],
      );
}
