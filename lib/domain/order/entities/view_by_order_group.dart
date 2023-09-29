import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_group.freezed.dart';

@freezed
class ViewByOrdersGroup with _$ViewByOrdersGroup {
  factory ViewByOrdersGroup({
    required DateTimeStringValue createdDate,
    required PrincipalName principalName,
    required List<OrderHistoryDetails> orderHeaders,
    required List<OrderHistoryDetailsOrderItem> viewByOrderItem,
  }) = _ViewByOrdersGroup;

  factory ViewByOrdersGroup.empty() => ViewByOrdersGroup(
        createdDate: DateTimeStringValue(''),
        orderHeaders: <OrderHistoryDetails>[],
        principalName: PrincipalName(''),
        viewByOrderItem: <OrderHistoryDetailsOrderItem>[],
      );
}
