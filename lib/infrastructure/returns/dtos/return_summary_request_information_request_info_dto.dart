import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_request_info.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_request_information_request_info_dto.freezed.dart';
part 'return_summary_request_information_request_info_dto.g.dart';

@freezed
class RequestInfoDto with _$RequestInfoDto {
  const RequestInfoDto._();

  const factory RequestInfoDto({
    @JsonKey(name: 'invoiceNo', defaultValue: '') required String invoiceNo,
    @JsonKey(name: 'returnValue', defaultValue: '') required String returnValue,
    @JsonKey(name: 'actionRequired', defaultValue: [])
        required List actionRequired,
    @JsonKey(name: 'expiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
    @JsonKey(name: 'salesDocument', defaultValue: '')
        required String salesDocument,
    @JsonKey(name: 'exchangeOrder', defaultValue: '')
        required String exchangeOrder,
    @JsonKey(name: 'refundCurrency', defaultValue: '')
        required String refundCurrency,
    @JsonKey(name: 'rejectReason', defaultValue: '')
        required String rejectReason,
    @JsonKey(name: 'exchangeOrderNumber', defaultValue: '')
        required String exchangeOrderNumber,
    @JsonKey(name: 'docType', defaultValue: '') required String docType,
    @JsonKey(name: 'referenceDocument', defaultValue: '')
        required String referenceDocument,
    @JsonKey(name: 'division', defaultValue: '') required String division,
    @JsonKey(name: 'purchaseMethod', defaultValue: '')
        required String purchaseMethod,
    @JsonKey(name: 'usage', defaultValue: '') required String usage,
    @JsonKey(name: 'distributionChannel', defaultValue: '')
        required String distributionChannel,
    @JsonKey(name: 'approvalTimeStamp', defaultValue: '')
        required String approvalTimeStamp,
    @JsonKey(name: 'createdTimeStamp', defaultValue: '')
        required String createdTimeStamp,
    @JsonKey(name: 'poDate', defaultValue: '') required String poDate,
    @JsonKey(name: 'returnQuantity', defaultValue: '')
        required String returnQuantity,
    @JsonKey(name: 'unitPrice', defaultValue: '') required String unitPrice,
    @JsonKey(name: 'totalPrice', defaultValue: '') required String totalPrice,
    @JsonKey(name: 'billingItemNumber', defaultValue: '')
        required String billingItemNumber,
    @JsonKey(name: 'salesDocumentItemNumber', defaultValue: '')
        required String salesDocumentItemNumber,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'batch', defaultValue: '') required String batch,
    @JsonKey(name: 'materialGroup', defaultValue: '')
        required String materialGroup,
    @JsonKey(name: 'imageUrl', defaultValue: [])
        required List imageUrl,
    @JsonKey(name: 'attachmentUrl', defaultValue: [])
        required List attachmentUrl,
    @JsonKey(name: 'plant', defaultValue: '') required String plant,
    @JsonKey(name: 'storageLocation', defaultValue: '')
        required String storageLocation,
    @JsonKey(name: 'highLevelItemCode', defaultValue: '')
        required String highLevelItemCode,
    @JsonKey(name: 'orderReason', defaultValue: '') required String orderReason,
    @JsonKey(name: 'priceDate', defaultValue: '') required String priceDate,
    @JsonKey(name: 'createdDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'overrideType', defaultValue: '')
        required String overrideType,
    @JsonKey(name: 'overrideValue', defaultValue: '')
        required String overrideValue,
    @JsonKey(name: 'returnOrderText', defaultValue: '')
        required String returnOrderText,
    @JsonKey(name: 'returnOrderDesc', defaultValue: '')
        required String returnOrderDesc,
    @JsonKey(name: 'principal', defaultValue: '') required String principal,
    @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
        required String bapiSalesDocNumber,
    @JsonKey(name: 'eZRxNumber', defaultValue: '') required String eZRxNumber,
    @JsonKey(name: 'bapiStatus', defaultValue: '') required String bapiStatus,
    @JsonKey(name: 'cnNumber', defaultValue: '') required String cnNumber,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'statusReason', defaultValue: '')
        required String statusReason,
    @JsonKey(name: 'priceOverride', defaultValue: '')
        required String priceOverride,
    @JsonKey(name: 'remarks', defaultValue: '') required String remarks,
    @JsonKey(name: 'sendForDestruction', defaultValue: false)
        required bool sendForDestruction,
    @JsonKey(name: 'returnToStock', defaultValue: false)
        required bool returnToStock,
    @JsonKey(name: 'quarantine', defaultValue: false) required bool quarantine,
    @JsonKey(name: 'productRecall', defaultValue: false)
        required bool productRecall,
    @JsonKey(name: 'returnType', defaultValue: '') required String returnType,
    @JsonKey(name: 'returnTypeDesc', defaultValue: '')
        required String returnTypeDesc,
    @JsonKey(name: 'purchaseNumberCOverride', defaultValue: '')
        required String purchaseNumberCOverride,
    @JsonKey(name: 'purchaseNumberC', defaultValue: '')
        required String purchaseNumberC,
    @JsonKey(name: 'ppaHeld', defaultValue: false) required bool ppaHeld,
    @JsonKey(name: 'outsidePolicy', defaultValue: false)
        required bool outsidePolicy,
  }) = _RequestInfoDto;

