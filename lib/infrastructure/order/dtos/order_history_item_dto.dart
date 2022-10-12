import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_item_dto.freezed.dart';
part 'order_history_item_dto.g.dart';

@freezed
class OrderHistoryItemDto with _$OrderHistoryItemDto {
  const OrderHistoryItemDto._();
  const factory OrderHistoryItemDto({
    @JsonKey(name: 'MaterialCode') required String materialNumber,
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
  }) = _OrderHistoryItemDto;
  factory OrderHistoryItemDto.fromDomain(OrderHistoryItem orderHistoryItem) {
    return OrderHistoryItemDto(
      materialNumber: orderHistoryItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryItem.materialDescription,
      qty: orderHistoryItem.qty,
      unitPrice: orderHistoryItem.unitPrice.zpPrice,
      totalPrice: orderHistoryItem.totalPrice.totalPrice,
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
  OrderHistoryItem toDomain() {
    return OrderHistoryItem(
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      qty: qty,
      unitPrice: ZpPrice(unitPrice.toString()),
      totalPrice: TotalPrice(totalPrice.toString()),
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

  factory OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemDtoFromJson(json);
}
