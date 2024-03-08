import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_payment_term_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_dto.freezed.dart';
part 'order_history_details_dto.g.dart';

@freezed
class OrderHistoryDetailsDto with _$OrderHistoryDetailsDto {
  const OrderHistoryDetailsDto._();
  const factory OrderHistoryDetailsDto({
    @JsonKey(name: 'OrderValue', defaultValue: 0.0)
        required double orderValue,
    @JsonKey(name: 'TotalTax', defaultValue: 0)
        required double totalTax,
    @JsonKey(name: 'DeliveryFee', defaultValue: 0)
        required double deliveryFee,
    @JsonKey(name: 'ManualFee', defaultValue: 0)
        required double manualFee,
    @JsonKey(name: 'TotalValue', defaultValue: 0)
        required double totalValue,
    @JsonKey(name: 'TotalDiscount', defaultValue: 0)
        required double totalDiscount,
    @JsonKey(name: 'ProcessingStatus', defaultValue: '')
        required String processingStatus,
    @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
        required String requestedDeliveryDate,
    @JsonKey(name: 'ExpectedDeliveryDate', defaultValue: '')
        required String expectedDeliveryDate,
    @JsonKey(name: 'Type', defaultValue: '')
        required String type,
    @JsonKey(name: 'TelephoneNumber', defaultValue: '')
        required String telephoneNumber,
    @JsonKey(name: 'CreatedDate', defaultValue: '')
        required String createdDate,
    @JsonKey(name: 'EZRXNumber', defaultValue: '')
        required String eZRXNumber,
    @JsonKey(name: 'OrderBy', defaultValue: '')
        required String orderBy,
    @JsonKey(name: 'ReferenceNotes', defaultValue: '')
        required String referenceNotes,
    @JsonKey(name: 'CompanyName', defaultValue: '')
        required String companyName,
    @JsonKey(name: 'OrderNumber', defaultValue: '')
        required String orderNumber,
    @JsonKey(name: 'POReference', defaultValue: '')
        required String pOReference,
    @JsonKey(name: 'ShipTo', defaultValue: '')
        required String shipTo,
    @JsonKey(name: 'SoldTo', defaultValue: '')
        required String soldTo,
    @JsonKey(name: 'ShipToAddres', defaultValue: '')
        required String shipToAddress,
    @JsonKey(name: 'SoldToAddress', defaultValue: '')
        required String soldToAddress,
    @JsonKey(name: 'InvoiceNumber', defaultValue: '')
        required String invoiceNumber,
    @JsonKey(name: 'OrderReason', defaultValue: '')
        required String orderReason,
    @JsonKey(name: 'OrderItems', readValue: orderItemOverride)
        required List<OrderHistoryDetailsOrderItemDto>
            orderHistoryDetailsOrderItem,
    @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
        required OrderHistoryDetailsPaymentTermDto
            orderHistoryDetailsPaymentTerm,
    @JsonKey(name: 'SpecialInstructions', readValue: specialInstructionOverride)
        required String orderHistoryDetailsSpecialInstructions,
    @JsonKey(
      name: 'PODocuments',
      readValue: poDocumentOverride,
    )
        required List<PoDocumentsDto> orderHistoryDetailsPoDocuments,
    @JsonKey(name: 'ItmCount', defaultValue: 0)
        required int itemCount,
    @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
        required bool isMarketPlace,
  }) = _OrderHistoryDetailsDto;
  factory OrderHistoryDetailsDto.fromDomain(
    OrderHistoryDetails orderHistoryDetails,
  ) {
    return OrderHistoryDetailsDto(
      totalTax: orderHistoryDetails.totalTax,
      deliveryFee: orderHistoryDetails.deliveryFee,
      manualFee: orderHistoryDetails.manualFee,
      totalDiscount: orderHistoryDetails.manualFee,
      totalValue: orderHistoryDetails.totalValue,
      processingStatus:
          orderHistoryDetails.processingStatus.getOrDefaultValue(''),
      requestedDeliveryDate:
          orderHistoryDetails.requestedDeliveryDate.dateString,
      expectedDeliveryDate: orderHistoryDetails.expectedDeliveryDate.dateString,
      type: orderHistoryDetails.type.documentTypeCode,
      telephoneNumber:
          orderHistoryDetails.telephoneNumber.displayTelephoneNumber,
      orderValue: orderHistoryDetails.orderValue,
      createdDate: orderHistoryDetails.createdDate.getValue(),
      eZRXNumber: orderHistoryDetails.eZRXNumber,
      orderBy: orderHistoryDetails.orderBy.getOrDefaultValue(''),
      referenceNotes: orderHistoryDetails.referenceNotes,
      companyName: orderHistoryDetails.companyName.getValue(),
      orderNumber: orderHistoryDetails.orderNumber.getValue(),
      pOReference: orderHistoryDetails.pOReference.displayPOReference,
      shipTo: orderHistoryDetails.shipTo,
      soldTo: orderHistoryDetails.soldTo,
      shipToAddress: orderHistoryDetails.shipToAddress,
      soldToAddress: orderHistoryDetails.soldToAddress,
      invoiceNumber: orderHistoryDetails.invoiceNumber.getOrDefaultValue(''),
      orderReason: orderHistoryDetails.orderReason,
      orderHistoryDetailsOrderItem:
          List.from(orderHistoryDetails.orderHistoryDetailsOrderItem)
              .map((e) => OrderHistoryDetailsOrderItemDto.fromDomain(e))
              .toList(),
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromDomain(
        orderHistoryDetails.orderHistoryDetailsPaymentTerm,
      ),
      orderHistoryDetailsSpecialInstructions: orderHistoryDetails
          .orderHistoryDetailsSpecialInstructions.displaySpecialInstructions,
      orderHistoryDetailsPoDocuments:
          List.from(orderHistoryDetails.orderHistoryDetailsPoDocuments)
              .map((e) => PoDocumentsDto.fromDomain(e))
              .toList(),
      itemCount: orderHistoryDetails.orderItemsCount,
      isMarketPlace: orderHistoryDetails.isMarketPlace,
    );
  }

