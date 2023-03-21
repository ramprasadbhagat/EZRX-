// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnRequestInformationDto _$$_ReturnRequestInformationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnRequestInformationDto(
      invoiceNo: json['invoiceNo'] as String? ?? '',
      returnValue: json['returnValue'] as String? ?? '',
      actionRequired: (json['actionRequired'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      expiryDate: json['expiryDate'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      salesDocument: json['salesDocument'] as String? ?? '',
      exchangeOrder: json['exchangeOrder'] as String? ?? '',
      refundCurrency: json['refundCurrency'] as String? ?? '',
      rejectReason: json['rejectReason'] as String? ?? '',
      exchangeOrderNumber: json['exchangeOrderNumber'] as String? ?? '',
      docType: json['docType'] as String? ?? '',
      referenceDocument: json['referenceDocument'] as String? ?? '',
      division: json['division'] as String? ?? '',
      purchaseMethod: json['purchaseMethod'] as String? ?? '',
      usage: json['usage'] as String? ?? '',
      distributionChannel: json['distributionChannel'] as String? ?? '',
      approvalTimeStamp: json['approvalTimeStamp'] as String? ?? '',
      createdTimeStamp: json['createdTimeStamp'] as String? ?? '',
      poDate: json['poDate'] as String? ?? '',
      returnQuantity: json['returnQuantity'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      billingItemNumber: json['billingItemNumber'] as String? ?? '',
      salesDocumentItemNumber: json['salesDocumentItemNumber'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      imageUrl: (json['imageUrl'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      attachmentUrl: (json['attachmentUrl'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      plant: json['plant'] as String? ?? '',
      storageLocation: json['storageLocation'] as String? ?? '',
      highLevelItemCode: json['highLevelItemCode'] as String? ?? '',
      orderReason: json['orderReason'] as String? ?? '',
      priceDate: json['priceDate'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      overrideType: json['overrideType'] as String? ?? '',
      overrideValue: json['overrideValue'] as String? ?? '',
      returnOrderText: json['returnOrderText'] as String? ?? '',
      returnOrderDesc: json['returnOrderDesc'] as String? ?? '',
      principal: json['principal'] as String? ?? '',
      bapiSalesDocNumber: json['bapiSalesDocNumber'] as String? ?? '',
      eZRxNumber: json['eZRxNumber'] as String? ?? '',
      bapiStatus: json['bapiStatus'] as String? ?? '',
      cnNumber: json['cnNumber'] as String? ?? '',
      status: json['status'] as String? ?? '',
      statusReason: json['statusReason'] as String? ?? '',
      priceOverride: json['priceOverride'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      sendForDestruction: json['sendForDestruction'] as bool? ?? false,
      quarantine: json['quarantine'] as bool? ?? false,
      returnToStock: json['returnToStock'] as bool? ?? false,
      productRecall: json['productRecall'] as bool? ?? false,
      returnType: json['returnType'] as String? ?? '',
      returnTypeDesc: json['returnTypeDesc'] as String? ?? '',
      purchaseNumberCOverride: json['purchaseNumberCOverride'] as String? ?? '',
      purchaseNumberC: json['purchaseNumberC'] as String? ?? '',
      ppaHeld: json['ppaHeld'] as bool? ?? false,
      outsidePolicy: json['outsidePolicy'] as bool? ?? false,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ReturnRequestInformationDtoToJson(
        _$_ReturnRequestInformationDto instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'returnValue': instance.returnValue,
      'actionRequired': instance.actionRequired,
      'expiryDate': instance.expiryDate,
      'comment': instance.comment,
      'salesDocument': instance.salesDocument,
      'exchangeOrder': instance.exchangeOrder,
      'refundCurrency': instance.refundCurrency,
      'rejectReason': instance.rejectReason,
      'exchangeOrderNumber': instance.exchangeOrderNumber,
      'docType': instance.docType,
      'referenceDocument': instance.referenceDocument,
      'division': instance.division,
      'purchaseMethod': instance.purchaseMethod,
      'usage': instance.usage,
      'distributionChannel': instance.distributionChannel,
      'approvalTimeStamp': instance.approvalTimeStamp,
      'createdTimeStamp': instance.createdTimeStamp,
      'poDate': instance.poDate,
      'returnQuantity': instance.returnQuantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'billingItemNumber': instance.billingItemNumber,
      'salesDocumentItemNumber': instance.salesDocumentItemNumber,
      'materialNumber': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'batch': instance.batch,
      'materialGroup': instance.materialGroup,
      'imageUrl': instance.imageUrl,
      'attachmentUrl': instance.attachmentUrl,
      'plant': instance.plant,
      'storageLocation': instance.storageLocation,
      'highLevelItemCode': instance.highLevelItemCode,
      'orderReason': instance.orderReason,
      'priceDate': instance.priceDate,
      'createdDate': instance.createdDate,
      'overrideType': instance.overrideType,
      'overrideValue': instance.overrideValue,
      'returnOrderText': instance.returnOrderText,
      'returnOrderDesc': instance.returnOrderDesc,
      'principal': instance.principal,
      'bapiSalesDocNumber': instance.bapiSalesDocNumber,
      'eZRxNumber': instance.eZRxNumber,
      'bapiStatus': instance.bapiStatus,
      'cnNumber': instance.cnNumber,
      'status': instance.status,
      'statusReason': instance.statusReason,
      'priceOverride': instance.priceOverride,
      'remarks': instance.remarks,
      'sendForDestruction': instance.sendForDestruction,
      'quarantine': instance.quarantine,
      'returnToStock': instance.returnToStock,
      'productRecall': instance.productRecall,
      'returnType': instance.returnType,
      'returnTypeDesc': instance.returnTypeDesc,
      'purchaseNumberCOverride': instance.purchaseNumberCOverride,
      'purchaseNumberC': instance.purchaseNumberC,
      'ppaHeld': instance.ppaHeld,
      'outsidePolicy': instance.outsidePolicy,
      'attachments': instance.attachments,
    };
