import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_details_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_tender_contract_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_items_dto.freezed.dart';
part 'order_history_details_order_items_dto.g.dart';

@freezed
class OrderHistoryDetailsOrderItemDto with _$OrderHistoryDetailsOrderItemDto {
  const OrderHistoryDetailsOrderItemDto._();
  const factory OrderHistoryDetailsOrderItemDto({
    @JsonKey(name: 'SAPStatus',defaultValue: '') required String sAPStatus,
    @JsonKey(name: 'PlannedDeliveryDate',defaultValue: '') required String plannedDeliveryDate,
    @JsonKey(name: 'PickedQuantity',defaultValue: 0) required int pickedQuantity,
    @JsonKey(name: 'Batch',defaultValue: '') required String batch,
    @JsonKey(name: 'ExpiryDate',defaultValue: '') required String expiryDate,
    @JsonKey(name: 'LineReferenceNotes',defaultValue: '') required String lineReferenceNotes,
    @JsonKey(name: 'IsTenderContractMaterial',defaultValue: false,readValue: boolStringFormatCheck)
        required bool isTenderContractMaterial,
    @JsonKey(name: 'Details',defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[]) required List<OrderHistoryDetailsOrderItemDetailsDto> details,
    @JsonKey(name: 'TenderContractDetails',readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
        required OrderHistoryDetailsOrderItemTenderContractDetailsDto tenderContractDetails,
  }) = _OrderHistoryDetailsOrderItemDto;
  factory OrderHistoryDetailsOrderItemDto.fromDomain(OrderHistoryDetailsOrderItem orderHistoryDetailsOrderItem) {
    return OrderHistoryDetailsOrderItemDto(
      sAPStatus: orderHistoryDetailsOrderItem.sAPStatus,
      plannedDeliveryDate: orderHistoryDetailsOrderItem.plannedDeliveryDate,
      pickedQuantity: orderHistoryDetailsOrderItem.pickedQuantity,
      batch: orderHistoryDetailsOrderItem.batch,
      expiryDate: orderHistoryDetailsOrderItem.expiryDate,
      lineReferenceNotes: orderHistoryDetailsOrderItem.lineReferenceNotes,
      isTenderContractMaterial: orderHistoryDetailsOrderItem.isTenderContractMaterial,
      details: List.from(orderHistoryDetailsOrderItem.details)
          .map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromDomain(e))
          .toList(),
      tenderContractDetails:
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(orderHistoryDetailsOrderItem.tenderContractDetails),
    );
  }

  OrderHistoryDetailsOrderItem toDomain() {
    return OrderHistoryDetailsOrderItem(
      sAPStatus: sAPStatus,
      plannedDeliveryDate: plannedDeliveryDate,
      pickedQuantity: pickedQuantity,
      batch: batch,
      expiryDate: expiryDate,
      lineReferenceNotes: lineReferenceNotes,
      isTenderContractMaterial: isTenderContractMaterial,
      details: details.map((e) => e.toDomain()).toList(),
      tenderContractDetails: OrderHistoryDetailsOrderItemTenderContractDetails(
        tenderContractNumber: tenderContractDetails.tenderContractNumber,
        tenderContractReference: tenderContractDetails.tenderContractReference,
        tenderPackageDescription:
            tenderContractDetails.tenderPackageDescription,
      ),
    );
  }

  factory OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsOrderItemDtoFromJson(json);
}
Map<String, dynamic> orderHistoryDetailsOrderItemTenderContractDetailsOverride(Map json, String key) =>
    json[key] ?? {};
    bool boolStringFormatCheck(Map json, String key) =>
    json[key] == '' ? false : json[key];