import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

part 'order_history_item.freezed.dart';

@freezed
class OrderHistoryItem with _$OrderHistoryItem {
  const OrderHistoryItem._();
  factory OrderHistoryItem({
    required MaterialNumber materialNumber,
    required String materialDescription,
    required int qty,
    required ZpPrice unitPrice,
    required TotalPrice totalPrice,
    required String status,
    required String deliveryDate,
    required String deliveryTime,
    required String lineNumber,
    required double tax,
    required String orderType,
    required String orderNumber,
    required String ezrxNumber,
    required String createdDate,
    required String createdTime,
    required String orderBy,
    required String purchaseOrderType,
  }) = _OrderHistoryItem;

  factory OrderHistoryItem.empty() => OrderHistoryItem(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        status: '',
        deliveryDate: '',
        deliveryTime: '',
        lineNumber: '',
        tax: 0.0,
        orderType: '',
        orderNumber: '',
        ezrxNumber: '',
        createdDate: '',
        createdTime: '',
        orderBy: '',
        purchaseOrderType: '',
      );
}
