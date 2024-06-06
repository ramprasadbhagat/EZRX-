import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
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
    @JsonKey(name: 'mrp', defaultValue: 0.0) required double originPrice,
    @JsonKey(name: 'TotalPrice', defaultValue: 0.0) required double totalPrice,
    @JsonKey(name: 'Status', defaultValue: '') required String status,
    @JsonKey(name: 'DeliveryDate', defaultValue: '')
    required String deliveryDate,
    @JsonKey(name: 'OrderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(readValue: _createdDateTimeReadValue) required String createdDate,
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
    @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
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
    @JsonKey(name: 'isCounterOffer', defaultValue: false)
    required bool isCounterOffer,
    @JsonKey(name: 'IsBundle', defaultValue: false) required bool isBundle,
    @JsonKey(name: 'LineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(name: 'PrincipalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'HidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'referenceNotes', defaultValue: '')
    required String referenceNotes,
    @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
    required bool isMarketPlace,
    @JsonKey(name: 'TenderContractNumber', defaultValue: '')
    required String tenderContractNumber,
    @JsonKey(name: 'TenderContractReference', defaultValue: '')
    required String tenderContractReference,
    @JsonKey(name: 'TenderOrderReason', defaultValue: '')
    required String tenderOrderReason,
    @JsonKey(name: 'TenderPriceUnit', defaultValue: 0)
    required int tenderPriceUnit,
    @JsonKey(name: 'TenderPrice', defaultValue: '') required String tenderPrice,
    @JsonKey(name: 'isTenderExpire', defaultValue: false)
    required bool isTenderExpired,
    @JsonKey(name: 'isCovid', defaultValue: false) required bool isCovid,
    @JsonKey(name: 'TotalUnitPrice', defaultValue: 0.0)
    required double totalUnitPrice,
    @JsonKey(name: 'TotalTax', defaultValue: 0.0) required double totalTax,
    @JsonKey(name: 'TaxRate', readValue: handleTax) required double taxRate,
  }) = _OrderHistoryItemDto;

  factory OrderHistoryItemDto.fromDomain(OrderHistoryItem orderHistoryItem) {
    return OrderHistoryItemDto(
      materialNumber: orderHistoryItem.materialNumber.displayMatNo,
      materialDescription: orderHistoryItem.materialDescription,
      qty: orderHistoryItem.qty,
      unitPrice: orderHistoryItem.unitPrice,
      originPrice: orderHistoryItem.originPrice,
      totalPrice: orderHistoryItem.totalPrice,
      status: orderHistoryItem.status.getOrCrash(),
      deliveryDate: orderHistoryItem.deliveryDate.dateString,
      orderNumber: orderHistoryItem.orderNumber.getOrCrash(),
      createdDate: orderHistoryItem.createdDate.dateString,
      tax: orderHistoryItem.tax,
      batch: orderHistoryItem.batch.getOrCrash(),
      orderBy: orderHistoryItem.orderBy.getOrDefaultValue(''),
      orderType: orderHistoryItem.orderType.getOrCrash(),
      isBonusMaterial: orderHistoryItem.isBonusMaterial,
      telephoneNumber: orderHistoryItem.telephoneNumber.displayTelephoneNumber,
      invoiceNumber: orderHistoryItem.invoiceNumber.getOrDefaultValue(''),
      pOReference: orderHistoryItem.pOReference.displayPOReference,
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
      isCounterOffer: orderHistoryItem.isCounterOffer,
      lineNumber: orderHistoryItem.lineNumber.getOrDefaultValue(''),
      principalCode:
          orderHistoryItem.principalData.principalCode.getOrDefaultValue(''),
      manufactureName:
          orderHistoryItem.principalData.principalName.getOrDefaultValue(''),
      governmentMaterialCode: orderHistoryItem.governmentMaterialCode,
      itemRegistrationNumber:
          orderHistoryItem.itemRegistrationNumber.getOrDefaultValue(''),
      hidePrice: orderHistoryItem.hidePrice,
      referenceNotes: orderHistoryItem.referenceNotes.getOrDefaultValue(''),
      isMarketPlace: orderHistoryItem.isMarketPlace,
      tenderContractNumber:
          orderHistoryItem.tenderContractNumber.getOrDefaultValue(''),
      tenderContractReference:
          orderHistoryItem.tenderContractReference.getOrDefaultValue(''),
      tenderPriceUnit: orderHistoryItem.tenderPriceUnit,
      tenderPrice: orderHistoryItem.tenderPrice.getOrDefaultValue(''),
      tenderOrderReason:
          orderHistoryItem.tenderOrderReason.getOrDefaultValue(''),
      isTenderExpired: orderHistoryItem.isTenderExpired,
      isCovid: orderHistoryItem.isCovid,
      taxRate: orderHistoryItem.taxRate,
      totalTax: orderHistoryItem.totalTax,
      totalUnitPrice: orderHistoryItem.totalUnitPrice,
    );
  }
  OrderHistoryItem toDomain() {
    return OrderHistoryItem(
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      qty: qty,
      unitPrice: unitPrice,
      originPrice: originPrice,
      totalPrice: totalPrice,
      status: OrderStepValue(status),
      deliveryDate: DateTimeStringValue(deliveryDate),
      orderNumber: OrderNumber(orderNumber),
      createdDate: DateTimeStringValue(createdDate),
      tax: tax,
      batch: StringValue(batch),
      orderBy: StringValue(orderBy),
      orderType: DocumentType(orderType),
      expiryDate: DateTimeStringValue(expiryDate),
      invoiceNumber: StringValue(invoiceNumber),
      isBonusMaterial: isBonusMaterial,
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
      isCounterOffer: isCounterOffer,
      lineNumber: LineNumber(lineNumber),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(manufactureName),
        principalCode: PrincipalCode(principalCode),
      ),
      governmentMaterialCode: governmentMaterialCode,
      itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
      hidePrice: hidePrice,
      referenceNotes: StringValue(referenceNotes),
      isMarketPlace: isMarketPlace,
      tenderContractNumber:
          TenderContractNumber.tenderContractNumber(tenderContractNumber),
      tenderContractReference:
          TenderContractNumber.tenderContractReference(tenderContractReference),
      tenderPriceUnit: tenderPriceUnit,
      tenderPrice: TenderPrice(tenderPrice),
      tenderOrderReason: TenderContractReason(tenderOrderReason),
      isTenderExpired: isTenderExpired,
      isCovid: isCovid,
      taxRate: taxRate,
      totalTax: totalTax,
      totalUnitPrice: totalUnitPrice,
    );
  }

  factory OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemDtoFromJson(json);
}

String _createdDateTimeReadValue(Map json, String _) {
  final createdDate = json['CreatedDate'] ?? '';
  final createdTime = json['CreatedTime'] ?? '';

  // Concatenation is necessary to convert 'createdDate' and 'createdTime' into
  // the 'yyyyMMddHHmmss' format.
  return '$createdDate$createdTime';
}
