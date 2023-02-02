import 'package:ezrxmobile/domain/returns/entities/approver_return_request_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_return_request_information_dto.freezed.dart';
part 'approver_return_request_information_dto.g.dart';

@freezed
class ApproverReturnRequestInformationDto
    with _$ApproverReturnRequestInformationDto {
  const ApproverReturnRequestInformationDto._();

  factory ApproverReturnRequestInformationDto({
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
  }) = _ApproverReturnRequestInformationDto;

  ApproverReturnRequestInformation toDomain() {
    return ApproverReturnRequestInformation(
      actionRequired: actionRequired,
      approvalTimeStamp: approvalTimeStamp,
      batch: batch,
      division: division,
      createdDate: createdDate,
      invoiceNo: invoiceNo,
      cnNumber: cnNumber,
      bapiStatus: bapiStatus,
      eZRxNumber: eZRxNumber,
      expiryDate: expiryDate,
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
      priceDate: priceDate,
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
      comment: comment,
      totalPrice: totalPrice,
      unitPrice: unitPrice,
      storageLocation: storageLocation,
      statusReason: statusReason,
      status: status,
      returnType: returnType,
      returnValue: returnValue,
      createdTimeStamp: createdTimeStamp,
      billingItemNumber: billingItemNumber,
      returnQuantity: returnQuantity,
      sendForDestruction: sendForDestruction,
      materialGroup: materialGroup,
      attachmentUrl: attachmentUrl,
      attachments: attachments,
      materialNumber: materialNumber,
      imageUrl: imageUrl,
      overrideType: overrideType,
      overrideValue: overrideValue,
      priceOverride: priceOverride,
      purchaseNumberCOverride: purchaseNumberCOverride,
      referenceDocument: referenceDocument,
      refundCurrency: refundCurrency,
      salesDocumentItemNumber: salesDocumentItemNumber,
    );
  }

  factory ApproverReturnRequestInformationDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApproverReturnRequestInformationDtoFromJson(json);
}