  factory RequestInfoDto.fromDomain(RequestInfo requestInfo) {
    return RequestInfoDto(
      invoiceNo: requestInfo.invoiceNumber,
      returnValue: requestInfo.returnValue,
      actionRequired: requestInfo.actionRequired,
      expiryDate: requestInfo.expiryDate,
      comment: requestInfo.comment,
      salesDocument: requestInfo.salesDocument,
      exchangeOrder: requestInfo.exchangeOrder,
      refundCurrency: requestInfo.refundCurrency,
      rejectReason: requestInfo.rejectReason,
      exchangeOrderNumber: requestInfo.exchangeOrderNumber,
      docType: requestInfo.docType,
      referenceDocument: requestInfo.referenceDocument,
      division: requestInfo.division,
      purchaseMethod: requestInfo.purchaseMethod,
      usage: requestInfo.usage,
      distributionChannel: requestInfo.distributionChannel,
      approvalTimeStamp: requestInfo.approvalTimeStamp,
      createdTimeStamp: requestInfo.createdTimeStamp,
      poDate: requestInfo.poDate,
      returnQuantity: requestInfo.returnQuantity,
      unitPrice: requestInfo.unitPrice.toString(),
      totalPrice: requestInfo.totalPrice.toString(),
      billingItemNumber: requestInfo.billingItemNumber,
      salesDocumentItemNumber: requestInfo.salesDocumentItemNumber,
      materialNumber: requestInfo.materialNumber,
      materialDescription: requestInfo.materialDescription,
      batch: requestInfo.batch,
      materialGroup: requestInfo.materialGroup,
      imageUrl:requestInfo.imageUrl,
      attachmentUrl: requestInfo.attachmentUrl,
      plant: requestInfo.plant,
      storageLocation: requestInfo.storageLocation,
      highLevelItemCode: requestInfo.highLevelItemCode,
      orderReason: requestInfo.orderReason,
      priceDate: requestInfo.priceDate,
      createdDate: requestInfo.createdDate,
      overrideType: requestInfo.overrideType,
      overrideValue: requestInfo.overrideValue,
      returnOrderText: requestInfo.returnOrderText,
      returnOrderDesc: requestInfo.returnOrderDesc,
      principal: requestInfo.principal,
      bapiSalesDocNumber: requestInfo.bapiSalesDocNumber,
      eZRxNumber: requestInfo.eZRxNumber,
      bapiStatus: requestInfo.bapiStatus,
      cnNumber: requestInfo.cnNumber,
      status: requestInfo.status.getOrCrash(),
      statusReason: requestInfo.statusReason,
      priceOverride: requestInfo.priceOverride,
      remarks: requestInfo.remarks,
      sendForDestruction: requestInfo.sendForDestruction,
      returnToStock: requestInfo.returnToStock,
      quarantine: requestInfo.quarantine,
      productRecall: requestInfo.productRecall,
      returnType: requestInfo.returnType,
      returnTypeDesc: requestInfo.returnTypeDesc,
      purchaseNumberCOverride: requestInfo.purchaseNumberCOverride,
      purchaseNumberC: requestInfo.purchaseNumberC,
      ppaHeld: requestInfo.ppaHeld,
      outsidePolicy: requestInfo.outsidePolicy,
    );
  }

  RequestInfo toDomain() {
    return RequestInfo(
      invoiceNumber: invoiceNo,
      returnValue: returnValue,
      actionRequired: actionRequired.map((e) => e.toDomain()).toList(),
      expiryDate: expiryDate,
      comment: comment,
      salesDocument: salesDocument,
      exchangeOrder: exchangeOrder,
      refundCurrency: refundCurrency,
      rejectReason: rejectReason,
      exchangeOrderNumber: exchangeOrderNumber,
      docType: docType,
      referenceDocument: referenceDocument,
      division: division,
      purchaseMethod: purchaseMethod,
      usage: usage,
      distributionChannel: distributionChannel,
      approvalTimeStamp: approvalTimeStamp,
      createdTimeStamp: createdTimeStamp,
      poDate: poDate,
      returnQuantity: returnQuantity,
      unitPrice: double.parse(unitPrice),
      totalPrice: double.parse(totalPrice),
      billingItemNumber: billingItemNumber,
      salesDocumentItemNumber: salesDocumentItemNumber,
      materialNumber: materialNumber,
      materialDescription: materialDescription,
      batch: batch,
      materialGroup: materialGroup,
      imageUrl: imageUrl.map((e) => e.toDomain()).toList(),
      attachmentUrl: attachmentUrl.map((e) => e.toDomain()).toList(),
      plant: plant,
      storageLocation: storageLocation,
      highLevelItemCode: highLevelItemCode,
      orderReason: orderReason,
      priceDate: priceDate,
      createdDate: createdDate,
      overrideType: overrideType,
      overrideValue: overrideValue,
      returnOrderText: returnOrderText,
      returnOrderDesc: returnOrderDesc,
      principal: principal,
      bapiSalesDocNumber: bapiSalesDocNumber,
      eZRxNumber: eZRxNumber,
      bapiStatus: bapiStatus,
      cnNumber: cnNumber,
      status: ReturnSummaryStatus(status),
      statusReason: statusReason,
      priceOverride: priceOverride,
      remarks: remarks,
      sendForDestruction: sendForDestruction,
      returnToStock: returnToStock,
      quarantine: quarantine,
      productRecall: productRecall,
      returnType: returnType,
      returnTypeDesc: returnTypeDesc,
      purchaseNumberCOverride: purchaseNumberCOverride,
      purchaseNumberC: purchaseNumberC,
      ppaHeld: ppaHeld,
      outsidePolicy: outsidePolicy,
    );
  }

  factory RequestInfoDto.fromJson(Map<String, dynamic> json) =>
      _$RequestInfoDtoFromJson(json);
}
