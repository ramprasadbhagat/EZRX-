import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_details_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_tender_contract_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_items_dto.freezed.dart';
part 'order_history_details_order_items_dto.g.dart';

@freezed
class OrderHistoryDetailsOrderItemDto with _$OrderHistoryDetailsOrderItemDto {
  const OrderHistoryDetailsOrderItemDto._();
  const factory OrderHistoryDetailsOrderItemDto({
    @JsonKey(name: 'Type', defaultValue: '')
        required String type,
    @JsonKey(name: 'MaterialCode')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Qty', defaultValue: 0)
        required int qty,
    @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
        required double unitPrice,
    @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
        required double totalPrice,
    @JsonKey(name: 'Tax', defaultValue: 0.0)
        required double tax,
    @JsonKey(name: 'SAPStatus', defaultValue: '')
        required String sAPStatus,
    @JsonKey(name: 'PlannedDeliveryDate', defaultValue: '')
        required String plannedDeliveryDate,
    @JsonKey(name: 'PickedQuantity', defaultValue: 0)
        required int pickedQuantity,
    @JsonKey(name: 'Batch', defaultValue: '')
        required String batch,
    @JsonKey(name: 'ExpiryDate', defaultValue: '')
        required String expiryDate,
    @JsonKey(name: 'LineReferenceNotes', defaultValue: '')
        required String lineReferenceNotes,
    @JsonKey(name: 'IsTenderContractMaterial', defaultValue: false, readValue: boolStringFormatCheck)
        required bool isTenderContractMaterial,
    @JsonKey(
      name: 'Details',
      defaultValue: <OrderHistoryDetailsOrderItemDetailsDto>[],
    )
        required List<OrderHistoryDetailsOrderItemDetailsDto> details,
    @JsonKey(name: 'TenderContractDetails', readValue: orderHistoryDetailsOrderItemTenderContractDetailsOverride)
        required OrderHistoryDetailsOrderItemTenderContractDetailsDto tenderContractDetails,
    @JsonKey(name: 'PrincipalName', defaultValue: '')
        required String principalName,
          @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
  }) = _OrderHistoryDetailsOrderItemDto;
  factory OrderHistoryDetailsOrderItemDto.fromDomain(
    OrderHistoryDetailsOrderItem orderHistoryDetailsOrderItem,
  ) {
    return OrderHistoryDetailsOrderItemDto(
      type: orderHistoryDetailsOrderItem.type.getOrCrash(),
      materialNumber: orderHistoryDetailsOrderItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryDetailsOrderItem.materialDescription,
      qty: orderHistoryDetailsOrderItem.qty,
      unitPrice: orderHistoryDetailsOrderItem.unitPrice.zpPrice,
      totalPrice: orderHistoryDetailsOrderItem.totalPrice.totalPrice,
      tax: orderHistoryDetailsOrderItem.tax,
      sAPStatus: orderHistoryDetailsOrderItem.sAPStatus.displaySAPStatus,
      plannedDeliveryDate:
          orderHistoryDetailsOrderItem.plannedDeliveryDate.dateString,
      pickedQuantity: orderHistoryDetailsOrderItem.pickedQuantity,
      batch: orderHistoryDetailsOrderItem.batch,
      expiryDate: orderHistoryDetailsOrderItem.expiryDate.dateString,
      lineReferenceNotes:
          orderHistoryDetailsOrderItem.lineReferenceNotes.getValue(),
      isTenderContractMaterial:
          orderHistoryDetailsOrderItem.isTenderContractMaterial,
      details: List.from(
        orderHistoryDetailsOrderItem.details,
      )
          .map((e) => OrderHistoryDetailsOrderItemDetailsDto.fromDomain(e))
          .toList(),
      tenderContractDetails:
          OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromDomain(
        orderHistoryDetailsOrderItem.tenderContractDetails,
      ),
      principalName:
          orderHistoryDetailsOrderItem.principalName.getOrDefaultValue(''),
          governmentMaterialCode: orderHistoryDetailsOrderItem.governmentMaterialCode,
    );
  }

  OrderHistoryDetailsOrderItem toDomain() {
    return OrderHistoryDetailsOrderItem(
      type: OrderItemType(type),
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      qty: qty,
      unitPrice: ZpPrice(unitPrice.toString()),
      totalPrice: TotalPrice(totalPrice.toString()),
      tax: tax,
      sAPStatus: SAPStatus(sAPStatus),
      plannedDeliveryDate: DateTimeStringValue(plannedDeliveryDate),
      pickedQuantity: pickedQuantity,
      batch: batch,
      expiryDate: DateTimeStringValue(expiryDate),
      lineReferenceNotes: Remarks(lineReferenceNotes),
      isTenderContractMaterial: isTenderContractMaterial,
      details: details.map((e) => e.toDomain()).toList(),
      tenderContractDetails: OrderHistoryDetailsOrderItemTenderContractDetails(
        tenderContractNumber: tenderContractDetails.tenderContractNumber,
        tenderContractReference: tenderContractDetails.tenderContractReference,
      ),
      principalName: PrincipalName(principalName),
      productImages: ProductImages.empty(),
      governmentMaterialCode:governmentMaterialCode,
    );
  }

  factory OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsOrderItemDtoFromJson(json);
}

Map<String, dynamic> orderHistoryDetailsOrderItemTenderContractDetailsOverride(
  Map json,
  String key,
) =>
    json[key] ?? {};
bool boolStringFormatCheck(Map json, String key) =>
    json[key] == '' ? false : json[key];