  OrderHistoryDetails toDomain() {
    return OrderHistoryDetails(
      deliveryFee: deliveryFee,
      manualFee: manualFee,
      totalDiscount: totalDiscount,
      totalValue: totalValue,
      totalTax: totalTax,
      processingStatus: OrderStepValue(processingStatus),
      requestedDeliveryDate: DateTimeStringValue(requestedDeliveryDate),
      expectedDeliveryDate: DateTimeStringValue(expectedDeliveryDate),
      type: DocumentType(type),
      telephoneNumber: PhoneNumber(telephoneNumber),
      orderValue: orderValue,
      createdDate: DateTimeStringValue(createdDate),
      eZRXNumber: eZRXNumber,
      orderBy: StringValue(orderBy),
      referenceNotes: referenceNotes,
      companyName: CompanyName(companyName),
      orderNumber: OrderNumber(orderNumber),
      pOReference: POReference(pOReference),
      shipTo: shipTo,
      soldTo: soldTo,
      shipToAddress: shipToAddress,
      soldToAddress: soldToAddress,
      invoiceNumber: StringValue(invoiceNumber),
      orderReason: orderReason,
      orderHistoryDetailsOrderItem:
          orderHistoryDetailsOrderItem.map((dto) => dto.toDomain()).toList(),
      orderHistoryDetailsPaymentTerm: orderHistoryDetailsPaymentTerm.toDomain(),
      orderHistoryDetailsSpecialInstructions:
          SpecialInstructions(orderHistoryDetailsSpecialInstructions),
      orderHistoryDetailsPoDocuments:
          orderHistoryDetailsPoDocuments.map((dto) => dto.toDomain()).toList(),
      itemCount: itemCount,
      isMarketPlace: isMarketPlace,
    );
  }

  factory OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsDtoFromJson(json);
}

List poDocumentOverride(Map json, String key) => json[key] ?? [];
Map<String, dynamic> paymentTermOverride(Map json, String key) =>
    json[key] ?? {};
String specialInstructionOverride(Map json, String key) => json[key] ?? '';
List orderItemOverride(Map json, String key) => json[key] ?? [];
