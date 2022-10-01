import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_dto.freezed.dart';
part 'order_history_dto.g.dart';

@freezed
class OrderHistoryDto with _$OrderHistoryDto {
  const OrderHistoryDto._();
  const factory OrderHistoryDto({
    @JsonKey(name: 'MaterialCode') required String materialCode,
    @JsonKey(name: 'MaterialDescription') required String materialDescription,
    @JsonKey(name: 'Qty') required int qty,
    @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required double unitPrice,
    @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required double totalPrice,
    @JsonKey(name: 'Status', defaultValue: 'NA') required String status,
    @JsonKey(name: 'DeliveryDate') required String deliveryDate,
    @JsonKey(name: 'DeliveryTime') required String deliveryTime,
    @JsonKey(name: 'LineNumber') required String lineNumber,
    @JsonKey(name: 'Tax', defaultValue: 0.0) required double tax,
    @JsonKey(name: 'OrderType') required String orderType,
    @JsonKey(name: 'OrderNumber', defaultValue: 'NA')
        required String orderNumber,
    @JsonKey(name: 'EZRXNumber') required String ezrxNumber,
    @JsonKey(name: 'CreatedDate') required String createdDate,
    @JsonKey(name: 'CreatedTime') required String createdTime,
    @JsonKey(name: 'OrderBy') required String orderBy,
    @JsonKey(name: 'PurchaseOrderType') required String purchaseOrderType,
  }) = _OrderHistoryDto;
  factory OrderHistoryDto.fromDomain(OrderHistory orderHistoryItem) {
    return OrderHistoryDto(
      materialCode: orderHistoryItem.materialCode,
      materialDescription: orderHistoryItem.materialDescription,
      qty: orderHistoryItem.qty,
      unitPrice: orderHistoryItem.unitPrice,
      totalPrice: orderHistoryItem.totalPrice,
      status: orderHistoryItem.status,
      deliveryDate: orderHistoryItem.deliveryDate,
      deliveryTime: orderHistoryItem.deliveryTime,
      lineNumber: orderHistoryItem.lineNumber,
      tax: orderHistoryItem.tax,
      orderType: orderHistoryItem.orderType,
      orderNumber: orderHistoryItem.orderNumber,
      ezrxNumber: orderHistoryItem.ezrxNumber,
      createdDate: orderHistoryItem.createdDate,
      createdTime: orderHistoryItem.createdTime,
      orderBy: orderHistoryItem.orderBy,
      purchaseOrderType: orderHistoryItem.purchaseOrderType,
    );
  }
  OrderHistory toDomain() {
    return OrderHistory(
      materialCode: materialCode,
      materialDescription: materialDescription,
      qty: qty,
      unitPrice: unitPrice,
      totalPrice: totalPrice,
      status: status,
      deliveryDate: deliveryDate,
      deliveryTime: deliveryTime,
      lineNumber: lineNumber,
      tax: tax,
      orderType: orderType,
      orderNumber: orderNumber,
      ezrxNumber: ezrxNumber,
      createdDate: createdDate,
      createdTime: createdTime,
      orderBy: orderBy,
      purchaseOrderType: purchaseOrderType,
    );
  }

  factory OrderHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDtoFromJson(json);
}
