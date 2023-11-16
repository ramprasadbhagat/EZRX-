import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';

part 'order_history_item_dto.freezed.dart';
part 'order_history_item_dto.g.dart';

@freezed
class OrderHistoryItemDto with _$OrderHistoryItemDto {
  const OrderHistoryItemDto._();
  const factory OrderHistoryItemDto({
    @JsonKey(name: 'MaterialCode', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'UnitPrice', defaultValue: 0.0) required double unitPrice,
    @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required double totalPrice,
    @JsonKey(name: 'Status', defaultValue: '') required String status,
    @JsonKey(name: 'DeliveryDate', defaultValue: '')
        required String deliveryDate,
    @JsonKey(name: 'OrderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'CreatedDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'OrderBy', defaultValue: '') required String orderBy,
    @JsonKey(name: 'OrderType', defaultValue: '') required String orderType,
    @JsonKey(name: 'Batch', defaultValue: '') required String batch,
    @JsonKey(name: 'IsBonusMaterial', defaultValue: false)
        required bool isBonusMaterial,
    @JsonKey(name: 'TelephoneNumber', defaultValue: '')
        required String telephoneNumber,
    @JsonKey(name: 'InvoiceNumber', defaultValue: '')
        required String invoiceNumber,
    @JsonKey(name: 'POReference', defaultValue: '') required String pOReference,
    @JsonKey(name: 'ManufactureName', defaultValue: '')
        required String manufactureName,
    @JsonKey(name: 'ExpiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
        required String requestedDeliveryDate,
    @JsonKey(name: 'SpecialInstructions', defaultValue: '')
        required String specialInstruction,
    @JsonKey(name: 'Tax', defaultValue: 0.0) required double tax,
    @JsonKey(name: 'EZRXNumber', defaultValue: '') required String eZRXNumber,
    @JsonKey(name: 'poAttachment', defaultValue: <PoDocumentsDto>[])
        required List<PoDocumentsDto> orderHistoryItemPoAttachments,
    @JsonKey(name: 'promoStatus', defaultValue: false)
        required bool promoStatus,
    @JsonKey(name: 'IsBundle', defaultValue: false) required bool isBundle,
    @JsonKey(name: 'LineNumber', defaultValue: '') required String lineNumber,
  }) = _OrderHistoryItemDto;
  factory OrderHistoryItemDto.fromDomain(OrderHistoryItem orderHistoryItem) {
    return OrderHistoryItemDto(
      materialNumber: orderHistoryItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryItem.materialDescription,
      qty: orderHistoryItem.qty,
      unitPrice: orderHistoryItem.unitPrice.zpPrice,
      totalPrice: orderHistoryItem.totalPrice.totalPrice,
      status: orderHistoryItem.status.getOrCrash(),
      deliveryDate: orderHistoryItem.deliveryDate.dateString,
      orderNumber: orderHistoryItem.orderNumber.getOrCrash(),
      createdDate: orderHistoryItem.createdDate.dateString,
      tax: orderHistoryItem.tax,
      batch: orderHistoryItem.batch.getOrCrash(),
      orderBy: orderHistoryItem.orderBy,
      orderType: orderHistoryItem.orderType.getOrCrash(),
      isBonusMaterial: orderHistoryItem.isBonusMaterial,
      telephoneNumber: orderHistoryItem.telephoneNumber.displayTelephoneNumber,
      invoiceNumber:
          orderHistoryItem.invoiceData.invoiceNumber.getOrDefaultValue(''),
      pOReference: orderHistoryItem.pOReference.displayPOReference,
      manufactureName: orderHistoryItem.manufactureName,
      expiryDate: orderHistoryItem.expiryDate.dateString,
      requestedDeliveryDate: orderHistoryItem.requestedDeliveryDate.dateString,
      specialInstruction:
          orderHistoryItem.specialInstructions.displaySpecialInstructions,
      orderHistoryItemPoAttachments:
          List.from(orderHistoryItem.orderHistoryItemPoAttachments)
              .map((e) => PoDocumentsDto.fromDomain(e))
              .toList(),
      eZRXNumber: orderHistoryItem.ezrxNumber.getOrDefaultValue(''),
      isBundle: orderHistoryItem.isBundle,
      promoStatus: orderHistoryItem.promoStatus,
      lineNumber: orderHistoryItem.lineNumber.getOrDefaultValue(''),
    );
  }
  OrderHistoryItem toDomain() {
    return OrderHistoryItem(
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      qty: qty,
      unitPrice: ZpPrice(unitPrice.toString()),
      totalPrice: TotalPrice(totalPrice.toString()),
      status: OrderStepValue(status),
      deliveryDate: DateTimeStringValue(deliveryDate),
      orderNumber: OrderNumber(orderNumber),
      createdDate: DateTimeStringValue(createdDate),
      tax: tax,
      batch: StringValue(batch),
      orderBy: orderBy,
      orderType: DocumentType(orderType),
      expiryDate: DateTimeStringValue(expiryDate),
      invoiceData: InvoiceData.empty()
          .copyWith(invoiceNumber: StringValue(invoiceNumber)),
      isBonusMaterial: isBonusMaterial,
      manufactureName: manufactureName,
      pOReference: POReference(pOReference),
      telephoneNumber: PhoneNumber(telephoneNumber),
      productImages: ProductImages.empty(),
      requestedDeliveryDate: DateTimeStringValue(requestedDeliveryDate),
      specialInstructions: SpecialInstructions(specialInstruction),
      orderHistoryItemPoAttachments:
          orderHistoryItemPoAttachments.map((e) => e.toDomain()).toList(),
      ezrxNumber: StringValue(eZRXNumber),
      isBundle: isBundle,
      promoStatus: promoStatus,
      lineNumber: LineNumber(lineNumber),
    );
  }

  factory OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemDtoFromJson(json);
}
