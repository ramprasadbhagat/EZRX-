import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history.freezed.dart';

@freezed
class OrderHistory with _$OrderHistory {
  const OrderHistory._();
  factory OrderHistory({
    required String materialCode,
    required String materialDescription,
    required int qty,
    required double unitPrice,
    required double totalPrice,
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
  }) = _OrderHistory;

  factory OrderHistory.empty() => OrderHistory(
        materialCode: '',
        materialDescription: '',
        qty: 0,
        unitPrice: 0.0,
        totalPrice: 0.0,
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
