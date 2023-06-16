import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
    @JsonKey(name: 'Status', defaultValue: '') required String status,
    @JsonKey(name: 'DeliveryDate') required String deliveryDate,
    @JsonKey(name: 'DeliveryTime') required String deliveryTime,
    @JsonKey(name: 'LineNumber') required String lineNumber,
    @JsonKey(name: 'Tax', defaultValue: 0.0) required double tax,
    @JsonKey(name: 'OrderType') required String orderType,
    @JsonKey(name: 'OrderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'EZRXNumber') required String ezrxNumber,
    @JsonKey(name: 'CreatedDate') required String createdDate,
    @JsonKey(name: 'CreatedTime') required String createdTime,
    @JsonKey(name: 'OrderBy') required String orderBy,
    @JsonKey(name: 'PurchaseOrderType') required String purchaseOrderType,
    @JsonKey(name: 'DefaultMaterialDescription')
        required String defaultMaterialDescription,
    @JsonKey(name: 'WarehouseStorageCondition')
        required String warehouseStorageCondition,
    @JsonKey(name: 'Batch') required String batch,
    @JsonKey(name: 'Available') required bool available,
    @JsonKey(name: 'IsMarketplace') required bool isMarketplace,
    @JsonKey(name: 'IsBonusMaterial') required bool isBonusMaterial,
    @JsonKey(name: 'GovernmentMaterialCode')
        required String governmentMaterialCode,
    @JsonKey(name: 'TelephoneNumber') required String telephoneNumber,
    @JsonKey(name: 'Seller') required String seller,
    @JsonKey(name: 'InvoiceNumber') required String invoiceNumber,
    @JsonKey(name: 'POReference') required String pOReference,
    @JsonKey(name: 'ManufactureName') required String manufactureName,
    @JsonKey(name: 'ExpiryDate') required String expiryDate,
  }) = _OrderHistoryItemDto;
  factory OrderHistoryItemDto.fromDomain(OrderHistoryItem orderHistoryItem) {
    return OrderHistoryItemDto(
      materialNumber: orderHistoryItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryItem.materialDescription,
      qty: orderHistoryItem.qty,
      unitPrice: orderHistoryItem.unitPrice.zpPrice,
      totalPrice: orderHistoryItem.totalPrice.totalPrice,
      status: orderHistoryItem.status.getOrCrash(),
      deliveryDate: orderHistoryItem.deliveryDate.toValidDateString,
      deliveryTime: orderHistoryItem.deliveryTime,
      lineNumber: orderHistoryItem.lineNumber,
      tax: orderHistoryItem.tax,
      orderType: orderHistoryItem.orderType,
      orderNumber: orderHistoryItem.orderNumber.getOrCrash(),
      ezrxNumber: orderHistoryItem.ezrxNumber,
      createdDate: orderHistoryItem.createdDate.toValidDateString,
      createdTime: orderHistoryItem.createdTime,
      orderBy: orderHistoryItem.orderBy,
      purchaseOrderType: orderHistoryItem.purchaseOrderType,
      defaultMaterialDescription: orderHistoryItem.defaultMaterialDescription,
      warehouseStorageCondition: orderHistoryItem.warehouseStorageCondition,
      batch: orderHistoryItem.batch,
      available: orderHistoryItem.available,
      isMarketplace: orderHistoryItem.isMarketplace,
      isBonusMaterial: orderHistoryItem.isBonusMaterial,
      governmentMaterialCode: orderHistoryItem.governmentMaterialCode,
      telephoneNumber: orderHistoryItem.telephoneNumber,
      seller: orderHistoryItem.seller,
      invoiceNumber: orderHistoryItem.invoiceNumber,
      pOReference: orderHistoryItem.pOReference,
      manufactureName: orderHistoryItem.manufactureName,
      expiryDate: orderHistoryItem.expiryDate.toValidDateString,
    );
  }
  OrderHistoryItem toDomain() {
    return OrderHistoryItem(
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      qty: qty,
      unitPrice: ZpPrice(unitPrice.toString()),
      totalPrice: TotalPrice(totalPrice.toString()),
      status: StatusType(status),
      deliveryDate: DateTimeStringValue(deliveryDate),
      deliveryTime: deliveryTime,
      lineNumber: lineNumber,
      tax: tax,
      orderType: orderType,
      orderNumber: OrderNumber(orderNumber),
      ezrxNumber: ezrxNumber,
      createdDate: DateTimeStringValue(createdDate),
      createdTime: createdTime,
      orderBy: orderBy,
      purchaseOrderType: purchaseOrderType,
      available: available,
      batch: batch,
      expiryDate: DateTimeStringValue(expiryDate),
      defaultMaterialDescription: defaultMaterialDescription,
      governmentMaterialCode: governmentMaterialCode,
      invoiceNumber: invoiceNumber,
      warehouseStorageCondition: warehouseStorageCondition,
      isBonusMaterial: isBonusMaterial,
      isMarketplace: isMarketplace,
      manufactureName: manufactureName,
      pOReference: pOReference,
      seller: seller,
      telephoneNumber: telephoneNumber,
    );
  }

  factory OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemDtoFromJson(json);
}

