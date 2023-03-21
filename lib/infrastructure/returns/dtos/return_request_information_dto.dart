import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_information_dto.freezed.dart';
part 'return_request_information_dto.g.dart';

@freezed
class ReturnRequestInformationDto with _$ReturnRequestInformationDto {
  const ReturnRequestInformationDto._();

  factory ReturnRequestInformationDto({
    @JsonKey(name: 'invoiceNo', defaultValue: '') required String invoiceNo,
    @JsonKey(name: 'returnValue', defaultValue: '') required String returnValue,
    @JsonKey(name: 'actionRequired', defaultValue: <String>[])
        required List<String> actionRequired,
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
    @JsonKey(name: 'imageUrl', defaultValue: <String>[])
        required List<String> imageUrl,
    @JsonKey(name: 'attachmentUrl', defaultValue: <String>[])
        required List<String> attachmentUrl,
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
    @JsonKey(name: 'quarantine', defaultValue: false) required bool quarantine,
    @JsonKey(name: 'returnToStock', defaultValue: false)
        required bool returnToStock,
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
    @JsonKey(name: 'attachments', defaultValue: <String>[])
        required List<String> attachments,
  }) = _ReturnRequestInformationDto;
  factory ReturnRequestInformationDto.fromDomain(
    ReturnRequestInformation requestInformation,
  ) {
    return ReturnRequestInformationDto(
      actionRequired: requestInformation.actionRequired,
      approvalTimeStamp: requestInformation.approvalTimeStamp,
      batch: requestInformation.batch,
      division: requestInformation.division,
      createdDate: requestInformation.createdDate.getOrCrash(),
      invoiceNo: requestInformation.invoiceNo,
      cnNumber: requestInformation.cnNumber,
      bapiStatus: requestInformation.bapiStatus,
      eZRxNumber: requestInformation.eZRxNumber,
      expiryDate: requestInformation.expiryDate.getOrCrash(),
      exchangeOrder: requestInformation.exchangeOrder,
      bapiSalesDocNumber: requestInformation.bapiSalesDocNumber,
      materialDescription: requestInformation.materialDescription,
      orderReason: requestInformation.orderReason,
      plant: requestInformation.plant,
      ppaHeld: requestInformation.ppaHeld,
      poDate: requestInformation.poDate,
      purchaseNumberC: requestInformation.purchaseNumberC,
      outsidePolicy: requestInformation.outsidePolicy,
      highLevelItemCode: requestInformation.highLevelItemCode,
      returnToStock: requestInformation.returnToStock,
      docType: requestInformation.docType,
      remarks: requestInformation.remarks,
      principal: requestInformation.principal,
      priceDate: requestInformation.priceDate.getOrCrash(),
      returnOrderText: requestInformation.returnOrderText,
      quarantine: requestInformation.quarantine,
      returnTypeDesc: requestInformation.returnTypeDesc,
      exchangeOrderNumber: requestInformation.exchangeOrderNumber,
      rejectReason: requestInformation.rejectReason,
      productRecall: requestInformation.productRecall,
      salesDocument: requestInformation.salesDocument,
      returnOrderDesc: requestInformation.returnOrderDesc,
      usage: requestInformation.usage,
      distributionChannel: requestInformation.distributionChannel,
      purchaseMethod: requestInformation.purchaseMethod,
      comment: requestInformation.comment.getOrCrash(),
      storageLocation: requestInformation.storageLocation,
      statusReason: requestInformation.statusReason,
      returnType: requestInformation.returnType,
      returnValue: requestInformation.returnValue,
      createdTimeStamp: requestInformation.createdTimeStamp,
      billingItemNumber: requestInformation.billingItemNumber,
      returnQuantity: requestInformation.returnQuantity,
      sendForDestruction: requestInformation.sendForDestruction,
      materialGroup: requestInformation.materialGroup,
      attachmentUrl: requestInformation.attachmentUrl,
      attachments: requestInformation.attachments,
      materialNumber: requestInformation.materialNumber.getOrCrash(),
      imageUrl: requestInformation.imageUrl,
      overrideType: requestInformation.overrideType,
      overrideValue: requestInformation.overrideValue.getOrCrash(),
      priceOverride: requestInformation.priceOverride,
      purchaseNumberCOverride: requestInformation.purchaseNumberCOverride,
      referenceDocument: requestInformation.referenceDocument,
      refundCurrency: requestInformation.refundCurrency,
      salesDocumentItemNumber: requestInformation.salesDocumentItemNumber,
      status: requestInformation.status.getOrCrash(),
      unitPrice: requestInformation.unitPrice.toString(),
      totalPrice: requestInformation.totalPrice.toString(),
    );
  }
  ReturnRequestInformation toDomain() {
    return ReturnRequestInformation(
      actionRequired: actionRequired,
      approvalTimeStamp: approvalTimeStamp,
      batch: batch,
      division: division,
      createdDate: DateTimeStringValue(createdDate),
      invoiceNo: invoiceNo,
      cnNumber: cnNumber,
      bapiStatus: bapiStatus,
      eZRxNumber: eZRxNumber,
      expiryDate: DateTimeStringValue(expiryDate),
      exchangeOrder: exchangeOrder,
      bapiSalesDocNumber: bapiSalesDocNumber,
      materialDescription: materialDescription,
      orderReason: orderReason,
      plant: plant,
      ppaHeld: ppaHeld,
      poDate: poDate,
      purchaseNumberC: purchaseNumberC,
      outsidePolicy: outsidePolicy,
      highLevelItemCode: highLevelItemCode,
      returnToStock: returnToStock,
      docType: docType,
      remarks: remarks,
      principal: principal,
      priceDate: DateTimeStringValue(priceDate),
      returnOrderText: returnOrderText,
      quarantine: quarantine,
      returnTypeDesc: returnTypeDesc,
      exchangeOrderNumber: exchangeOrderNumber,
      rejectReason: rejectReason,
      productRecall: productRecall,
      salesDocument: salesDocument,
      returnOrderDesc: returnOrderDesc,
      usage: usage,
      distributionChannel: distributionChannel,
      purchaseMethod: purchaseMethod,
      comment: StringValue(comment),
      totalPrice: double.parse(totalPrice),
      unitPrice: double.parse(unitPrice),
      storageLocation: storageLocation,
      statusReason: statusReason,
      status: ReturnSummaryStatus(status),
      returnType: returnType,
      returnValue: returnValue,
      createdTimeStamp: createdTimeStamp,
      billingItemNumber: billingItemNumber,
      returnQuantity: returnQuantity,
      sendForDestruction: sendForDestruction,
      materialGroup: materialGroup,
      attachmentUrl: attachmentUrl,
      attachments: attachments,
      materialNumber: MaterialNumber(materialNumber),
      imageUrl: imageUrl,
      overrideType: overrideType,
      overrideValue: StringValue(overrideValue),
      priceOverride: priceOverride,
      purchaseNumberCOverride: purchaseNumberCOverride,
      referenceDocument: referenceDocument,
      refundCurrency: refundCurrency,
      salesDocumentItemNumber: salesDocumentItemNumber,
    );
  }

  factory ReturnRequestInformationDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReturnRequestInformationDtoFromJson(json);
}
